# shellcheck disable=2148

export GIT_PROMPT=true
export KUBE_PROMPT=true
source ~/.local/share/xelabash/xela.bash
source ~/.bash_aliases

set -o vi

# ~/.bashrc
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
source <(carapace _carapace)

eval "$(atuin init bash --disable-up-arrow)"

# Use bash-completion, if available
# [[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
#     . /usr/share/bash-completion/bash_completion

# Start gpg-agent if not already running
GPG_AGENT_INFO=$(gpgconf --list-dirs agent-socket)
export GPG_AGENT_INFO

GPG_TTY=$(tty)
export GPG_TTY

# If SSH_AUTH_SOCK is not set, set it to gpg-agent's SSH socket
if [ -z "$SSH_AUTH_SOCK" ] && [ -S "$GPG_AGENT_INFO.ssh" ]; then
	export SSH_AUTH_SOCK="$GPG_AGENT_INFO.ssh"
fi

# source "$HOME/.rye/env"
# source rund bash
# eval "$(starship init bash)"

# ENV. VARIABLES

# pass 
OPENAI_API_KEY=$(pass show openai/api-key)
export OPENAI_API_KEY
GITHUB_TOKEN=$(pass show github/token)
export GITHUB_TOKEN
SRC_ACCESS_TOKEN=$(pass show sg/token)
export SRC_ACCESS_TOKEN
SRC_ENDPOINT=$(pass show sg/endpoint)
export SRC_ENDPOINT

export HOMEBREW_NO_AUTO_UPDATE=1
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export HYPRSHOT_DIR=$HOME/screenshots
export EDITOR=/home/marcel/.local/share/bob/nvim-bin/nvim
export SUDO_EDITOR=/home/marcel/.local/share/bob/nvim-bin/nvim
export TERMINAL=alacritty

ANTHROPIC_API_KEY=$(pass show anthropic/api-key)
export ANTHROPIC_API_KEY

if [ "$XDG_SESSION_TYPE" == "wayland" ]; then
	export MOZ_ENABLE_WAYLAND=1
fi

function so() {
	source "$HOME/.bashrc"
}

eval "$(zoxide init bash)"

export PATH="/home/$USER/.local/share/bob/nvim-bin:$PATH"
