source alias.nu
source func.nu

$env.config = {
  edit_mode: vi,
  show_banner: false,
  table: {
    mode: thin
  },
   hooks: {
    # env_change: {
    #   PWD: [{ |before, after|
    #     if ('FNM_DIR' in $env) and ([.nvmrc .node-version] | path exists | any { |it| $it }) {
    #       fnm use
    #     }
    #   }]
    # }
  }
}

def create_left_prompt [] {
    let home = ($env.HOME)
    let path_segment = ($env.PWD)
    let branch = (current_branch)
    let current_branch = " 🌱 " + ($"(ansi purple_bold)(current_branch)")

    let clean_path = $path_segment | str replace $home "~"

    ($clean_path + $current_branch)
}

def create_right_prompt [] {
      (git status --porcelain | awk '{print $1;}' | tr '\n' ' ')
}

$env.PROMPT_COMMAND = { create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = { create_right_prompt }
$env.PROMPT_INDICATOR = "> "
$env.PROMPT_INDICATOR_VI_INSERT = " [i]: "
$env.PROMPT_INDICATOR_VI_NORMAL = " [n]: "
$env.PROMPT_MULTILINE_INDICATOR = "::> "


# --------------------------------END OF FILE--------------------------------- #
# External sources

# use ~/.cache/starship/init.nu
source ~/.zoxide.nu
