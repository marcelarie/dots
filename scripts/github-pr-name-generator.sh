#!/usr/bin/env bash

pr_name=$1

if [[ -z $pr_name ]]; then
	echo "No PR name given."
	exit 1
fi

# Remove anything that matches jira ticket ids
cleaned=$(echo $pr_name | sed -E 's/([A-Z]{2,10}-[0-9]{1,5})//')

# Replace all dashes with spaces
cleaned=$(echo "$cleaned" | sed 's/-/ /g')

# Replace all underscores with spaces
cleaned=$(echo "$cleaned" | sed 's/_/ /g')

# Put the JIRA ticket ID in brackets
jira_id=$(echo $pr_name | sed -E 's/([A-Z]{2,10}-[0-9]{1,5}).*/[\1]/')

# replace more than one space with a single space
cleaned=$(echo "$cleaned" | sed -E 's/ +/ /g')


echo "$jira_id $cleaned"
