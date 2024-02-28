function pmenu
    set selected_command (complete --do-complete "open -a $argv" | sed 's/^-a//' | awk '{print $1}' | fzf)

    if set -q selected_command
        open -a $selected_command
    else
        echo "No application selected"
    end
end
