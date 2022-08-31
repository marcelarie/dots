#!/usr/bin/env sh

WORK_PATH="$HOME/clones/work/stuart-frontend/"
SESSION=work
SHELL=fish
EDITOR=nvim
NVM_USE="nvm use"

tmux has-session -t $SESSION 2>/dev/null

if [ $? != 0 ]; then
	tmux new-session -d -s $SESSION
fi

tmux new-window -n $EDITOR
tmux split-window -v
tmux select-pane -t 0
tmux send-keys "$SHELL" C-m
tmux send-keys "cd $WORK_PATH" C-m
tmux send-keys "$NVM_USE" C-m
tmux send-keys C-l
tmux select-pane -t 1
tmux send-keys "$SHELL" C-m
tmux send-keys "cd $WORK_PATH" C-m
tmux send-keys "$NVM_USE" C-m
tmux send-keys C-l
tmux send-keys "$EDITOR" C-m
tmux resize-pane -D 80

tmux -2 attach-session -t $SESSION
