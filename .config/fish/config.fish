if status is-interactive
    # Commands to run in interactive sessions can go here
end
# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃ #
#   colorscheme   #
# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃ ⩨

base16-gruvbox-dark-medium # :)

# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃ #
#   ZSH  CONFIG   #
# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃ ⩨

### "bat" as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
## go
set --universal -x PATH /home/$USER/.cargo/bin:$PATH                           # export GOPATH=$HOME/.local/go
set --universal -x GOPATH $HOME/.local/go                                      # export PATH=/home/$USER/.cargo/bin:$PATH

### "vim" as manpager
# export MANPAGER='/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'
### "nvim" as manpager
# export MANPAGER="nvim -c 'set ft=man' -"

# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃ #
#   FISH ALIAS   #
# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃ ⩨

source $HOME/.config/fish/git-alias.fish
source $HOME/.config/fish/zoxide.fish

# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃ #
#   ZSH  ALIAS   #
# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃ ⩨

#### Linux ####
alias ls="exa --git"
alias l="ls"
alias cp="cp -i"     # Confirm before overwriting something
alias mv="mv -i"     # Confirm before overwriting something
alias rm="rm -i"     # Confirm before overwriting something
alias df="df -h"     # Human-readable sizes
alias free="free -m" # Show sizes in MB

alias grep="grep --colour=auto"
alias egrep="egrep --colour=auto"
alias fgrep="fgrep --colour=auto"
alias ..="cd .."
alias ...="cd ../.."
alias ...="cd ../../.."
alias cat="bat"

#### Manjaro ####
alias pacmi="sudo pacman-mirrors --fasttrack && sudo pacman -Syyu"

#### Pacman ####
alias pac='sudo pacman -S'
alias pacr='sudo pacman -Rns'
alias pyyu='sudo pacman -Syyu'
alias pacu='sudo pacman -Su'

#### Server ####
alias govh='ssh marcel@135.125.234.60'

#### Git ####
alias gb='git checkout (git branch | fzy | xargs)'
alias gbde='git branch -D (git branch | fzy | xargs)'

#### Develop ####
alias ys='yarn start'
alias yu='yarn update'
alias yi='yarn install'
alias ya='yarn add'
alias yig='yarn install -g'

#### Configs ####
alias zrc='nvim ~/.zshrc'
alias arc='nvim ~/.config/awesome'
alias drc='cd ~/.config/arco-dwm & nvim config.h'
alias frc='nvim ~/.config/fish/config.fish'
alias clones='~/clones'
alias dots='vi ~/.gitignore'

#### Nvim ####
alias vi='nvim'
alias bi='nvim -c "colorscheme OceanicNext"'
alias mi='nvim -c "colorscheme monarized"'
alias revi='bash ~/scripts/install-last-neovim.sh'
alias rc='nvim ~/.config/nvim/init.*'
alias gorc='cd ~/.config/nvim/'

#### Docker ####
alias do='docker'
alias dor='docker run'
alias dob='docker build'
alias dos='docker stop'
alias dc='docker-compose'
alias dcu='docker-compose up'

#### Others ####
alias hist='xdotool type --delay 0 (history | fzy -l 20)'
alias live-server='live-server --no-browser'
alias pt="vi ~/personal/tasks"
alias gopt="cd ~/personal/tasks"
alias wbcn="curl wttr.in/Barcelona\?0Q"
alias create-react-app="create-react-app --template mini"
alias gmod='git ls-files -m'
alias ytmp3='youtube-dl --extract-audio --audio-format mp3'
alias xyy="xsel --clipboard --input"
alias xp="xsel --clipboard --output"
alias node15="source /usr/share/nvm/init-nvm.sh"
alias scp='sh ~/scripts/(ls ~/scripts/ | fzy)' # scripts selector
alias env='printenv | fzy'  # scripts selector
alias nm='mw -Y && neomutt' # refresh and open neomutt
alias mc="mcfly search"
alias own='zyc /home/marcel/clones/own'
alias learn='zyc /home/marcel/clones/learning'
alias fork='zyc /home/marcel/clones/forks'
alias work='zyc /home/marcel/clones/work'
alias locate='plocate'
alias klay='setxkbmap (printf "es\nus\nus(dvorak)\nes(dvorak)\n" | fzy)'
alias af='xdotool type --delay 0 ( alias | fzy | awk -F\' \' \'{print $2}\')'

#### Tmux ####
# alias t='tmux attach || tmux new-session' # Attaches tmux to the last session; creates a new session if none exists.
alias ta='tmux attach -t'                 # Attaches tmux to a session (example: ta portal)
alias tn='tmux new-session'               # Creates a new session
alias tl='tmux list-sessions'             # Lists all ongoing sessions
alias ts='tmux switch -t (tmux ls | cut -f1 -d":" | fzy)'

#### Rust ####
alias cn='cargo new'
alias ca='cargo add'
alias cr='cargo run'
alias cb='cargo build'
alias cu='cargo update'
alias ciu='cargo install-update -a'
alias ci='cargo install'
alias cdo='cargo doc --open'
alias cw="cargo watch -x run"

### Cheat ###
alias ch='cheat'
alias che='cheat -e'
alias chl=' cheat (cheat -l | cut -f1 -d " " | fzy)'

### Ctags ###
alias ctag='ctags --recurse=yes'
# alias t='vi -t "(cut -f1 tags | tail +7 | uniq | fzf)"'

### SoySuper ###
alias re.pl="echo 'source ~/.zshrc && re.pl' | zsh"
alias dz="zsh -c 'source ~/.zshrc; dzil build; cpanm --auto-cleanup 0.0001 -n *.tar.gz; dzil clean'"
alias sdw="echo 'source ~/.zshrc && sc deploy workers' | zsh"
alias sdm="echo 'source ~/.zshrc && sc deploy manager' | zsh"
alias logcli="logcli --addr='http://monitor-0.ss:3100'"

### Arco ###
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

### Own ###
alias gtm="$HOME/clones/own/git-tellme/target/release/git-tellme"

# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃ #
#   ZSH  TODO:   #
# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃ ⩨

# alias cry\$="curl rate.sx"
# alias scd='f(){sh ~/scripts/"$argv"(ls ~/scripts/"$argv"/ | fzy)}; f'
# alias fzf="fzf --preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'"

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

# source ~/perl5/perlbrew/etc/perlbrew.fish

# set -x PERLBREW_ROOT /usr/locaw/soft/perlbrew/

# . ~/perl5/perlbrew/etc/perlbrew.fish

# set -x PATH /home/marcel/perl5/bin${PATH:+:${PATH}}
# export PATH

# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃ #
#  ENV.VARIABLES #
# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃ ⩨

# Ruby

# Perl

# set PERL5LIB "/home/marcel/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
set -x PERL5LIB /home/marcel/perl5/lib/perl5:/home/marcel/perl5/lib/perl5
export PERL5LIB

# set PERL_LOCAL_LIB_ROOT "/home/marcel/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
set -x PERL_LOCAL_LIB_ROOT /home/marcel/perl5:/home/marcel/perl5
export PERL_LOCAL_LIB_ROOT

set -x NODE_PATH (npm root -g)
export NODE_PATH

set PERL_MB_OPT --install_base \"/home/marcel/perl5\"
export PERL_MB_OPT

set PERL_MM_OPT INSTALL_BASE=/home/marcel/perl5
export PERL_MM_OPT

# SoySuper

# git-tellme
# /home/marcel/clones/own/git-tellme/target/release/git-tellme
fm6000
starship init fish | source

# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"
