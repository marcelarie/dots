#!/usr/bin/env nu

def main [$type: string] {
    let work_path = $env.HOME + '/clones/' + $type;
    let selected_repo = (^ls $work_path | fzy)

    if $selected_repo == "" {
        echo "No repo selected"
        exit
    }

    let repo = $selected_repo | str replace '/' '-' | str replace '.' '-dot-'
    let session = $type + '-' + $repo
    let repo_name = $work_path + '/' + $selected_repo + "/"
    let shell = 'nu'
    let editor = 'nvim'
    let custom_command = 'yazi'

    let has_session = (tmux has-session -t $session) | str contains " can't find session"

    if not $has_session {
        print "Creating session: " $session
        tmux new-session -d -s $session
        tmux new-window -n $editor
        # tmux send-keys $shell C-m
        tmux send-keys $"cd ($repo_name)" C-m
        # tmux send-keys $shell C-m
        # tmux split-window -v -c '#{pane_current_path}' $"cd ($repo_name)"
        tmux send-keys $editor C-m
        tmux send-keys C-l
        tmux split-window -v
        tmux select-pane -t 1
        # # tmux send-keys $shell C-m
        tmux send-keys $"cd ($repo_name)" C-m
        tmux resize-pane -D 80
        tmux send-keys $shell C-m
        tmux send-keys C-l

    } else {
        echo "Session already exists"
    }

    tmux -2 attach-session -t $session
}
