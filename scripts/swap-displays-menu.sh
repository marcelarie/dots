#!/usr/bin/env bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Swap Displays
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 易

main_id=5FB151E2-03F5-4761-86F6-1987757B401A
secondary_id=306DAF75-F16F-494E-B55E-6C79FF95FD84
displayplacer_list=$(displayplacer list)

grep_main=$(echo $displayplacer_list | rg -o "displayplacer \"id:$main_id")

if [[ -z $grep_main ]]; then
	displayplacer "id:5FB151E2-03F5-4761-86F6-1987757B401A res:2560x1440 hz:60 color_depth:7 scaling:on origin:(0,0) degree:0" "id:306DAF75-F16F-494E-B55E-6C79FF95FD84 res:2560x1440 hz:60 color_depth:7 scaling:on origin:(2560,0) degree:0"
else
	displayplacer "id:306DAF75-F16F-494E-B55E-6C79FF95FD84 res:2560x1440 hz:60 color_depth:7 scaling:on origin:(0,0) degree:0" "id:5FB151E2-03F5-4761-86F6-1987757B401A res:2560x1440 hz:60 color_depth:7 scaling:on origin:(-2560,0) degree:0"
fi
