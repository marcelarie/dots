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
plugins=(git zsh-z zsh-syntax-highlighting zsh-autosuggestions mongodb k)

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
alias ls="exa"
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
alias hist='xdotool type --delay 0 "$(history | cut -c 8- | fzy -l 20)"'
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
alias sc='sh ~/scripts/$(ls ~/scripts/ | fzy)' # scripts selector
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

source ~/perl5/perlbrew/etc/bashrc
source /home/marcel/programs/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

PATH="/home/marcel/perl5/bin${PATH:+:${PATH}}"
export PATH
PERL5LIB="/home/marcel/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL5LIB
PERL_LOCAL_LIB_ROOT="/home/marcel/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_LOCAL_LIB_ROOT
PERL_MB_OPT="--install_base \"/home/marcel/perl5\""
export PERL_MB_OPT
PERL_MM_OPT="INSTALL_BASE=/home/marcel/perl5"
export PERL_MM_OPT

#  source /home/marcel/.config/broot/launcher/bash/br
