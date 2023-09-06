source ./alias.nu
source ./func.nu

$env.config = {
  edit_mode: vi,
  show_banner: false,
  table: {
    mode: thin
  }
}

def create_left_prompt [] {
    let home = ($env.HOME)
    let path_segment = ($env.PWD)
    let current_branch = " 🌱 " + ($"(ansi purple_bold)(current_branch)")

    let clean_path = $path_segment | str replace $home "~"

    ($clean_path + $current_branch)
}

def create_right_prompt [] {

#     let time_segment = ([
#         (current_branch)
#     ] | str join)
#
#     if $time_segment ~= $env.HOME {
#        $time_segment = $time_segment | str replace $env.HOME "~"
#     }
#
      (git status --porcelain | awk '{print $1;}' | tr '\n' ' ')
#     $time_segment
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
