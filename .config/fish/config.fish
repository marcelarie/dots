# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃ #
#    SOURCES     #
# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃ ⩨
source ~/.config/fish/path.fish
source ~/.config/fish/alias.fish
source ~/.config/fish/abbr.fish
source ~/.config/fish/keybinds.sh
# source /opt/homebrew/opt/asdf/libexec/asdf.fish

# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃ #
#     CONFIG     #
# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃ ⩨
set fish_greeting

# base16-gruvbox-dark-medium # :)

### "bat" as manpager
# export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Transient prompt
# function starship_transient_prompt_func
#   starship module character
# end
# starship init fish | source
# enable_transience

# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃##
#   EXTERNAL SOURCES   #
# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃##
starship init fish | source
zoxide init fish | source
fnm env --use-on-cd --log-level quiet | source # fnm has a fish plugin
direnv hook fish | source
pyenv init - | source
# source /Users/m.manzanares/.opam/opam-init/init.fish >/dev/null 2>/dev/null; or true
# status --is-interactive; and rbenv init - fish | source

# Atuin config
set -gx ATUIN_NOBIND true
status --is-interactive
atuin init fish | source
bind --erase \cr
bind -M insert \cr _atuin_search
# end

# ENV VARS
set -g -x EDITOR nvim
set -g -x HYPRSHOT_DIR $HOME/screenshots
# set -g DOCKER_HOST (podman machine inspect --format '{{.ConnectionInfo.PodmanSocket.Path}}')
# set -g OPENAI_API_KEY (pass show openai/api-key)
set -g -x ANTHROPIC_API_KEY (pass show anthropic/api-key)
set -g -x GITHUB_TOKEN (pass show github/token)
# set -g -x SRC_ACCESS_TOKEN (pass show sg/token)
# set -g -x SRC_ENDPOINT (pass show sg/endpoint)
set -g -x GPG_TTY (tty)
set -g MANPAGER 'nvim +Man!'
set -g PAGER 'less -FRX'
set -g -x MOZ_ENABLE_WAYLAND 1

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# if test -f /Users/m.manzanares/miniconda3/bin/conda
#     eval /Users/m.manzanares/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# else
#     if test -f "/Users/m.manzanares/miniconda3/etc/fish/conf.d/conda.fish"
#         . "/Users/m.manzanares/miniconda3/etc/fish/conf.d/conda.fish"
#     else
#         set -x PATH "/Users/m.manzanares/miniconda3/bin" $PATH
#     end
# end
# <<< conda initialize <<<
