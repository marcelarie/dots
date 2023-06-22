#!/usr/bin/env bash

# Run onefetch and store the output in a variable
output=$(onefetch)

# Remove color-related characters using sed
clean_output=$(
	echo "$output" |
		sed -E 's/\x1B\[[0-9;]*[mGKF]//g' |
		sed 's/\\[?7l//g' |
		sed 's/\\[?7h//g' |
		sed '/^[[:space:]]*$/d'
)

# Print the cleaned output
echo "$clean_output"
