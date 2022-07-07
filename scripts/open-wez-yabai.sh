#!/usr/bin/env bash

# Used by yabai and skhd

index=$(yabai -m query --displays --display | jq .index)
yabai -m signal --add event=window_created action=" \
  yabai -m signal --remove 'testwez' &&
  yabai -m window $YABAI_WINDOW_ID --display $index &&
  yabai -m display --focus $index" \
	app="wez" label="testwez"
/Applications/WezTerm.app/Contents/MacOS/wezterm start fish
