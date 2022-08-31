#!/usr/bin/env bash

repos=$(gh repo list --json name --json url)

selected_repo=($(echo $repos | jq -r '.[] | "\(.name) \(.url)"' | fzy))

repo_name=${selected_repo[0]}
repo_url=${selected_repo[1]}

echo
echo "The selected repository is named ${repo_name}"
echo "Do you want to clone the repository?"

response=$(echo -e "yes\nno" | fzy)

if [[ $response = "yes" ]]; then
	echo "Cloning repository in $PWD"
	git clone $repo_url "$PWD/$repo_name"
fi
