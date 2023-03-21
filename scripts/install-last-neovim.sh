#!/bin/bash

PROGRAMS="$HOME/programs"

[ ! -d "$PROGRAMS" ] && mkdir "$PROGRAMS"
[ ! -d "$PROGRAMS/neovim" ] && git clone https://github.com/neovim/neovim "$PROGRAMS/neovim"

cd "$PROGRAMS/neovim/" || exit
git pull --all --stat
time sudo make CMAKE_BUILD_TYPE=Release install && nvim -v
