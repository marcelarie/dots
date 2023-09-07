$env.EDITOR = 'nvim'
$env.OPENAI_API_KEY = (pass show openai/api-key)
$env.GITHUB_TOKEN = (pass show github/token)


# fnm support on cd
if not (which fnm | is-empty) {
  ^fnm env --json | from json | load-env
  # Checking `Path` for Windows
  let path = if 'Path' in $env { $env.Path } else { $env.PATH }
  let node_path = if (sys).host.name == 'Windows' {
    $"($env.FNM_MULTISHELL_PATH)"
  } else {
    $"($env.FNM_MULTISHELL_PATH)/bin"
  }
  $env.PATH = ($path | prepend [ $node_path ])
}

# --------------------------------END OF FILE--------------------------------- #

# External sources

zoxide init nushell | save -f ~/.zoxide.nu
