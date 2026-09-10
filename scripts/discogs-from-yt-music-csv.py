#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.9"
# dependencies = ["requests"]
# ///
import argparse
import csv
import re
import time
import webbrowser
import requests


def get_headers(token):
    return {
        "User-Agent": "YTM-Takeout-Script/1.1",
        "Authorization": f"Discogs token={token}",
    }


def check_token(headers):
    response = requests.get("https://api.discogs.com/oauth/identity", headers=headers)
    if response.status_code != 200:
        raise SystemExit(f"Discogs token check failed ({response.status_code}): {response.text}")
    return response.json()["username"]


def api_get(url, headers, params=None):
    response = requests.get(url, headers=headers, params=params)

    if response.status_code == 429:
        print("Rate limit reached. Pausing for 60 seconds...")
        time.sleep(60)
        return api_get(url, headers, params)

    response.raise_for_status()
    return response


def get_discogs_info(artist, album, headers):
    params = {
        "artist": artist,
        "release_title": album,
        "type": "master",  # Prioritizes main album/release pages over specific CD/Vinyl variants
    }

    try:
        response = api_get("https://api.discogs.com/database/search", headers, params)
        results = response.json().get("results", [])

        if not results:
            return {"link": "Not Found", "release_id": "", "master_id": ""}

        master_id = results[0]["id"]
        link = f"https://www.discogs.com{results[0].get('uri')}"

        # Wantlist needs a release id, the search above only gives the master id
        time.sleep(1.1)
        master_response = api_get(f"https://api.discogs.com/masters/{master_id}", headers)
        release_id = master_response.json().get("main_release", "")

        return {"link": link, "release_id": release_id, "master_id": master_id}

    except requests.exceptions.RequestException:
        return {"link": "API Error", "release_id": "", "master_id": ""}


def extract_master_id(link):
    match = re.search(r"/master/(\d+)", link)
    return match.group(1) if match else None


def get_main_release(master_id, headers):
    response = api_get(f"https://api.discogs.com/masters/{master_id}", headers)
    return response.json().get("main_release", "")


def get_release_ids_for_format(master_id, fmt, headers, limit):
    release_ids = []
    page = 1

    while len(release_ids) < limit:
        response = api_get(
            f"https://api.discogs.com/masters/{master_id}/versions",
            headers,
            {"format": fmt, "per_page": 100, "page": page},
        )
        data = response.json()
        release_ids.extend(version["id"] for version in data.get("versions", []))

        if page >= data.get("pagination", {}).get("pages", 1):
            break
        page += 1
        time.sleep(1.1)

    return release_ids[:limit]


def get_existing_wantlist(username, headers):
    release_ids = set()
    page = 1

    while True:
        response = api_get(f"https://api.discogs.com/users/{username}/wants", headers, {"per_page": 100, "page": page})
        data = response.json()
        release_ids.update(str(want["id"]) for want in data.get("wants", []))

        if page >= data.get("pagination", {}).get("pages", 1):
            break
        page += 1
        time.sleep(1.1)

    return release_ids


def add_to_wantlist(release_id, username, headers):
    url = f"https://api.discogs.com/users/{username}/wants/{release_id}"
    response = requests.put(url, headers=headers)

    if response.status_code == 429:
        print("Rate limit reached. Pausing for 60 seconds...")
        time.sleep(60)
        return add_to_wantlist(release_id, username, headers)

    time.sleep(1.1)

    if response.status_code not in (200, 201):
        print(f"  Failed to add {release_id} to wantlist ({response.status_code}): {response.text}")
        return False
    return True


def open_in_batches(links, batch_size):
    for i in range(0, len(links), batch_size):
        for link in links[i : i + batch_size]:
            webbrowser.open(link)
            time.sleep(1)

        if i + batch_size < len(links):
            answer = input("Opened a batch. Press Enter to continue, 's' to stop: ").strip().lower()
            if answer == "s":
                break


def write_report(output_csv, rows):
    fieldnames = list(rows[0].keys())
    with open(output_csv, mode="w", encoding="utf-8", newline="") as outfile:
        writer = csv.DictWriter(outfile, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)


