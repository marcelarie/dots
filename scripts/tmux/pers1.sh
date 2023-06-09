#!/usr/bin/env sh

PERSONAL_PATH="$HOME/clones/own"
# Selecting a repository to work on
SELECTED_REPO=$(ls "$PERSONAL_PATH" | fzy)
REPO_NAME="$PERSONAL_PATH/$SELECTED_REPO/"
# Generating the session name using the repository
SESSION="own-$SELECTED_REPO"
SHELL=fish
EDITOR=nvim
CUSTOM_COMMAND="echo No custom command set for this session"

if ! tmux has-session -t "$SESSION" 2>/dev/null; then
	echo "Creating new session..."
	tmux new-session -d -s "$SESSION"
	tmux new-window -n $EDITOR
	tmux send-keys "$SHELL" C-m
	tmux send-keys "cd $REPO_NAME" C-m
	tmux send-keys "$CUSTOM_COMMAND" C-m
	tmux send-keys C-l
	tmux split-window -v
	tmux select-pane -t 1
	tmux send-keys "$SHELL" C-m
	tmux send-keys "cd $REPO_NAME" C-m
	tmux send-keys "$CUSTOM_COMMAND" C-m
	tmux send-keys C-l
	tmux send-keys "$EDITOR" C-m
	tmux resize-pane -D 80
else
	echo "Session already exists"
fi

tmux -2 attach-session -t "$SESSION"
