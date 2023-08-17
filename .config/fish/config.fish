# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃ #
#    SOURCES     #
# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃ ⩨
source ~/.config/fish/path.fish
source ~/.config/fish/alias.fish
source ~/.config/fish/keybinds.sh
source ~/.config/fish/external/zoxide.fish
source /opt/homebrew/opt/asdf/libexec/asdf.fish

# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃ #
#     CONFIG     #
# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃ ⩨
set fish_greeting

# base16-gruvbox-dark-medium # :)

### "bat" as manpager
# export MANPAGER="sh -c 'col -bx | bat -l man -p'"

for p in /run/current-system/sw/bin
    if not contains $p $fish_user_paths
        set -g fish_user_paths $p $fish_user_paths
    end
end

set -g fish_user_paths /Users/marcelmanzanares2/scripts $fish_user_paths
status --is-interactive; and rbenv init - fish | source

# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃##
#   EXTERNAL SOURCES   #
# ≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃≃##
starship init fish | source
fnm env --use-on-cd | source
direnv hook fish | source
# status --is-interactive; and rbenv init - fish | source

# Atuin config
set -gx ATUIN_NOBIND true
status --is-interactive
atuin init fish | source
bind --erase \cr
bind -M insert \cr _atuin_search
# end

# ENV VARS
set -g EDITOR nvim
# set -g DOCKER_HOST (podman machine inspect --format '{{.ConnectionInfo.PodmanSocket.Path}}')
set -g OPENAI_API_KEY (pass show openai/api-key)
set -g GPG_TTY (tty)
set -g MANPAGER 'nvim +Man!'
set -g PAGER 'less -FRX'
set -g HOMEBREW_NO_AUTO_UPDATE 1
# set -g M1 1

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/m.manzanares/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
