#!/usr/bin/env bash

echo "Enter the path to find files: "
read -r find_path

echo "Enter the search pattern: "
read -r pattern

echo "Enter the replacement pattern: "
read -r replacement

fd "$find_path" | sad "$pattern" "$replacement"

echo "Do you want to commit to all the changes? (y/n)"
read -r confirm

if [ "$confirm" = "y" ]; then
	fd "$find_path" | sad "$pattern" "$replacement" --commit
else
	echo "All changes are discarded."
fi
