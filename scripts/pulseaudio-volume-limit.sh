#!/usr/bin/env bash

OPERATION=$1

if [ "$OPERATION" = "up" ] || [ "$OPERATION" = "+" ]; then
	pamixer -i 5 --allow-boost --set-limit 125
elif [ "$OPERATION" = "down" ] || [ "$OPERATION" = "-" ]; then
	pamixer -d 5 --allow-boost
fi
