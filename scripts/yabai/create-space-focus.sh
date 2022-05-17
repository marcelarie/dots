#!/usr/bin/env bash

yabai -m space --create && yabai -m space --focus next

# "$(yabai -m query --spaces --display | jq -r 'map(select(."is-native-fullscreen" == false))[-1].index')"
