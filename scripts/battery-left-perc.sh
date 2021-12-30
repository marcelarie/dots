#!/bin/bash
bat=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0| grep "percentage" | grep -o "[[:digit:]]*")
# sign="$( $bat -gt 15 && echo 🔋|| echo  )";

echo "bat: $bat% 🔋"
