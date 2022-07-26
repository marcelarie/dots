#!/usr/bin/env sh

SESSION=work
SHELL=fish
EDITOR=nvim

tmux has-session -t $SESSION 2>/dev/null

if [ $? != 0 ]; then
	tmux new-session -d -s $SESSION
fi

tmux new-window -n $EDITOR
tmux split-window -v
tmux select-pane -t 0
tmux send-keys "$SHELL" C-m
tmux select-pane -t 1
tmux send-keys "$SHELL" C-m
tmux send-keys "$EDITOR" C-m
tmux resize-pane -D 80

tmux -2 attach-session -t $SESSION
