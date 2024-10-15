# Aliases auto generated by nu-alias-converter

alias ls = eza
alias l = ls
alias ll = eza -l
alias lla = eza -la
alias cp = cp -i
alias mv = mv -i
alias kmv = ~/scripts/mv-kebab.sh
alias rm = rm -i
alias df = df -h
alias free = free -m
alias pb = pbcopy
alias .. = cd ..
alias ... = cd ../..
alias .... = cd ../../..
alias cat = bat
alias hrc = nvim ~/.config/hypr/hyprland.conf
# alias fenv = nvim (find . -type f -name ".env" | sort -V | head -n 1) # Errors: The `find` command doesn't have flag `-t`., The `find` command doesn't have flag `-n`., The `sort` command doesn't have flag `-V`.
alias pac = sudo pacman
alias pacs = sudo pacman -S
alias pacsy = sudo pacman -Syyu
alias govh = ssh marcel@135.125.234.60
alias gb = git checkout (git branch | fzy | xargs)
alias gbde = git branch -D (git branch | fzy | xargs)
alias gstp = git status --porcelain | awk 'match($1, 'M'){ print $2 }' | paste -sd ' '
alias grs = git restore
alias grsa = git restore .
alias grss = git restore --staged
alias grssa = git restore --staged *
alias cbd = ls ~/.cargo/bin > ~/Cargofile
alias glof = git log --oneline -M --stat --follow --
alias gstal = git stash list
alias gstapp = git stash apply
alias gdfc =  git diff --name-only origin/HEAD
alias gw = git worktree
alias gwa = git worktree add
alias gwl = git worktree list
alias gwp = git worktree prune
alias gwr = git worktree remove
alias ys = yarn start
alias yd = yarn dev
alias yu = yarn update
alias yi = yarn install
alias ya = yarn add
alias yb = yarn build
alias yig = yarn install -g
alias yjd = yarn jest --silent=false --watch (git_dirs)
alias zrc = nvim ~/.zshrc
alias frc = nvim ~/.config/fish/config.fish
alias krc = ~/scripts/keyd-autoreload.sh
alias fal = nvim ~/.config/fish/alias.fish
alias wrc = nvim ~/.config/wezterm/wezterm.lua
alias brc = nvim ~/.bashrc
# alias lrc = cd ~/.config/leftwm & nvim config.toml # Errors: Extra positional argument., Extra positional argument., Extra positional argument.
alias clones = ~/clones
alias dots = vi ~/.gitignore
alias farc = nvim ~/.bash_aliases
alias zkn = do { cd ~/notes; ~/scripts/zk-new }
alias zko = do { cd ~/notes; nvim -c 'ZkNotes'; cd - }
alias zkwo = nvim ~/notes/ix07-work-to-do-s.md
alias zkpe = nvim ~/notes/hz98-personal-to-do-s.md
alias todo = ~/scripts/todos.sh
alias ftodo = ~/scripts/find-todos.sh
alias emulator = ~/Library/Android/sdk/emulator/emulator
alias vi = nvim
alias iv = nvim
alias vo = nvim
alias vu = nvim
alias visel = ~/scripts/nvim-bob-selector.sh
alias bi = nvim -c 'colorscheme OceanicNext'
alias mi = nvim -u ~/.config/nvim/minimal-init.lua
alias hx = helix
alias revi = bash ~/scripts/install-last-neovim.sh
alias rc = nvim ~/.config/nvim/*init.*
alias gorc = cd ~/.config/nvim/
alias dor = docker run
alias dob = docker build
alias dos = docker stop
# alias dosp = docker system prune -a && docker volume prune # Errors: The '&&' operator is not supported in Nushell
alias dorai = docker rmi (docker images -a -q)
alias doraif = docker rmi -f (docker images -a -q)
alias doex = docker exec -it
alias dc = docker-compose
alias dcp = docker-compose ps
alias dcr = docker-compose rm
alias dcu = docker-compose up
alias dcl = docker compose logs -f
alias hist = xdotool type --delay 0 (history | fzy -l 20)
alias live-server = live-server --no-browser
alias pt = vi ~/personal/tasks
alias gopt = cd ~/personal/tasks
alias wbcn = curl wttr.in/Barcelona?0Q
alias create-react-app = create-react-app --template mini
alias gmod = git ls-files -m
alias ytmp3 = youtube-dl --extract-audio --audio-format mp3
alias xyy = xsel --clipboard --input
alias xp = xsel --clipboard --output
# alias node15 = source /usr/share/nvm/init-nvm.sh # Errors: Can't create alias to parser keyword.
# alias nm = mw -Y && neomutt # Errors: The '&&' operator is not supported in Nushell
alias mc = mcfly search
alias ta = tmux attach -t
# alias tas = $HOME/scripts/tmux/tmux-attach-search.sh # Errors: Can't create alias to expression.
# alias trc = nvim $HOME/.config/tmux/tmux.conf # Errors: Parse mismatch during operation., Variable not found.
# alias skrc = nvim $HOME/.config/skhd/skhdrc # Errors: Parse mismatch during operation., Variable not found.
alias tn = tmux new-session
alias tl = tmux list-sessions
alias tks = tmux kill-session -t
alias tmsc = tmux switch-client -t
alias two = ~/scripts/tmux/create-session-tmex.sh work
alias tpe = ~/scripts/tmux/create-session-tmex.sh own
alias tfo = ~/scripts/tmux/create-session-tmex.sh forks
alias muxi = tmuxinator
alias xis = tmuxinator start
alias cn = cargo new
alias ca = cargo add
alias cr = cargo run
alias cb = cargo build
alias ct = cargo test
alias open = xdg-open
alias cu = cargo update
alias ciu = cargo install-update -a
alias ci = cargo install
alias cdo = cargo doc --open
alias cw = cargo watch -x run
alias cpub = cargo publish
alias ctd = cargo tree -d
alias ns = nix-shell
alias nixin = ~/scripts/nix-search.sh
alias tg = topgrade
alias stu-health-beta = stu-health 'beta'
alias ch = cheat
alias che = cheat -e
# alias chl = cheat (cheat -l | cut -f1 -d \" \" | fzy) # Errors: Unexpected end of code., Unexpected end of code., Unexpected end of code., Invalid characters after closing delimiter
alias ctag = ctags --recurse = yes
alias sdw = time sc deploy workers
alias sdm = time sc deploy manager
alias sup = cd ~/clones/work/supers/
alias prove = provewatcher
# alias gpdw = git push && sc deploy workers # Errors: The '&&' operator is not supported in Nushell
alias update-grub = sudo grub-mkconfig -o /boot/grub/grub.cfg
alias hibernate = sudo systemctl hibernate
alias hybridsleep = sudo systemctl hybrid-sleep
alias trash = sudo rm -rf ~/.Trash/*
alias npmls = npm list -g | grep -o '\\s.*' | tr -d '\\n' | sed 's/\\n+|\\r|⏎//g'
alias g = git
alias ga = git add
alias gaa = git add --all
alias gapa = git add --patch
alias gba = git branch -a
alias gbl = git blame -b -w
alias gbnm = git branch --no-merged
alias gbr = git branch --remote
alias gbs = git bisect
alias gbsb = git bisect bad
alias gbsg = git bisect good
alias gbsr = git bisect reset
alias gbss = git bisect start
alias gc = git commit -v
alias gcam = git commit -a -m
alias gcb = git checkout -b
alias gcf = git config --list
alias gcl = git clone --recursive
alias gclean = git clean -fd
alias gpristine = git reset --hard & git clean -dfx
alias gcm = git checkout master
alias gcmsg = git commit -m
alias gco = git checkout
alias gcount = git shortlog -sn
alias gcp = git cherry-pick
alias gcs = git commit -S
alias gd = git diff
# alias gdts = GIT_CONFIG_PARAMETERS=\"'diff.tool=diffsitter' 'difftool.prompt=false' 'difftool.diffsitter.cmd=diffsitter \"\$LOCAL\" \"\$REMOTE\"'\" git difftool # Errors: Unexpected end of code., Invalid characters after closing delimiter
alias gdt = GIT_EXTERNAL_DIFF=difft git diff
alias gds = git diff --staged
alias gdca = git diff --cached
# alias gdct = git describe --tags $(git rev-list --tags --max-count 1) # Errors: Parse mismatch during operation., Variable not found.
alias gdtr = git diff-tree --no-commit-id --name-only -r
alias gdw = git diff --word-diff
alias gf = git fetch
alias gfa = git fetch --all --prune
alias gfo = git fetch origin
alias gg = git gui citool
alias gga = git gui citool --amend
# alias ggpull = git pull origin $(git symbolic-ref --short HEAD) # Errors: Parse mismatch during operation., Variable not found.
# alias ggpush = git push origin $(git symbolic-ref --short HEAD) # Errors: Parse mismatch during operation., Variable not found.
# alias gpsup = git push --set-upstream origin $(git symbolic-ref --short HEAD) # Errors: Parse mismatch during operation., Variable not found.
# alias ggsup = git branch --set-upstream-to origin $(git symbolic-ref --short HEAD) # Errors: Parse mismatch during operation., Variable not found.
alias gignore = git update-index --assume-unchanged
alias git-svn-dcommit-push = git svn dcommit & git push github master:svntrunk
alias gk = gitk --all --branches
alias gl = git pull
alias glg = git log --stat
alias glgp = git log --stat -p
alias glgg = git log --graph
alias glgga = git log --graph --decorate --all
alias glgm = git log --graph --max-count 10
alias glo = git log --oneline --decorate
alias glod = git log --pretty=format:"%C(yellow)%h%Creset - %C(bold cyan)%an%Creset, %C(green)%ar%Creset : %C(reset)%s"
alias glog = git log --oneline --decorate --graph
alias gloga = git log --oneline --decorate --graph --all
alias gm = git merge
alias gmom = git merge origin/master
alias gmt = git mergetool --no-prompt
alias gmtvim = git mergetool --no-prompt --tool vimdiff
alias gmum = git merge upstream/master
alias gp = git push
alias gpd = git push --dry-run
alias gpoat = git push origin --all & git push origin --tags
alias oat = ~/scripts/open-ai/oat.sh
alias gpu = git push upstream
alias gpv = git push -v
alias gr = git remote
alias gra = git remote add
alias grb = git rebase
alias grba = git rebase --abort
alias grbc = git rebase --continue
alias grbi = git rebase -i
alias grbm = git rebase master
alias grbs = git rebase --skip
alias grh = git reset HEAD
alias grhh = git reset HEAD --hard
alias grmv = git remote rename
alias grrm = git remote remove
alias grset = git remote set-url
alias gru = git reset --
alias grup = git remote update
alias grv = git remote -v
alias gsb = git status -sb
alias gsd = git svn dcommit
alias gsi = git submodule init
alias gsps = git show --pretty short --show-signature
alias gsr = git svn rebase
alias gss = git status -s
alias gst = git status
alias gs = git status
alias gsta = git stash save
alias gstaa = git stash apply
alias gstd = git stash drop
alias gstl = git stash list
alias gstpo = git stash pop
alias gsts = git stash show --text
alias gsu = git submodule update
alias gts = git tag -s
alias gtv = git tag | sort -V
alias gunignore = git update-index --no-assume-unchanged
alias glr = git pull --rebase
alias glrv = git pull --rebase -v
alias glum = git pull upstream master
alias gwch = git whatchanged -p --abbrev-commit --pretty medium
alias opl = op item list --vault Private
alias opg = op item get
# alias gh = env -u GITHUB_TOKEN gh $argv # Errors: Variable not found.
alias gpr = gh pr view
alias ghpr_base = gh pr view --json baseRefName | jq --raw-output .baseRefName
alias gprb = gh pr view -w
alias gpre = gh pr edit
alias ghrv = gh repo view -w
alias ghic = gh search issues --commenter '@me'
alias pbc = pbcopy
alias myip = dig +short myip.opendns.com @resolver1.opendns.com
alias nurc = nvim ~/.config/nushell/config.nu
alias nual = nvim ~/.config/nushell/alias.nu
alias nuenv = nvim ~/.config/nushell/env.nu
alias nn = nnn -e
alias nnn = nnn -e
alias rofimoji = ~/scripts/tofi/emoji-selector.sh
alias fman = ./scripts/fman.sh
alias jr = just run
alias jw = just watch
alias jb = just build
alias jt = just test
# alias nmtui = $HOME/scripts/nice-color-nmtui.sh # Errors: Can't create alias to expression.
alias my_public_ip = ip -json route get 8.8.8.8 | jq -r '.[].prefsrc'
alias vps_connect = sshpass -p (pass show do-vps-marcel-ubuntu/marcel) ssh marcel@164.90.160.49
alias vps_connect_root = sshpass -p (pass show do-vps-marcel-ubuntu/root) ssh root@164.90.160.49
alias show_webcams = v4l2-ctl --list-devices
alias speedtest-cli = speedtest-rs
alias wiki = wiki-tui
