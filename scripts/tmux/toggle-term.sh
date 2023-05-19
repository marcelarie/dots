#!/usr/bin/env bash

current_session="$(tmux display-message -p '#S')"

session_panes="$(tmux list-panes -t "$current_session")"

echo $session_panes

# terminal_window="$(
# 	echo "$session_windows" |
# 		grep -iE 'fish' |
# 		awk '{print $1}' |
# 		sed 's/://'
# )"
#
#
#
# toggle_term() {
# 	if [ !  "$terminal_window" == "$(tmux display-message -p '#I:#W')" ]; then
# 		# select terminal window
#         echo $terminal_window
# 		tmux select-window -t "$terminal_window"
# 		# select last active pane
# 		# tmux last-pane
# 	fi
# }
#
# toggle_term
