# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃ #
#    SOURCES     #
# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃ ⩨
source ~/.config/fish/path.fish
source ~/.config/fish/alias.fish
source ~/.config/fish/keybinds.sh
# source /opt/homebrew/opt/asdf/libexec/asdf.fish

# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃ #
#     CONFIG     #
# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃ ⩨
set fish_greeting

# base16-gruvbox-dark-medium # :)

### "bat" as manpager
# export MANPAGER="sh -c 'col -bx | bat -l man -p'"

if not set -q LIGHTWEIGHT_MODE
    status --is-interactive; and rbenv init - fish | source
end

# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃##
#   EXTERNAL SOURCES   #
# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃##
starship init fish | source
zoxide init fish | source
# fnm env --use-on-cd --log-level quiet | source # fnm has a fish plugin
direnv hook fish | source
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
if not set -q LIGHTWEIGHT_MODE
    # set -g DOCKER_HOST (podman machine inspect --format '{{.ConnectionInfo.PodmanSocket.Path}}')
    set -g OPENAI_API_KEY (pass show openai/api-key)
    set -g -x GITHUB_TOKEN (pass show github/token)
    # set -g GPG_TTY (tty)
end
# set -g ANDROID_HOME ~/Library/Android/sdk
# set -g ANDROID_SDK_ROOT ~/Library/Android/sdk
set -g MANPAGER 'nvim +Man!'
set -g PAGER 'less -FRX'
set -g HOMEBREW_NO_AUTO_UPDATE 1
# set -g ANDROID_AVD_HOME ~/Library/Android/avd
# set -g M1 1

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/m.manzanares/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

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
