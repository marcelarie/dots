#!/usr/bin/env bash

binary_list=$(compgen -c | grep '[[:alpha:]]' | sort)

selected_binary=$(echo "$binary_list" | fzf --preview='man {} 2> /dev/null | col -b')

if [ -n "$selected_binary" ]; then
	export MANPAGER="sh -c 'col -bx | bat -l man -p'"
	man "$selected_binary"
else
	echo "No command was selected."
fi
