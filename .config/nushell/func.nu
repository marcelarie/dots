# notes
def th [] {
    cd $"($env.HOME)/clones/pers/notes"
    nvim .
}

def zkn [note_title] {
    cd $"($env.HOME)/clones/pers/notes"
    zk new --title $note_title
}

def zko [] {
    cd $"($env.HOME)/clones/pers/notes"
    nvim -c 'ZkNotes'
}

def zkwo [] {
    cd $"($env.HOME)/clones/pers/notes"
    nvim ix07-work-to-do-s.md
}
