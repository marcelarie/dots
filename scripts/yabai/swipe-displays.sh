#!/usr/bin/env bash

# THIS SCRIPT ONLY WORKS WITH TWO SCREENS

displays_json=$(yabai -m query --displays)

display_01_id=$(echo $displays_json | jq '.[0].id')
display_02_id=$(echo $displays_json | jq '.[1].id')

spaces=$(yabai -m query --spaces | jq -c 'map( select( ."is-visible" == true ) )')
space_01=$(echo $spaces | jq -c 'map( select( ."display" == 1 ) )[0]')
space_02=$(echo $spaces | jq -c 'map( select( ."display" == 2 ) )[0]')
space_01_id=$(echo $space_01 | jq '.index')
space_02_id=$(echo $space_02 | jq '.index')

windows_space_01=$(echo $space_01 | jq -c '.windows')
windows_space_02=$(echo $space_02 | jq -c '.windows')
windows_space_01=$(jq -r '.[]' <<< "$windows_space_01")
windows_space_02=$(jq -r '.[]' <<< "$windows_space_02")

# Iterater over all windows in space 1 and move them to space 2
while read -r window; do
  echo "Moving window $window to space $space_02_id"
  echo $space_01_id
  yabai -m window "$window" --space "$space_02_id"
done <<< "$windows_space_01"

# Iterater over all windows in space 2 and move them to space 1
while read -r window; do
  echo "Moving window $window to space $space_02_id"
  yabai -m window $window --space $space_01_id
done <<< "$windows_space_02"

yabai -m display --focus $display_01_id
