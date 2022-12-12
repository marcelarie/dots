#!/usr/bin/env bash
#
PERSONAL_ACCESS_TOKEN=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

# Replace TOKEN with your personal access token
res=$(
	curl -s -H "Authorization: token ${PERSONAL_ACCESS_TOKEN}" https://api.github.com/notifications |
		jq '.[] | select(.unread == true) | .subject.title + ": " + "\n" + .subject.url + "\n\n"' |
		sed 's/"//g'
		# awk '{print "\033[32m" $0 "\033[0m"}'
)

echo -e $res
