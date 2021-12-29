export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/local/bin/vim
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/firefox
export TERM=kitty
export GPGKEY=649655AE22209148

# . /home/marcel/torch/install/bin/torch-activate
. "$HOME/.cargo/env"

# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃ #
#   4k scaling   #
# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃ ⩨
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
