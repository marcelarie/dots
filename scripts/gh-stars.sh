#!/usr/bin/env bash

star=$(
	gh api user/starred --template \
		'{{range .}}{{.full_name|color "yellow"}} ({{timeago .updated_at}}){{"\n"}}{{end}}' \
		--paginate \
		--cache 1h |
		fzf
)
repo=$(echo "$star" | cut -d' ' -f1)

if [[ -n $star ]]; then
	gh repo view "$repo" -w
fi
