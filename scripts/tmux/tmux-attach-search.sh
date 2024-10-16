#!/usr/bin/env bash

SESSIONS_LIST=$(tmux ls 2>/dev/null)
NO_SERVER_REGEX='^no server running on /tmp/tmux-\d/default'

if [ -z "$SESSIONS_LIST" ] || [[ "$SESSIONS_LIST" =~ $NO_SERVER_REGEX ]]; then
	printf "No sessions found\n"
	read -p "Do you wish to start a session? Answer Y or N " yn
	case $yn in
	[Yy]*)
		read -p "For Work or Personal? Answer W or P " wp
		case $wp in
		[Ww]*) "$HOME/scripts/tmux/create-session-tmex.sh" work ;;
		[Pp]*) "$HOME/scripts/tmux/create-session-tmex.sh" own ;;
		*) echo "Exit" ;;
		esac
		;;
	[Nn]*) exit 1 ;;
	*) printf "Please answer yes or no.\n" ;;
	esac
fi

SELECTED_SESSION=$(echo "$SESSIONS_LIST" | awk '{print $1}' | sed 's/://' | fzy)

tmux attach -t "$SELECTED_SESSION"
exit 0
