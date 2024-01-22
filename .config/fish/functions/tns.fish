function tns
    if count $argv >/dev/null
        tmux new-session -s $argv
    else
        tmux new-session
    end
end
