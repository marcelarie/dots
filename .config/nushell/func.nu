# notes
export def th [] {
    cd $"($env.HOME)/clones/pers/notes"
    nvim .
}

export def zkn [note_title] {
    cd $"($env.HOME)/clones/pers/notes"
    zk new --title $note_title
}

export def zko [] {
    cd $"($env.HOME)/clones/pers/notes"
    nvim -c 'ZkNotes'
}

export def zkwo [] {
    cd $"($env.HOME)/clones/pers/notes"
    nvim ix07-work-to-do-s.md
}
