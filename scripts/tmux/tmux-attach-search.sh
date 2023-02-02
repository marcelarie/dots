#!/usr/bin/env bash

SESSIONS_LIST=$(tmux ls);

SELECTED_SESSION=$(echo "$SESSIONS_LIST" | awk '{print $1}' | sed 's/://' | fzy)

tmux attach -t "$SELECTED_SESSION"
