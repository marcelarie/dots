# shellcheck disable=2148

source "$HOME/.rye/env"
eval "$(starship init bash)"

# ENV. VARIABLES
export OPENAI_API_KEY=$(pass show openai/api-key)
export HOMEBREW_NO_AUTO_UPDATE=1
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/m.manzanares/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
