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
   if (git-changes) {
    "*"
  } else if (git-staged-changes) {
    "+"
  }
}

$env.PROMPT_COMMAND = { create_left_prompt }
# $env.PROMPT_COMMAND_RIGHT = { create_right_prompt }
$env.PROMPT_INDICATOR = "> "
$env.PROMPT_INDICATOR_VI_INSERT = " [i]: "
$env.PROMPT_INDICATOR_VI_NORMAL = " [n]: "
$env.PROMPT_MULTILINE_INDICATOR = ":>  "


# --------------------------------END OF FILE--------------------------------- #
# External sources

# use ~/.cache/starship/init.nu
# use external/fnm.nu
source ~/.zoxide.nu