def report_links(rows, open_batch_size, wantlist, headers, fmt, limit, output_csv, resume_from):
    found = [row for row in rows if row["Discogs Link"].startswith("http")]
    for row in rows:
        row.setdefault("Wantlist Status", "")

    if resume_from:
        if resume_from.isdigit() and int(resume_from) <= len(found):
            index = int(resume_from) - 1
        else:
            index = next((i for i, row in enumerate(found) if resume_from in row["Discogs Link"] or resume_from == row.get("Video ID")), None)
        if index is None:
            raise SystemExit(f"--resume-from {resume_from!r} did not match any row")
        found = found[index:]
        found[0]["Wantlist Status"] = ""

    pending = [row for row in found if not row["Wantlist Status"]] if wantlist else found

    print("\nFound links:")
    for row in pending:
        print(f"{row['Artist Name 1']} - {row['Album Title']}: {row['Discogs Link']}")
    if wantlist and len(pending) < len(found):
        print(f"({len(found) - len(pending)} already processed, skipping)")

    if open_batch_size:
        open_in_batches([row["Discogs Link"] for row in found], open_batch_size)

    if wantlist:
        username = check_token(headers)
        existing = get_existing_wantlist(username, headers)
        formats = [f.strip() for f in fmt.split(",") if f.strip()] if fmt else []
        added, failed, skipped, already = 0, 0, 0, 0

        for row in found:
            if row["Wantlist Status"]:
                continue

            master_id = row.get("Master ID", "").strip() or extract_master_id(row["Discogs Link"]) or ""
            release_ids = []

            try:
                for wanted_format in formats:
                    if not master_id:
                        break
                    alt_ids = get_release_ids_for_format(master_id, wanted_format, headers, limit)
                    time.sleep(1.1)
                    if alt_ids:
                        release_ids.extend((str(alt_id), wanted_format) for alt_id in alt_ids)
                    else:
                        print(f"  No {wanted_format} version found for {row['Artist Name 1']} - {row['Album Title']}")

                if not release_ids:
                    release_id = row.get("Release ID", "").strip()
                    if not release_id and master_id:
                        release_id = str(get_main_release(master_id, headers) or "")
                        time.sleep(1.1)
                    release_ids = [(release_id, "main release")]
            except requests.exceptions.RequestException as e:
                print(f"  Skipping {row['Artist Name 1']} - {row['Album Title']}: lookup failed ({e})")
                skipped += 1
                row["Wantlist Status"] = "failed: lookup error"
                write_report(output_csv, rows)
                continue

            outcomes = []
            for release_id, release_format in release_ids:
                if not release_id:
                    print(f"  Skipping {row['Artist Name 1']} - {row['Album Title']}: no release id")
                    skipped += 1
                    outcomes.append(f"{release_format}: no release id")
                    continue
                if release_id in existing:
                    already += 1
                    outcomes.append(f"{release_format}: already in wantlist")
                    continue
                print(f"Adding {row['Artist Name 1']} - {row['Album Title']} ({release_format}) to wantlist...")
                if add_to_wantlist(release_id, username, headers):
                    added += 1
                    existing.add(release_id)
                    outcomes.append(f"{release_format}: added")
                else:
                    failed += 1
                    outcomes.append(f"{release_format}: failed")

            row["Wantlist Status"] = "; ".join(outcomes)
            write_report(output_csv, rows)

        print(f"\nWantlist: {added} added, {already} already in wantlist, {failed} failed, {skipped} skipped (no release id)")


