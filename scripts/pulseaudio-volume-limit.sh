#!/usr/bin/env bash

OPERATION=$1

if [ "$OPERATION" = "up" ] || [ "$OPERATION" = "+" ]; then
	pamixer -i 5
elif [ "$OPERATION" = "down" ] || [ "$OPERATION" = "-" ]; then
	pamixer -d 5
fi
