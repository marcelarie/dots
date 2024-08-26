#!/usr/bin/env bash

devices="$(bluetoothctl devices)"
device_names=$(echo "$devices" | cut --fields 3- --delimiter ' ')
selected=$(echo "$device_names" | wofi --dmenu -i -p "Bluetooth devices" -no-custom)

id=$(echo "$devices" | rg "$selected" | awk '{print $2}')

if [ -z "$selected" ]; then
	exit 1
fi

notify-send "Connecting to $selected device..."

bluetoothctl connect $id

if [ $? -eq 0 ]; then
	notify-send "Connected to $selected device"
else
	notify-send -u critical "Failed to connect to $selected device"
fi
