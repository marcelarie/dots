# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/marcel/.oh-my-zsh" ### SET MANPAGER
### Uncomment only one of these!

### "bat" as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
## go
export PATH=/home/$USER/.cargo/bin:$PATH export GOPATH=$HOME/.local/go

### "vim" as manpager
# export MANPAGER='/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

### "nvim" as manpager
# export MANPAGER="nvim -c 'set ft=man' -"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="nicoulaj"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting zsh-autosuggestions mongodb k)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃ #
#   ZSH ALIAS    #
# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃ ⩨

#### Linux ####
alias ls="exa --git"
alias cp="cp -i"     # Confirm before overwriting something
alias mv='mv -i'     # Confirm before overwriting something
alias rm='rm -i'     # Confirm before overwriting something
alias df='df -h'     # Human-readable sizes
alias free='free -m' # Show sizes in MB
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias ...='cd ../../..'
alias cat='bat'

#### Git ####
alias gs='git status'

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
alias gb='git checkout $(git branch | fzy)'
alias gbde='git branch -D $(git branch | fzy)'

#### Develop ####
alias ys='yarn start'
alias yu='yarn update'
alias yi='yarn install'
alias ya='yarn add'
alias yig='yarn install -g'

#### Configs ####
alias zrc='nvim ~/.zshrc'
alias arc='nvim ~/.config/awesome'
alias frc='nvim ~/.config/fish/config.fish'
alias drc='cd ~/.config/arco-dwm/ & nvim .'
alias clones='~/clones'
alias dots='vi ~/.gitignore'

#### Nvim ####
alias vi='nvim'
alias bi='nvim -c "colorscheme OceanicNext"'
alias revi='bash ~/scripts/install-last-neovim.sh'
alias rc='nvim ~/.config/nvim/init.*'
alias gorc='cd ~/.config/nvim/'

#### Others ####
alias fzf="fzf --preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'"
alias hist='xdotool type --delay 0 "$(history | tac | cut -c 8- | fzy -l 20)"'
alias live-server='live-server --no-browser'
alias pt="vi ~/personal/tasks"
alias gopt="cd ~/personal/tasks"
alias wbcn="curl wttr.in/Barcelona\?0Q"
alias create-react-app="create-react-app --template mini"
alias cry\$="curl rate.sx"
alias gmod='$(git ls-files -m)'
alias ytmp3='youtube-dl --extract-audio --audio-format mp3'
alias xyy="xsel --clipboard --input"
alias xp="xsel --clipboard --output"
alias node15="source /usr/share/nvm/init-nvm.sh"
alias scp='sh ~/scripts/$(ls ~/scripts/ | fzy)' # scripts selector
alias scd='f(){sh ~/scripts/"$@"$(ls ~/scripts/"$@"/ | fzy)}; f'
alias env='printenv | fzy'  # scripts selector
alias nm='mw -Y && neomutt' # refresh and open neomutt
alias mc="mcfly search"
# alias own='cd ~/clones/own/$(ls ~/clones/own | fzy)'
# alias learn='cd ~/clones/learning/$(ls ~/clones/learning | fzy)'
# alias fork='cd ~/clones/forks/$(ls ~/clones/forks | fzy)'
# alias work='cd ~/clones/work/$(ls ~/clones/work | fzy)'
alias own='zyc /home/marcel/clones/own'
alias learn='zyc /home/marcel/clones/learning'
alias fork='zyc /home/marcel/clones/forks'
alias work='zyc /home/marcel/clones/work'
alias locate='plocate'
alias klay='setxkbmap $(printf "es\nus\nus(dvorak)\nes(dvorak)\n" | fzy)'
#  alias af='xdotool type --delay 0 $( alias | fzy | awk -F' ' '{print $2}')'

#### Tmux ####
alias t='tmux attach || tmux new-session' # Attaches tmux to the last session; creates a new session if none exists.
alias ta='tmux attach -t'                 # Attaches tmux to a session (example: ta portal)
alias tn='tmux new-session'               # Creates a new session
alias tl='tmux list-sessions'             # Lists all ongoing sessions
alias ts='tmux switch -t $(tmux ls | cut -f1 -d":" | fzy)'

#### Rust ####
alias cn='cargo new'
alias ca='cargo add'
alias cr='cargo run'
alias cb='cargo build'
alias cu='cargo update'
alias ci='cargo install'
alias cdo='cargo doc --open'
alias cw="cargo watch -x run"

