source alias.nu
source func.nu

# source external/get-weather.nu

use ~/clones/fork/nu_scripts/custom-completions/mod.nu *
use ~/clones/fork/nu_scripts/modules/rbenv/rbenv.nu *


$env.config = {
  edit_mode: vi,
  show_banner: false,
  table: {
    mode: thin
  },
   hooks: {
    pre_prompt: [{ ||
      let direnv = (direnv export json | from json)
      let direnv = if not ($direnv | is-empty) { $direnv } else { {} }
      $direnv | load-env
    }],
    env_change: {
      PWD: [{ |before, after|
        if ('FNM_DIR' in $env) and ([.nvmrc .node-version] | path exists | any { |it| $it }) {
          fnm --log-level=quiet use
        }
      }]
    }
  }
}

def create_left_prompt [] {
    let clean_path = get_clean_path
    let dev_env_path = get_dev_env_path $clean_path

    $dev_env_path
}

def create_right_prompt [] {
  let lc_duration = last_command_duration
  let time = date now | format date "%H:%M"
  let $duration_and_time = $"($lc_duration) - ($time)"

  colored_string $duration_and_time 'xterm_grey50'
}

$env.PROMPT_COMMAND = { create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = { create_right_prompt }
$env.PROMPT_INDICATOR = {colored_error_prompt "\n> "}
$env.PROMPT_INDICATOR_VI_INSERT = {colored_error_prompt "\n[i]: "}
$env.PROMPT_INDICATOR_VI_NORMAL = {colored_error_prompt "\n[n]: "}
$env.PROMPT_MULTILINE_INDICATOR = {colored_error_prompt ':> '}

# --------------------------------END OF FILE--------------------------------- #
# External sources

# use ~/.cache/starship/init.nu
# use external/fnm.nu
# source ~/.local/share/atuin/init.nu
source ~/.zoxide.nu
