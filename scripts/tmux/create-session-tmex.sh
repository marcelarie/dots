#!/usr/bin/env sh

SESSION_TYPE=$1

if [ -z "$SESSION_TYPE" ]; then
	echo "No session type provided"
	exit 1
fi

WORK_PATH="$HOME/clones/$SESSION_TYPE"
# Selecting a repository to work on
SELECTED_REPO=$(ls "$WORK_PATH" | fzy)
REPO=$(echo "$SELECTED_REPO" | sed 's/\//-/g' | sed 's/\./-dot-/g')
SESSION="$SESSION_TYPE-$REPO"
REPO_NAME="$WORK_PATH/$SELECTED_REPO/"
# Generating the session name using the repository
# SHELL=fish # this is already set in fish config
EDITOR=nvim
# CUSTOM_COMMAND="fnm use"

if ! tmux has-session -t "$SESSION" 2>/dev/null; then
	tmex "$SESSION" --layout="2{41}" "cd $REPO_NAME; clear; $EDITOR" "cd $REPO_NAME; clear"

else
	echo "Session already exists"
fi

tmux -2 attach-session -t "$SESSION"
