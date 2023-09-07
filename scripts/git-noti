#!/usr/bin/env bash

if ! [ -x "$(command -v jq)" ]; then
	echo 'Error: jq is not installed.' >&2
	exit 1
fi

PERSONAL_ACCESS_TOKEN=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
API_ENDPOINT_URL="https://api.github.com"
HEADERS="Authorization: token $PERSONAL_ACCESS_TOKEN"
NOTIFICATIONS=$(curl -s -H "$HEADERS" -G "$API_ENDPOINT_URL/notifications" -d all=true -d per_page=100)

SORTED_NOTIFICATIONS=$(echo "$NOTIFICATIONS" | jq -r -c "$(
	cat <<EOF
. |
map({
  updated_at: try .updated_at | strftime("%Y-%m-%d %H:%M:%S") catch "now",
  repository: .repository.full_name,
  subject: .subject,
  html_url: .subject.url
}) |
filter(.unread == true) |
sort_by(.updated_at) |
reverse
EOF
)")

echo -e "$SORTED_NOTIFICATIONS" | jq -r -c '.[] | "\033[32m\(.updated_at)\033[m\t\033[33m\(.repository)\033[m\t\033[34m\(.subject.title)\033[m\t\033[35m\(.html_url)\033[m"'
