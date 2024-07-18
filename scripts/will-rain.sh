#!/usr/bin/env bash

# Function to check if it will rain today and at what time
check_rain_time() {
	local location="${1:-}"
	if [[ -z "$location" ]]; then
		# If location is not provided, use current location
		weather_data=$(curl -s wttr.in)
	else
		# Use the provided location
		weather_data=$(curl -s wttr.in/"$location")
	fi

	# Check if any form of "rain" is mentioned in the weather output
	if grep -iqE "rain|drizzle|showers" <<<"$weather_data"; then
		# Extract the relevant part of the weather data
		rain_info=$(grep -A 4 -iE "rain|drizzle|showers" <<<"$weather_data" | tail -n +2 | head -n 1)

		# Extract time information from the rain_info
		rain_time=$(grep -oP '\d{2}:\d{2}' <<<"$rain_info" | head -1)

		if [[ -n "$rain_time" ]]; then
			echo "It will rain today at approximately $rain_time."
		else
			echo "It will rain today, but the exact time is not specified."
		fi
	else
		echo "It will not rain today."
	fi
}

# Main script starts here
if [[ $# -eq 0 ]]; then
	# No arguments passed, use current location
	check_rain_time
else
	# Use the location passed as argument
	location="$1"
	check_rain_time "$location"
fi
