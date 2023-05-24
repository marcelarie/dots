set -xg PNPM_HOME "$HOME/Library/pnpm"
switch "$PATH"
    case ":$PNPM_HOME:"
        # Do nothing
    case '*'
        fish_add_path $PNPM_HOME
end

set -xg RYE_SHIMS "$HOME/.rye/shims"
switch "$PATH"
    case ":$RYE_SHIMS:"
        # Do nothing
    case "*"
        fish_add_path $RYE_SHIMS
end
