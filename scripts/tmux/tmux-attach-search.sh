#!/usr/bin/env bash

SESSIONS_LIST=$(tmux ls 2>/dev/null)
NO_SERVER_REGEX='^no server running on /tmp/tmux-\d/default'

if [ -z "$SESSIONS_LIST" ] || [[ "$SESSIONS_LIST" =~ $NO_SERVER_REGEX ]]; then
	echo "No sessions found"
	read -p "Do you wish to start a session? Answer Y or N " yn
	case $yn in
	[Yy]*)
		read -p "For work or Personal? Answer W or P " wp
		case $wp in
		[Ww]*) $HOME/scripts/tmux/work1.sh ;;
		[Pp]*) exit 1 ;;
		*) echo "Exit" ;;
		esac
		;;
	[Nn]*) exit 1 ;;
	*) echo "Please answer yes or no." ;;
	esac
fi

SELECTED_SESSION=$(echo "$SESSIONS_LIST" | awk '{print $1}' | sed 's/://' | fzy)

tmux attach -t "$SELECTED_SESSION"
