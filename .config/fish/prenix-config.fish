if status is-interactive
    # Commands to run in interactive sessions can go here
    # atuin init fish | source
end
# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃ #
#   colorscheme   #
# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃ ⩨

# base16-gruvbox-dark-medium # :)

# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃ #
#   ZSH  CONFIG   #
# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃ ⩨

### "bat" as manpager
# export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANPAGER='nvim +Man!'
## go
# set --universal -x PATH /home/$USER/.cargo/bin:$PATH # export GOPATH=$HOME/.local/go
# set --universal -x GOPATH $HOME/.local/go # export PATH=/home/$USER/.cargo/bin:$PATH

### "vim" as manpager
# export MANPAGER='/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'
### "nvim" as manpager
# export MANPAGER="nvim -c 'set ft=man' -"

# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃ #
#   FISH ALIAS   #
# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃ ⩨

# source $HOME/.config/fish/functions/br.fish
source $HOME/.config/fish/git-alias.fish
source $HOME/.config/fish/zoxide.fish
source $HOME/.config/fish/functions/git.fish
source $HOME/.config/fish/functions/nvim.fish
source $HOME/.config/fish/functions/google.fish

# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃ #
#  KEY-BINDINGS  #
# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃ ⩨

bind -M insert \ce end-of-line # on vi-mode

# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃ #
#    STARTUP     #
# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃ ⩨

xset r rate 150 45
set fish_greeting

alias mon2cam="deno run --unstable -A -r -q https://raw.githubusercontent.com/ShayBox/Mon2Cam/master/src/mod.ts"
alias luamake=/home/marcel/.config/nvim/language-servers/lua-language-server/3rd/luamake/luamake

# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃ #
#    SOURCES     #
# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃ ⩨

# set -x PERLBREW_ROOT /usr/local/soft/perlbrew/
# bass source ~/perl5/perlbrew/etc/bashrc

# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃ #
#  ENV.VARIABLES #
# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃ ⩨

# vim
# set VICONFIG /home/marcel/.config/nvim/init.lua
# export VICONFIG
#
# # Ruby
#
# # Perl
# # set PERL5LIB "/home/marcel/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
# set -x PERL5LIB /home/marcel/perl5/lib/perl5
# export PERL5LIB
#
# # set PERL_LOCAL_LIB_ROOT "/home/marcel/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
# set -x PERL_LOCAL_LIB_ROOT /home/marcel/perl5
# export PERL_LOCAL_LIB_ROOT
#
# set -x NODE_PATH (npm root -g)
# export NODE_PATH
#
# set PERL_MB_OPT --install_base \"/home/marcel/perl5\"
# export PERL_MB_OPT
#
# set PERL_MM_OPT INSTALL_BASE=/home/marcel/perl5
# export PERL_MM_OPT

# SoySuper

# /home/marcel/clones/own/git-tellme/target/release/git-tellme
# fm6000
~/clones/forks/fetch-master-6000/fm6000.pl
starship init fish | source

# Generated for envman. Do not edit.
# test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"
