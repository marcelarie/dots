#!/bin/bash

# URL of the Chrome DevTools Protocol JSON file
DEVTOOLS_URL="http://localhost:9222/json"

# Fetch the list of available pages (tabs) from Chrome DevTools Protocol
pages=$(curl -s $DEVTOOLS_URL/list)

# Extract the first page (assuming it's the active tab)
page_id=$(echo $pages | jq -r '.[0].id')

# Use the page ID to get information about the currently playing audio
audio_info=$(curl -s "$DEVTOOLS_URL/session/$page_id/playbackinfo")

# Print the audio information
echo "Current Audio Info:"
echo $audio_info | jq
