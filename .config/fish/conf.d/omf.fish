# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

set EDITOR "nvim"
set TERM "kitty"

fish_vi_key_bindings

function fish_mode_prompt
  switch $fish_bind_mode
    case default
      set_color --bold red
      echo 'n '
    case insert
      set_color --bold green
      echo 'i '
    case replace_one
      set_color --bold green
      echo 'r '
    case visual
      set_color --bold brmagenta
      echo 'v '
    case '* '
      set_color --bold red
      echo '? '
  end
  set_color normal
end

# pfetch on startup
pfetch
