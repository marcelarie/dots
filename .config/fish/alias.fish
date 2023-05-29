set current_branch (git symbolic-ref --short HEAD)

alias ls="exa"
alias l="ls"
alias ll="exa -l"
alias lla="exa -la"
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias df="df -h"
alias free="free -m"
alias pb="pbcopy"
alias ".."="cd .."
alias "..."="cd ../.."
alias "...."="cd ../../.."
alias cat="bat"
alias so="source ~/.config/fish/config.fish"
alias src="nvim ~/.config/skhd/skhdrc"
alias yrc="nvim ~/.config/yabai/yabairc"
alias govh="ssh marcel@135.125.234.60"
alias gb="git checkout (git branch | fzy | xargs)"
alias gbde="git branch -D (git branch | fzy | xargs)"
alias gstp="git status --porcelain | awk 'match($1, 'M'){ print $2 }' | paste -sd ' '"
alias grs="git restore"
alias grsa="git restore ."
alias grss="git restore --staged"
alias grssa="git restore --staged *"
alias bbd="brew bundle dump --force --file=/Users/m.manzanares/Brewfile"
alias cbd="ls ~/.cargo/bin > ~/Cargofile"
# alias glom="git pull origin (git branch -rl "*/HEAD" | rev | cut -d/ -f1 | rev)''"
alias glof="git log --oneline -M --stat --follow --"
alias glast="git log --pretty=format:"%h" HEAD^..HEAD"
alias gstal="git stash list"
alias grec='git log --graph --oneline --decorate ( git fsck --no-reflog | awk "/dangling commit/ {print $3}" )'
alias gstapp="git stash apply"
alias gdfc=" git diff --name-only origin/HEAD"
alias gw="git worktree"
alias gwa="git worktree add"
alias gwl="git worktree list"
alias gwp="git worktree prune"
alias gwr="git worktree remove"
alias nvm="fnm"
alias ys="yarn start"
alias yu="yarn update"
alias yi="yarn install"
alias ya="yarn add"
alias yb="yarn build"
alias yig="yarn install -g"
alias zrc="nvim ~/.zshrc"
# alias arc="nvim ${nixConfig}/home-manager/programs/alacritty/default.nix"
alias frc="nvim ~/.config/fish/config.fish"
# alias krc="nvim ${nixConfig}/home-manager/programs/kitty.nix"
alias wrc="nvim ~/.config/wezterm/wezterm.lua"
alias brc="nvim ~/.bashrc"
alias lrc="cd ~/.config/leftwm & nvim config.toml"
alias clones="~/clones"
alias dots="vi ~/.gitignore"
alias alrc="nvim ~/.config/fish/alias.fish"
alias zkn="cd ~/clones/pers/notes; ~/scripts/zk-new.sh"
alias zko="cd ~/clones/pers/notes; nvim -c 'ZkNotes'; cd -"
alias vi="nvim"
alias iv="nvim"
alias vo="nvim"
alias vu="nvim"
alias bi="nvim -c 'colorscheme OceanicNext'"
alias mi="nvim -u ~/.config/nvim/minimal-init.lua"
alias revi="bash ~/scripts/install-last-neovim.sh"
alias rc="nvim ~/.config/nvim/*init.*"
alias gorc="cd ~/.config/nvim/"
alias docker="podman"
alias dor="docker run"
alias dob="docker build"
alias dos="docker stop"
alias dosp="docker system prune -a && docker volume prune"
alias dorai="docker rmi (docker images -a -q)"
alias doraif="docker rmi -f (docker images -a -q)"
alias doex="docker exec -it"
alias docker-compose="podman-compose"
alias dc="docker-compose"
alias dcp="docker-compose ps"
alias dcr="docker-compose rm"
alias dcu="docker-compose up"
alias dcl="docker compose logs -f"
alias hist="xdotool type --delay 0 (history | fzy -l 20)"
alias live-server="live-server --no-browser"
alias pt="vi ~/personal/tasks"
alias gopt="cd ~/personal/tasks"
alias wbcn="curl wttr.in/Barcelona?0Q"
alias create-react-app="create-react-app --template mini"
alias gmod="git ls-files -m"
alias ytmp3="youtube-dl --extract-audio --audio-format mp3"
alias xyy="xsel --clipboard --input"
alias xp="xsel --clipboard --output"
alias node15="source /usr/share/nvm/init-nvm.sh"
alias scp="sh ~/scripts/(ls ~/scripts/ | fzy)"
alias nm="mw -Y && neomutt"
alias mc="mcfly search"
# alias own="zyc $HOME/clones/own"
# alias learn="zyc $HOME/clones/learning"
# alias fork="zyc $HOME/clones/forks"
# alias work="zyc $HOME/clones/work"
# alias af="xdotool type --delay 0 ( alias | fzy | awk -F' ' '{print $2}')"
alias chs="cht.sh"

