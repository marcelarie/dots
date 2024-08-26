#!/usr/bin/env bash

command_exists() {
	command -v "$1" >/dev/null 2>&1
}

if ! command_exists hyprctl; then
	echo "Error: 'hyprctl' command not found."
	exit 1
fi

# Collect fullscreen status
fullscreen_status=$(hyprctl clients | grep -E "fullscreen: 1|fakefullscreen: 1" | wc -l)

echo "Fullscreen status: $fullscreen_status"

# Check if fullscreen is enabled
if [ "$fullscreen_status" -gt 1 ]; then
	hyprctl dispatch fullscreen 1
fi

# Execute the command if provided
if [ $# -gt 0 ]; then
	eval "$@"
fi
