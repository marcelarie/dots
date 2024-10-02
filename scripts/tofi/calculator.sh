#!/usr/bin/env bash

tmp_path="/tmp/tofi-calc-history"
is_history_value=false

if [ ! -f "$tmp_path" ]; then
	touch "$tmp_path"
fi

# Input operation
operation=$(cat $tmp_path | tofi --prompt-text=" " --require-match=false)

# Exit if no operation provided
if [ -z "$operation" ]; then
	notify-send "No operation provided." "Please provide a valid operation."
	exit
fi

# Remove operation when using history values
if [[ "$operation" == *"="* ]]; then
	operation=$(echo "$operation" | cut -d "=" -f 2)
	is_history_value=true
fi

# Calculate the result
result=$(echo "$operation" | bc -l)

# Exit if invalid operation
if [ -z "$result" ]; then
	notify-send "Invalid operation." "Please provide a valid operation."
	exit
fi

# Save the operation and result to history 
if [ "$is_history_value" = false ]; then
	if ! grep -q "$operation = $result" "$tmp_path"; then
		echo "$operation = $result" >>"$tmp_path"
	fi
fi

# Copy the result to the clipboard
echo "$result" | wl-copy

notify-send "Result: $result" "The result has been copied to the clipboard."
