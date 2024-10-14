function current_branch
    git symbolic-ref --short HEAD
end

function git_dirs
    git ls-files | xargs -n 1 dirname | sort | uniq | grep -v '^.$' | fzy
end

function so
    source ~/.config/fish/config.fish
end
