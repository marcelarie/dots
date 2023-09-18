source alias.nu
source func.nu

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
  let node_version = (fnm current)

  if ($node_version == "system" or ($node_version | is-empty)) {
     ""
  } else {
    $"(ansi yellow_bold) 󰎙 ($node_version)(ansi reset)"
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
    let home = ($env.HOME)
    let path_segment = ($env.PWD)
    let branch = (current_branch)
    let current_branch = " 🌱 " + ($"(ansi purple_bold)(current_branch)(ansi reset)")

    let no_clones_path = override_clones_dir_path $path_segment
    let clean_path = $no_clones_path | str replace $home "~"

    ( $clean_path + (node_version) + $current_branch  )
}

def create_right_prompt [] {
  let duration = $env.CMD_DURATION_MS | into int

  let parsed_duration = $"($duration / 1000 | math round --precision 2)s"

  if ($duration > 60000) {
    let parsed_duration = $"($duration / 60000 | math round --precision 2)m"
  }
  # if is a minute or more calculate on minutes
  let time = date now | format date "%H:%M"

  ($parsed_duration + " - " + $time)
  #  if (git-changes) {
  #   "*"
  # } else if (git-staged-changes) {
  #   "+"
  # }
}

def colored_error_prompt [prompt: string] {
  if ($env.LAST_EXIT_CODE == 0) {
    $"(ansi green_bold)($prompt) (ansi reset)"
  } else {
    $"(ansi red_bold)($prompt) (ansi reset)"
  }
}

$env.PROMPT_COMMAND = { create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = { create_right_prompt }
$env.PROMPT_INDICATOR = {colored_error_prompt '>'}
$env.PROMPT_INDICATOR_VI_INSERT = {colored_error_prompt '[i]:'}
$env.PROMPT_INDICATOR_VI_NORMAL = {colored_error_prompt '[n]:'}
$env.PROMPT_MULTILINE_INDICATOR = {colored_error_prompt ':> '}


# --------------------------------END OF FILE--------------------------------- #
# External sources

# use ~/.cache/starship/init.nu
# use external/fnm.nu
source ~/.zoxide.nu
