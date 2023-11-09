#!/usr/bin/env nu

def main [] {
    tmux new-session -d -s NU-TEST
    tmux new-window -n EDITOR
    tmux send-keys nu C-m
    tmux send-keys nvim C-m

    tmux attach-session -d -t NU-TEST
}
