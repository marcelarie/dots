#!/usr/bin/env bash

shopt -s nullglob

apply_changes=false

if [[ $1 == "--apply" ]]; then
	apply_changes=true
fi

for f in *; do
	if [[ -f $f ]]; then
		no_underscores=${f//_/-}
		no_spaces=${no_underscores// /-}
		no_dashes=${no_spaces//--/-}
		no_uppercase=$(tr '[:upper:]' '[:lower:]' <<<"$no_dashes")

		if [[ $f != "$no_uppercase" ]]; then
			if [[ $apply_changes != true ]]; then
				echo "mv ${f} ${no_uppercase}"
				read -p "Apply changes? (y/n) " -n 1 -r
			fi

			if [[ $apply_changes == true || $REPLY =~ ^[Yy]$ ]]; then
				mv "$f" "$no_uppercase"
				echo "Renamed ${f} to ${no_uppercase}"
			else
				echo "Skipping ${f}"
			fi
		fi
	fi
done
