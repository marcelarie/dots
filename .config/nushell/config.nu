source alias.nu
source func.nu
source colors.nu

# source external/get-weather.nu

# use ~/clones/forks/nu_scripts/custom-completions/mod.nu *
use ~/clones/forks/nu_scripts/modules/rbenv/rbenv.nu

let zoxide_completer = {|spans|
    $spans | skip 1 | zoxide query -l $in | lines | where {|x| $x != $env.PWD}
}

let fish_completer = {|spans|
    fish --command $'complete "--do-complete=($spans | str join " ")"'
    | $"value(char tab)description(char newline)" + $in
    | from tsv --flexible --no-infer
}

let carapace_completer = {|spans: list<string>|
    carapace $spans.0 nushell $spans
    | from json
    | if ($in | default [] | where value =~ '^-.*ERR$' | is-empty) { $in } else { null }
}

# This completer will use carapace by default
let external_completer = {|spans|
    let expanded_alias = (scope aliases | where name == $spans.0 | get -i 0 | get -i expansion)
    let spans = (if $expanded_alias != null  {
        $spans | skip 1 | prepend ($expanded_alias | split words)
    } else { $spans })

    {
        # carapace completions are incorrect for nu
        nu: $fish_completer
        # fish completes commits and branch names in a nicer way
        git: $fish_completer
        # carapace doesn't have completions for asdf
        asdf: $fish_completer
        z: $zoxide_completer
        zi: $zoxide_completer
    } | get -i $spans.0 | default $carapace_completer | do $in $spans

}

$env.config = {
  color_config: $base16_theme

  edit_mode: vi
  show_banner: false
  table: {
    padding: { left: 0 right: 0 }
    mode: thin
  }
  filesize: {
    metric: true
  }
  cursor_shape: {
    vi_insert: underscore
    vi_normal: block
  }
  completions: {
      case_sensitive: false # set to true to enable case-sensitive completions
      quick: false  # set this to false to prevent auto-selecting completions when only one remains
      partial: false  # set this to false to prevent partial filling of the prompt
      algorithm: "prefix"  # prefix or fuzzy
      external: {
          max_results: 100
          enable: true
          completer: $external_completer
      }
  }
  keybindings: [
   {
    name: trigger-completion-menu
    modifier: none
    keycode: tab
    mode: [emacs vi_normal vi_insert]
    event: {
      until: [
        { send: menu name: completion_menu }
        { send: menunext }
        { edit: complete }
      ]
    }
  }
  {
    name: completion_previous
    modifier: shift
    keycode: backtab
    mode: emacs
    event: { send: menuprevious }
  }
  # {
  #   name: reload
  #   modifier: control
  #   keycode: char_r
  #   mode: [emacs, vi_insert, vi_normal]
  #   event: {
  #       send: executehostcommand,
  #       cmd: "exec nu"
  #   }
  # }
 ]
   hooks: {
    pre_prompt: [{ ||
      let direnv = (direnv export json | from json)
      let direnv = if not ($direnv | is-empty) { $direnv } else { {} }
      $direnv | load-env
    }]
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

def get_weather [location="Barcelona"] {
   curl -s $"wttr.in/$location?format=%t"
}

def create_right_prompt [] {
  let lc_duration = last_command_duration
  let time = date now | format date "%H:%M"
  let $duration_and_time = $"($lc_duration) - ($time)"
  let weather = get_weather

  (colored_string $duration_and_time 'xterm_grey50')
  # + ' '  + (colored_string $weather 'xterm_blue')
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
