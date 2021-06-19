
#!/bin/bash

cd ~
git clone https://github.com/artempyanykh/zeta-note
cd zeta-note
cargo xtask install
cd ~
sudo rm -r zeta-note
