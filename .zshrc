# shellcheck disable=2148

# pnpm
export PNPM_HOME="/Users/m.manzanares/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
#
export GITHUB_TOKEN=$(pass show github/token)

# eval "$(starship init zsh)"
eval "$(direnv hook zsh)"
source "$HOME/.rye/env"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/m.manzanares/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fnm
export PATH="/Users/m.manzanares/Library/Application Support/fnm:$PATH"
eval "`fnm env`"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/m.manzanares/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/m.manzanares/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/m.manzanares/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/m.manzanares/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
