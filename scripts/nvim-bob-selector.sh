#!/usr/bin/env bash

if ! command -v bob &>/dev/null; then
	echo "bob could not be found"
	echo "install with $(sudo pacman -S bob)"
	exit
fi

nvim_version=$(bob ls-remote |
	sed '1i \            nightly' |
	sed -e 's/\x1b\[[0-9;]*m//g' |
	fzy |
	sed 's/(stable)//' |
	tr -d \[:space:\])

if [ -z "$nvim_version" ]; then
	echo "no version selected"
	exit
fi

if [ "$nvim_version" == "nightly" ]; then
	echo "Updating nvim nightly version"
	bob update
fi

bob use $nvim_version

if [ $? -ne 0 ]; then
	echo "error occurred"
	echo "try running 'bob ls-remote' to see available versions"
	exit
fi
