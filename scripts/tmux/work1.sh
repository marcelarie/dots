#!/usr/bin/env sh

WORK_PATH="$HOME/clones/work"
# Selecting a repository to work on
SELECTED_REPO=$(ls "$WORK_PATH" | fzy)
REPO_NAME="$WORK_PATH/$SELECTED_REPO/"
# Generating the session name using the repository
SESSION="work-$SELECTED_REPO"
SHELL=fish
EDITOR=nvim
NVM_USE="nvm use"

tmux has-session -t "$SESSION" 2>/dev/null

if [ $? != 0 ]; then
	echo "Creating new session..."
	tmux new-session -d -s "$SESSION"
	tmux new-window -n $EDITOR
	tmux split-window -v
	tmux select-pane -t 0
	tmux send-keys "$SHELL" C-m
	tmux send-keys "cd $REPO_NAME" C-m
	tmux send-keys "$NVM_USE" C-m
	tmux send-keys C-l
	tmux select-pane -t 1
	tmux send-keys "$SHELL" C-m
	tmux send-keys "cd $REPO_NAME" C-m
	tmux send-keys "$NVM_USE" C-m
	tmux send-keys C-l
	tmux send-keys "$EDITOR" C-m
	tmux resize-pane -D 80
else
	echo "Session already exists"
fi

tmux -2 attach-session -t "$SESSION"
