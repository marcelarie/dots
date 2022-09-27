#!/usr/bin/env bash

REPO="/Users/m.manzanares/clones/work/stuart-frontend"

cd $REPO
# git checkout develop
# git pull

apps=$(ls "$REPO/apps" | fzf -m)

echo "Are you sure you want to create a release of the following apps?"
echo $apps
keep_going=$(echo -e "yes\nno" | fzy)

if [[ "$keep_going" == "yes" ]]; then
	echo "You accepted the release"
	# for app in "${apps[@]}"; do
	# 	yarn release --app=$app
	# done
	echo "Are you sure you want to create deploy master?"
	keep_going=$(echo -e "yes\nno" | fzy)
	if [[ "$keep_going" == "yes" ]]; then
		# git checkout master
		# git rebase develop # we want an exact copy of develop in the master branch
		echo "Please, verify the previous release commit made on develop is there"
		# git log            # verify the previous release commit made on develop is there
		# git push           # release will be triggered after this
	else
		echo "You canceled the deploy of master"
	fi
else
	echo "You canceled the release"
fi
