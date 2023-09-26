# notes
def th [] {
    cd $"($env.HOME)/clones/pers/notes"
    nvim .
}

def zkn [note_title] {
    cd $"($env.HOME)/clones/pers/notes"
    zk new --title $note_title
}

def zko [] {
    cd $"($env.HOME)/clones/pers/notes"
    nvim -c 'ZkNotes'
}

def zkwo [] {
    cd $"($env.HOME)/clones/pers/notes"
    nvim ix07-work-to-do-s.md
}

def rgfind [file] { rg --files | rg $file }

# nu

# This is not possible yet :(
# ls ~/.config/nushell/*.nu | each { |f| source $f.name }
def so [] { exec nu }

def colored_string [value, color: string] {
    $"(ansi ($color))($value)(ansi reset)"
}

# prompt related
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

def node_path [path: string] {
  if not (ls -a | rg 'package.json' | is-empty) {
    $path + (node_version)
  } else {
    $path
  }
}

def ruby_version [] {
  let ruby_version = (^rbenv version | str trim | str replace "ruby " "" | split row ' ' | get 0)
  $"(ansi red)  ($ruby_version)(ansi reset)"
}

def ruby_path [path: string] {
  if not (ls -a | rg 'Gemfile' | is-empty) {
    $path + (ruby_version)
  } else {
    $path
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

def git_main_branch [] {
    git remote show origin
    | lines
    | str trim
    | find --regex 'HEAD .*?[：: ].+'
    | first
    | str replace --regex 'HEAD .*?[：: ](.+)' '$1'
}

def get_clean_path [] {
    let home = $env.HOME
    let path_segment = $env.PWD
    let node_version = (node_version)
    let no_clones_path = override_clones_dir_path $path_segment
    let clean_path = $no_clones_path | str replace $home "~"
    $clean_path
}

def pos_git_path [path: string] {
  let branch = (do { git rev-parse --abbrev-ref HEAD } | complete | get stdout | str trim)

  if ($branch | is-empty) {
    $path
  } else {
    let current_branch = colored_string  (" 🌱 " + $branch) 'purple_bold'
    $path + $current_branch
  }
}

def get_dev_env_path [path:string] {
    let pos_ruby_path = ruby_path $path
    let pos_node_path = node_path $pos_ruby_path
    let post_git_path = pos_git_path $pos_node_path

    $post_git_path
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

def colored_error_prompt [prompt: string] {
  if ($env.LAST_EXIT_CODE == 0) {
    colored_string $prompt 'green_bold'
  } else {
    colored_string $prompt 'red_bold'
  }
}

def git_log [number=5:int] {
    let log = git log --pretty=%h»¦«%s»¦«%aN»¦«%aE»¦«%aD -n $number
       | lines
       | split column "»¦«" commit subject name email date
       | upsert date {|d| $d.date | into datetime}

    $log
}

def git_log_by_date [number=25:int] {
  let log = git log --pretty=%h»¦«%s»¦«%aN»¦«%aE»¦«%aD -n $number
      | lines
      | split column "»¦«" commit subject name email date
      | upsert date {|d| $d.date
      | into datetime
      | format date '%Y-%m-%d'}
      | group-by date
      | transpose date count

  $log
}
