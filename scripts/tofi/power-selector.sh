#!/bin/bash

# pkill tofi or 
if pgrep -x "tofi" > /dev/null
then
  pkill tofi
fi

entries="Logout\nSuspend\nReboot\nShutdown"

selected=$(echo -e "$entries" | tofi --width 250 --height 210 | awk '{print $1}')

[[ -z $selected ]] && exit

case $selected in
  Logout)
    hyprctl dispatch exit;;
  Suspend)
    exec systemctl suspend;;
  Reboot)
    exec systemctl reboot;;
  Shutdown)
    exec systemctl poweroff -i;;
esac