def process_music_library(token, input_csv, output_csv, open_batch_size, wantlist, fmt, limit, resume_from):
    headers = get_headers(token)
    check_token(headers)

    # Define the simplified columns for the final report
    report_columns = ["Video ID", "Song Title", "Album Title", "Artist Name 1", "Discogs Link", "Release ID", "Master ID"]
    processed_rows = []

    with open(input_csv, mode="r", encoding="utf-8") as infile:
        reader = csv.DictReader(infile)

        for row in reader:
            artist = row.get("Artist Name 1", "").strip()
            album = row.get("Album Title", "").strip()

            # Build the clean row for the output
            clean_row = {
                "Video ID": row.get("Video ID", ""),
                "Song Title": row.get("Song Title", ""),
                "Album Title": album,
                "Artist Name 1": artist,
                "Discogs Link": "",
                "Release ID": "",
                "Master ID": "",
            }

            if artist and album:
                print(f"Searching: {artist} - {album}...")
                info = get_discogs_info(artist, album, headers)
                clean_row["Discogs Link"] = info["link"]
                clean_row["Release ID"] = info["release_id"]
                clean_row["Master ID"] = info["master_id"]

                # Discogs allows 60 requests per minute; sleep prevents getting blocked
                time.sleep(1.1)
            else:
                clean_row["Discogs Link"] = "Missing data"

            processed_rows.append(clean_row)

    with open(output_csv, mode="w", encoding="utf-8", newline="") as outfile:
        writer = csv.DictWriter(outfile, fieldnames=report_columns)
        writer.writeheader()
        writer.writerows(processed_rows)

    print(f"\nFinished! Clean report saved as {output_csv}")

    report_links(processed_rows, open_batch_size, wantlist, headers, fmt, limit, output_csv, resume_from)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Look up Discogs links for a YT Music takeout CSV, and optionally open them or add them to your Discogs wantlist.",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""examples:
  # Search takeout.csv, write discogs_report.csv (needs a Discogs personal access token)
  %(prog)s --token TOKEN --input takeout.csv --output discogs_report.csv

  # Print links already found in an existing report, no token needed
  %(prog)s --output discogs_report.csv

  # Same, but also open them in the browser, 5 tabs at a time
  %(prog)s --output discogs_report.csv --open 5

  # Add every found release to your Discogs wantlist (needs a token)
  %(prog)s --output discogs_report.csv --token TOKEN --wantlist

  # Add every CD and Vinyl version (any country) instead of just the main release
  %(prog)s --output discogs_report.csv --token TOKEN --wantlist --format CD,Vinyl

Get a personal access token at https://www.discogs.com/settings/developers
(the "Personal access token" button, not the Consumer Key/Secret).""",
    )
    parser.add_argument("--token", help="Discogs API token")
    parser.add_argument("--input", help="Input CSV to search (omit to just act on an existing --output report)")
    parser.add_argument("--output", default="discogs_report.csv", help="Output CSV (default: discogs_report.csv)")
    parser.add_argument(
        "--open",
        nargs="?",
        type=int,
        const=10,
        default=None,
        metavar="N",
        help="Open found links in the browser, N at a time (default: 10), pausing between batches",
    )
    parser.add_argument("--wantlist", action="store_true", help="Add found links to your Discogs wantlist (requires --token)")
    parser.add_argument(
        "--format",
        help="Comma-separated release formats to add to the wantlist, e.g. CD,Vinyl (default: main release)",
    )
    parser.add_argument(
        "--limit",
        type=int,
        default=10,
        help="Max releases to add per format per album (default: 10)",
    )
    parser.add_argument(
        "--resume-from",
        help="Skip ahead to this row (1-based row number in the 'Found links' list, or a master id / Video ID), retrying it and continuing from there",
    )
    args = parser.parse_args()

    if args.wantlist and not args.token:
        parser.error("--wantlist requires --token")
    if args.input and not args.token:
        parser.error("--input requires --token")

    fmt = args.format
    if args.wantlist and not fmt:
        fmt = input("Formats for wantlist, comma-separated e.g. CD,Vinyl (Enter for main release): ").strip() or None

    if args.input:
        process_music_library(args.token, args.input, args.output, args.open, args.wantlist, fmt, args.limit, args.resume_from)
    else:
        with open(args.output, mode="r", encoding="utf-8") as outfile:
            report_links(list(csv.DictReader(outfile)), args.open, args.wantlist, get_headers(args.token), fmt, args.limit, args.output, args.resume_from)
