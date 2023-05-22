#!/usr/bin/env bash

NEOVIM_DIR=~/programs/neovim

cd "$NEOVIM_DIR" ||
	(echo "Directory $NEOVIM_DIR not found" && exit 1)

sudo cmake --build build/ --target uninstall
sudo rm /usr/local/bin/nvim
sudo rm -r /usr/local/share/nvim/
