#!/usr/bin/env bash

red_color='\033[0;31m'
yellow_color='\033[0;33m'
no_color='\033[0m'

while getopts t: flag; do
	case "${flag}" in
	t) text=${OPTARG} ;;
	*) _=${OPTARG} ;;
	esac
done

if [ -z "$text" ]; then
	echo "Please provide the text that will be send to Open AI"
	exit 1
fi

response=$(curl -s https://api.openai.com/v1/chat/completions \
	-H "Authorization: Bearer $OPENAI_API_KEY" \
	-H "Content-Type: application/json" \
	-d "{\"model\":\"gpt-3.5-turbo\",\"messages\":[{\"role\":\"user\",\"content\":\"$text\"}]}")

ERROR=$(echo "$response" | jq -c .error)

if [ "$ERROR" != "null" ]; then
	error_message="$(echo "$response" | jq -c .error.message)"
	echo "Error: $error_message"
	exit 1
fi

content=$(echo "$response" | jq -r '.choices[0].message.content')

echo -e "${red_color}Question:${no_color}"
printf '\n'
# shellcheck disable=2059
printf "$text"
printf '\n'
printf '\n'
echo -e "${yellow_color}Response:${no_color}"
# shellcheck disable=2059
printf "$content" | glow
