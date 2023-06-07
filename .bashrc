source "$HOME/.rye/env"
eval "$(starship init bash)"

# ENV. VARIABLES
export OPENAI_API_KEY=$(pass show openai/api-key)

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/m.manzanares/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
