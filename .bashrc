# shellcheck disable=2148

GIT_PROMPT=true
KUBE_PROMPT=true
source ~/.local/share/xelabash/xela.bash

# Start gpg-agent if not already running
GPG_AGENT_INFO=$(gpgconf --list-dirs agent-socket)
export GPG_AGENT_INFO

# If SSH_AUTH_SOCK is not set, set it to gpg-agent's SSH socket
if [ -z "$SSH_AUTH_SOCK" ] && [ -S "$GPG_AGENT_INFO.ssh" ]; then
    export SSH_AUTH_SOCK="$GPG_AGENT_INFO.ssh"
fi

# source "$HOME/.rye/env"
# source rund bash
# eval "$(starship init bash)"
eval "$(zoxide init bash)"

# ENV. VARIABLES
# export OPENAI_API_KEY=$(pass show openai/api-key)
# export GITHUB_TOKEN=$(pass show github/token)
export HOMEBREW_NO_AUTO_UPDATE=1
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export HYPRSHOT_DIR=$HOME/screenshots
export EDITOR=nvim
export ANTHROPIC_API_KEY=$(pass show anthropic/api-key)

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/m.manzanares/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

alias vi=nvim
alias ls=eza
alias ll='eza -alF'
alias hx='helix'
