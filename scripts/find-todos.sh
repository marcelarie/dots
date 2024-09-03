#!/usr/bin/env bash

if ! command -v fzf &>/dev/null; then
	echo "fzf is not installed. Aborting."
	exit 1
fi

cd ~/notes/ || exit 1

todo_files=$(find . -maxdepth 1 -type f -name "TODO:??-??-????.md" | sort)

selected_file=$(echo "$todo_files" | fzf --height 40% --border --prompt="Select a TODO file: ")

if [ -n "$selected_file" ]; then
	nvim "$selected_file"
else
	echo "No file selected."
fi

# Return to the previous directory
cd - >/dev/null 2>&1
