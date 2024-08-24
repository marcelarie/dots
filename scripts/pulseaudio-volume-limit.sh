#!/usr/bin/env bash

# Define the maximum volume level (e.g., 125%)
MAX_VOLUME=125%

# Get the current volume level
CURRENT_VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1 | tr -d '%')

# Get the operation (increase or decrease)
OPERATION=$1


# if operation is up or + then increase the volume by 5%
if [ "$OPERATION" = "up" ] || [ "$OPERATION" = "+" ]; then
    if [ "$CURRENT_VOLUME" -lt "${MAX_VOLUME%\%}" ]; then
        pactl set-sink-volume @DEFAULT_SINK@ +5%
    else
        echo "Volume limit reached: $MAX_VOLUME"
    fi
elif [ "$OPERATION" = "down" ] || [ "$OPERATION" = "-" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ -5%
fi
``
