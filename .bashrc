source "$HOME/.rye/env"
eval "$(starship init bash)"

# ENV. VARIABLES
export OPENAI_API_KEY=$(pass show openai/api-key)