alias ta="tmux attach -t"
alias tas="$HOME/scripts/tmux/tmux-attach-search.sh"
alias trc="nvim $HOME/.config/tmux/tmux.conf"
alias skrc="nvim $HOME/.config/skhd/skhdrc"
alias tn="tmux new-session"
alias tl="tmux list-sessions"
alias ts="tmux switch -t (tmux ls | cut -f1 -d":" | fzy)"
alias tks="tmux kill-session -t"
alias tmsc="tmux switch-client -t"
alias two="~/scripts/tmux/work1.sh"
alias tpe="~/scripts/tmux/pers1.sh"
alias muxi= tmuxinator
alias xis= "tmuxinator start"
alias cn="cargo new"
alias ca="cargo add"
alias cr="cargo run"
alias cb="cargo build"
alias cu="cargo update"
alias ciu="cargo install-update -a"
alias ci="cargo install"
alias cdo="cargo doc --open"
alias cw="cargo watch -x run"
alias cpub="cargo publish"
alias ctd="cargo tree -d"
alias ns="nix-shell"
# alias nrc="nvim ${nixConfig}/darwin-configuration.nix"
# alias nfrc="nvim ${nixConfig}/flake.nix"
# alias nfu="nix flake update ${nixConfig}"
alias nixin="~/scripts/nix-search.sh"
alias tg="topgrade"
# alias hrc="nvim ${nixConfig}/home-manager/home.nix"
alias ch="cheat"
alias che="cheat -e"
# alias chl="cheat (cheat -l | cut -f1 -d " " | fzy)"
alias ctag="ctags --recurse = yes"
alias sdw="time sc deploy workers"
alias sdm="time sc deploy manager"
alias logcli="logcli --addr="http://monitor-0.ss:3100""
alias sup="cd ~/clones/work/supers/"
alias prove="provewatcher"
alias gpdw="git push && sc deploy workers"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias hibernate="sudo systemctl hibernate"
alias hybridsleep="sudo systemctl hybrid-sleep"
alias trash="sudo rm -rf ~/.Trash/*"
alias npmls="npm list -g | grep -o '\\s.*' | tr -d '\\n' | sed 's/\\n+|\\r|⏎//g'"
# luamake = "$HOME/.config/nvim/language-servers/lua-language-server/3rd/luamake/luamake"
alias g="git"
alias ga="git add"
alias gaa="git add --all"
alias gapa="git add --patch"
alias gba="git branch -a"
alias gbl="git blame -b -w"
alias gbnm="git branch --no-merged"
alias gbr="git branch --remote"
alias gbs="git bisect"
alias gbsb="git bisect bad"
alias gbsg="git bisect good"
alias gbsr="git bisect reset"
alias gbss="git bisect start"
alias gc="git commit -v"
# alias gc!="git commit -v --amend"
# alias cn!"="git commit -v --no-edit --amend"
# alias ca"="git commit -v -a"
# alias ca!"="git commit -v -a --amend"
# alias can!"="git commit -v -a --no-edit --amend"
# alias cans!"="git commit -v -a -s --no-edit --amend"
alias gcam="git commit -a -m"
alias gcb="git checkout -b"
alias gcf="git config --list"
alias gcl="git clone --recursive"
alias gclean="git clean -fd"
alias gpristine="git reset --hard & git clean -dfx"
alias gcm="git checkout master"
alias gcmsg="git commit -m"
alias gco="git checkout"
alias gcount="git shortlog -sn"
alias gcp="git cherry-pick"
alias gcs="git commit -S"
alias gd="git diff"
alias gdt="GIT_EXTERNAL_DIFF=difft git diff"
alias gds="git diff --staged"
alias gdca="git diff --cached"
alias gdct="git describe --tags `git rev-list --tags --max-count 1`"
alias gdtr="git diff-tree --no-commit-id --name-only -r"
alias gdw="git diff --word-diff"
alias gf="git fetch"
alias gfa="git fetch --all --prune"
alias gfo="git fetch origin"
alias gg="git gui citool"
alias gga="git gui citool --amend"
alias ggpull="git pull origin $current_branch"
alias ggpush="git push origin $current_branch"
alias gpsup="git push --set-upstream origin $current_branch"
alias ggsup="git branch --set-upstream-to origin $current_branch"
alias gignore="git update-index --assume-unchanged"
alias git-svn-dcommit-push="git svn dcommit & git push github master:svntrunk"
alias gk="gitk --all --branches"
# alias gke="gitk --all (git log -g --pretty format:%h)"
alias gl="git pull"
alias glg="git log --stat"
alias glgp="git log --stat -p"
alias glgg="git log --graph"
alias glgga="git log --graph --decorate --all"
alias glgm="git log --graph --max-count 10"
# alias glod="
# alias   git log --pretty=format:"%C(yellow)%h %Creset%C(cyan)%C(bold)%ad%Creset %C(green)%Creset%s" --date=short"
alias glo="git log --oneline --decorate"
# alias glol =
# alias it log --graph --pretty:format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
# alias ola =
# alias it log --graph --pretty:format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all"
alias glog="git log --oneline --decorate --graph"
alias gloga="git log --oneline --decorate --graph --all"
alias gm="git merge"
alias gmom="git merge origin/master"
alias gmt="git mergetool --no-prompt"
alias gmtvim="git mergetool --no-prompt --tool vimdiff"
alias gmum="git merge upstream/master"
alias gp="git push"
alias gpd="git push --dry-run"
alias gpoat="git push origin --all & git push origin --tags"
alias gpu="git push upstream"
alias gpv="git push -v"
alias gr="git remote"
alias gra="git remote add"
alias grb="git rebase"
alias grba="git rebase --abort"
alias grbc="git rebase --continue"
alias grbi="git rebase -i"
alias grbm="git rebase master"
alias grbs="git rebase --skip"
alias grh="git reset HEAD"
alias grhh="git reset HEAD --hard"
alias grmv="git remote rename"
alias grrm="git remote remove"
alias grset="git remote set-url"
alias grt="cd (git rev-parse --show-toplevel || echo ".")"
alias gru="git reset --"
alias grup="git remote update"
alias grv="git remote -v"
alias gsb="git status -sb"
alias gsd="git svn dcommit"
alias gsi="git submodule init"
alias gsps="git show --pretty short --show-signature"
alias gsr="git svn rebase"
alias gss="git status -s"
alias gst="git status"
alias gs="git status"
alias gsta="git stash save"
alias gstaa="git stash apply"
alias gstd="git stash drop"
alias gstl="git stash list"
alias gstpo="git stash pop"
alias gsts="git stash show --text"
alias gsu="git submodule update"
alias gts="git tag -s"
alias gtv="git tag | sort -V"
alias gunignore="git update-index --no-assume-unchanged"
# alias gunwip="git log -n 1 | grep -q -c " - -wip - -" & git reset HEAD~1"
alias glr="git pull --rebase"
alias glrv="git pull --rebase -v"
alias glum="git pull upstream master"
alias gwch="git whatchanged -p --abbrev-commit --pretty medium"
# alias gwip="
# alias git add -A; git rm (git ls-files --deleted) 2> /dev/null; git commit -m "--wip--""
alias opl="op item list --vault Private"
alias opg="op item get"
alias gpr="gh pr view"
alias gprb="gh pr view -w"
alias gpre="gh pr edit"
# alias ghstr="$HOME/scripts/gh-stars.sh"
alias pbc="pbcopy"
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
