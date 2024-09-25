#!/usr/bin/env bash

TODO_FILE="$HOME/notes/TODO:$(date +%d-%m-%Y).md"

if [ -f $TODO_FILE ]; then
	LAST_ACCESS=$(stat -c %X $TODO_FILE)
	CURRENT_TIME=$(date +%s)
	TIME_DIFF=$(($CURRENT_TIME - $LAST_ACCESS))
	TIME_DIFFERENCE=$(($TIME_DIFF / 3600))
	TIME_DIFFERENCE_MINUTES=$(($TIME_DIFF / 60))

	# If you want to check every 10 minutes
	# if [ $TIME_DIFFERENCE_MINUTES -ge 10 ]; then
	# 	echo "🤨 Reminder: You haven't checked your TODOs in the last 10 minutes!"
	# 	notify-send "🤨 Reminder: You haven't checked your TODOs in the last 10 minutes!"
	# fi

	# If you want to check every 2 hours
	if [ $TIME_DIFFERENCE -ge 2 ]; then
		echo "🤨 Reminder: You haven't checked your TODOs in the last 2 hours!"
		notify-send "🤨 Reminder: You haven't checked your TODOs in the last 2 hours!"
	fi
else
	echo "🤨 Reminder: You didn't create a TODO file for today!"
	notify-send "🤨 Reminder: You didn't create a TODO file for today!"
fi
