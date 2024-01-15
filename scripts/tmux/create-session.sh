#!/usr/bin/env sh

SESSION_TYPE=$1

if [ -z "$SESSION_TYPE" ]; then
	echo "No session type provided"
	exit 1
fi

WORK_PATH="$HOME/clones/$SESSION_TYPE"
# Selecting a repository to work on
SELECTED_REPO=$(ls "$WORK_PATH" | fzy)
REPO=$(echo $SELECTED_REPO | sed 's/\//-/g' | sed 's/\./-dot-/g')
SESSION="$SESSION_TYPE-$REPO"
REPO_NAME="$WORK_PATH/$SELECTED_REPO/"
# Generating the session name using the repository
SHELL=fish
EDITOR=nvim
CUSTOM_COMMAND="fnm use"

if ! tmux has-session -t "$SESSION" 2>/dev/null; then
	echo "Creating new session..."
	tmux new-session -d -s "$SESSION"
	tmux new-window -n $EDITOR
	tmux send-keys "$SHELL" C-m
	tmux send-keys "cd $REPO_NAME" C-m
	tmux send-keys "$CUSTOM_COMMAND" C-m
	tmux send-keys "$EDITOR" C-m
	tmux send-keys C-l
	tmux split-window -v
	tmux select-pane -t 1
	tmux send-keys "$SHELL" C-m
	tmux send-keys "cd $REPO_NAME" C-m
	tmux send-keys "$CUSTOM_COMMAND" C-m
	tmux send-keys C-l
	tmux resize-pane -D 80
else
	echo "Session already exists"
fi

tmux -2 attach-session -t "$SESSION"
