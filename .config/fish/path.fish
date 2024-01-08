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

set -xg CALIBRE_APPS "/Applications/calibre.app/Contents/MacOS/"
switch "$PATH"
    case ":$CALIBRE_APPS:"
        # Do nothing
    case "*"
        fish_add_path $CALIBRE_APPS
end


for p in /run/current-system/sw/bin
    fish_add_path $p
end

fish_add_path /Users/m.manzanares/scripts/
