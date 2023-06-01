#!/usr/bin/env bash

package_json=$(cat package.json 2>/dev/null)

if [[ -z $package_json ]]; then
	echo "No package.json file found in the route"
	exit 1
fi

for key in "devDependencies" "dependencies"; do
	deps=$(jq -r ".$key | keys[]" package.json 2>/dev/null)

	for dep in $deps; do
		if ! rg -q "from \"$dep|loader: \"$dep"; then
			echo "$dep"
		fi
	done

done
