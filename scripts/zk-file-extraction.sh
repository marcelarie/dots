#!/usr/bin/env bash

current_dir=$(pwd)

if [[ $current_dir != *"clones/pers/notes"* ]]; then
	echo "This script must be run from the blog directory"
	exit 1
fi

for file in *.md; do
	title=$(head -n1 "$file")
	new_title=$(
		echo "${title//\# /}" |
			tr ' ' '-' |
			tr '[:upper:]' '[:lower:]' |
			sed 's/[^[:alpha:]]/-/g' |
			sed 's/-\{2,\}/-/g' |
			sed 's/-$//g' |
			sed 's/^-//g'
	)

	if [[ $new_title == "" ]]; then
		new_title="untitled"
	fi

	mv "$file" "${file%%.*}-$new_title.md"
done
