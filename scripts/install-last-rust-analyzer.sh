#!/bin/bash

cd ~
git clone https://github.com/rust-analyzer/rust-analyzer
cd rust-analyzer
cargo xtask install
cd ~
sudo rm -r rust-analyzer