### Cheat ###
alias ch='cheat'
alias che='cheat -e'
alias chl=' cheat $(cheat -l | cut -f1 -d " " | fzy)'

### Ctags ###
alias ctag='ctags --recurse=yes'
alias t='vi -t "$(cut -f1 tags | tail +7 | uniq | fzf)"'

### Supers ###
alias dz='dzil build; cpanm --auto-cleanup 0.0001 -n *.tar.gz; dzil clean'
alias re.pl="cd ~/clones/work/supers/dist/Supers-Crawler && \re.pl"
alias sdw='sc deploy workers'
alias sdw='sc deploy manager'

### ARCO ###
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
#  https://github.com/arcolinux/arcolinuxl-iso/blob/master/archiso/airootfs/etc/skel/.bashrc <- more here

### FUNCTIONS ###
rga-fzf() { # ripgrep + fzf
    RG_PREFIX="rga --files-with-matches"
    local file
    file="$(
        FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
            fzf --sort --preview="[[ ! -z {} ]] && bat --style=numbers --color=always && rga --pretty --context 5 {q} {}"
        # fzf --preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
        --phony -q "$1" \
            --bind "change:reload:$RG_PREFIX {q}" \
            --preview-window="70%:wrap"
    )" &&
        echo "opening $file" &&
        xdg-open "$file"
}
rgf() {
    RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "
    FZF_DEFAULT_COMMAND="$RG_PREFIX ''" \
        fzf --ansi --phony \
        --bind "change:reload:$RG_PREFIX {q} || true" \
        --preview-window=top:40% --preview "~/scripts/preview.sh -v {} | rg --pretty --colors 'match:bg:red' --colors 'match:fg:white' --no-line-number --ignore-case --context 3 {q}"
}
zyc() {
    RES=$(ls $1 | fzy)
    if [[ -f "$1/$RES" ]]; then
        vi "$1/$RES"
    elif [[ -d "$1/$RES" ]]; then
        cd "$1/$RES"
        # zyc "$1/$RES"
    else
        cd "$1/$RES"
    fi
}

curl_brain() {
    curl -H 'Content-Type: application/json' -X PUT -d "{\"allow_secondary\": 1, \"max_per_ip\": 1, \"min_workers\": 0, \"max_workers\": 4, \"queues\": [\"$1\",\"$1_low\"]}" http://config.ss/worker/supermarket/$1;
    echo "Updating config of $1";
    curl http://config.ss/worker/rebalance;
    echo "Rebalance done";
}

mount_dd() {
    lsblk
    echo 'usb location example: sdb1'
    read USB_PATH
    echo 'iso path example: /home/m/arch-linux.iso'
    read ISO_PATH
    sudo umount /dev/$USB_PATH
    sudo dd bs=4M if=$ISO_PATH of=/dev/$USB_PATH conv=fdatasync status=progress
}

perlmv() {
    perl -le 'eval "require $ARGV[0]" and print ${"$ARGV[0]::VERSION"}' $1
}

# clear greenclip history
gnclr() {
    pkill greenclip && greenclip clear && greenclip daemon &
} >/dev/null 2>&1

### init ###
# eval "$(mcfly init zsh)"
# export MCFLY_KEY_SCHEME=nvim
# export MCFLY_FUZZY=true
# eval "$(zoxide init zsh)"

### AUTOS STARTS ###

#  pfetch
# wbcn
# DEFAULT => (?) 250 45
xset r rate 150 45

alias mon2cam="deno run --unstable -A -r -q https://raw.githubusercontent.com/ShayBox/Mon2Cam/master/src/mod.ts"
alias luamake=/home/marcel/.config/nvim/language-servers/lua-language-server/3rd/luamake/luamake
if [ -e /home/marcel/.nix-profile/etc/profile.d/nix.sh ]; then . /home/marcel/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export NODE_PATH=$(npm root -g)

# ≃≃≃≃≃≃≃≃≃ #
#  SOURCES  #
# ≃≃≃≃≃≃≃≃≃ ⩨

source ~/perl5/perlbrew/etc/bashrc
eval "$(zoxide init zsh)"
#  source /home/marcel/.config/broot/launcher/bash/br

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
