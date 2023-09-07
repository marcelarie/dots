#!/bin/bash

cd ~
sudo rm -r neovim
git clone https://github.com/neovim/neovim
cd neovim
git reset --hard HEAD~2
sudo make CMAKE_BUILD_TYPE=Release install
cd ~
sudo rm -r neovim
