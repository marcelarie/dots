#!/usr/bin/env bash

# Explanation:
# create a new file for writing - visudo uses the vim editor by default.
# go read about this if you have no idea what is going on.

# sudo visudo -f /private/etc/sudoers.d/yabai

# input the line below into the file you are editing.
#  replace <yabai> with the path to the yabai binary (output of: which yabai).
#  replace <user> with your username (output of: whoami).
#  replace <hash> with the sha256 hash of the yabai binary (output of: shasum -a 256 $(which yabai)).
#   this hash must be updated manually after running brew upgrade.

# <user> ALL=(root) NOPASSWD: sha256:<hash> <yabai> --load-sa

yabai=$(which yabai)
user=$(whoami)
hash=$(shasum -a 256 $(which yabai) | awk '{print $1}')

result="$user ALL=(root) NOPASSWD: sha256:$hash $yabai --load-sa"

echo $result | pbcopy
echo $result | sudo EDITOR='tee -a' visudo
