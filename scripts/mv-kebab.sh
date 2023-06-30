#!/usr/bin/env bash

arguments=("$@")
filenames=()

for arg in "${arguments[@]}"; do
	if [ ! -f "$arg" ]; then
		echo "$arg does not exist"
		exit 1
	fi
	filenames+=("$arg")
done

for filename in "${filenames[@]}"; do
	basename=$(basename "$filename")

	kebab_case_filename=$(
		echo "$basename" |
			sed 's/ \([A-Z]\)/-\1/g' |
			sed 's/^-*//;s/-*$//' |
			tr '[:upper:]' '[:lower:]' |
			sed 's/-\+/-/g' |
			sed 's/ //g'

	)

	new_file_path=$(echo "$filename" | sed "s/$basename/$kebab_case_filename/g")

	echo "Converted to kebab case"
	echo "$filename -> $new_file_path"
	mv "$filename" "$new_file_path"
done
