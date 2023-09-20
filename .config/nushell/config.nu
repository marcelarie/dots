source alias.nu
source func.nu

# source external/get-weather.nu

use ~/clones/fork/nu_scripts/custom-completions/mod.nu *

$env.config = {
  edit_mode: vi,
  show_banner: false,
  table: {
    mode: thin
  },
   hooks: {
    pre_prompt: [{ ||
      let direnv = (direnv export json | from json)
      let direnv = if ($direnv | length) == 1 { $direnv } else { {} }
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

def colored_string [value, color: string] {
    $"(ansi ($color))($value)(ansi reset)"
}

def override_clones_dir_path [path] {
  let work_path = "/clones/work/"
  let pers_path = "/clones/pers/"
  let own_path  = "/clones/own/"

  if ($work_path in $path) {
    ($path | str replace $work_path "/w/")
  } else if ($pers_path in $path) {
    ($path | str replace $pers_path "/p/")
  } else if ($own_path in $path) {
    ($path | str replace $own_path  "/o/")
  } else {
    $path
  }
}

def node_version [] {
  let node_version = (node -v)

  if ($node_version == "system" or ($node_version | is-empty)) {
    ""
  } else {
    colored_string $" 󰎙 ($node_version)" 'yellow_bold'
  }
}

def git-changes [] {
    git diff --exit-code
    if $env.LAST_EXIT_CODE == 1 {
        true
    } else {
        false
    }
}

def git-staged-changes [] {
    git diff --staged --exit-code
    if $env.LAST_EXIT_CODE == 1 {
        true
    } else {
        false
    }
}

def create_left_prompt [] {
    let home = $env.HOME
    let path_segment = $env.PWD
    let node_version = (node_version)
    let no_clones_path = override_clones_dir_path $path_segment
    let clean_path = $no_clones_path | str replace $home "~"

    if (ls -a | rg '.git' | is-empty) {
      $clean_path + $node_version
    } else {
      let branch = (^git symbolic-ref --short HEAD | str trim)
      let current_branch = " 🌱 " + (colored_string $branch 'purple_bold')
      $clean_path + $node_version + $current_branch
    }
}

def last_command_duration [] {
  let duration = $env.CMD_DURATION_MS | into int

  let parsed_duration = $"($duration / 1000 | math round --precision 2)s"
  let minute_duration = $"($duration / 60000 | math round --precision 2)m"

  if ($duration > 60000) {
    $minute_duration
  } else {
    $parsed_duration
  }
  # } else if ($duration > 3600000) {
  #   let parsed_duration = $"($duration / 3600000 | math round --precision 2)h"
  # }

}

def create_right_prompt [] {
  let lc_duration = last_command_duration
  let time = date now | format date "%H:%M"
  let $duration_and_time = $"($lc_duration) - ($time)"

  colored_string $duration_and_time 'xterm_grey50'
}

def colored_error_prompt [prompt: string] {
  if ($env.LAST_EXIT_CODE == 0) {
    colored_string $prompt 'green_bold'
  } else {
    colored_string $prompt 'red_bold'
  }
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
