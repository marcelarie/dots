# gh api --method=GET search/issues -f q='commenter:@me' --jq '.items[] | { issue: .number, repository_url: .repository_url }' -f per_page=1000 | fzf --preview 'GH_FORCE_TTY=100% gh issue view $(echo {1} | jq .issue) --repo $(echo {1} | jq .repository_url | sed -e "s/https:\\/\\/api.github.com\\/repos\\///" | sed \'s/"//g\' )' --preview-window up
function ghsi
    set --local query $argv[1]

    if test -z $query
        printf "Usage: ghsi <query>\n"
        return
    end

    set --local base_command (gh search issues $query | fzf --preview 'GH_FORCE_TTY=100% gh issue view {2} --repo {1}' --preview-window up)

    set --local issue_number (echo $base_command | awk '{print $2}')
    set --local issue_repo (echo $base_command | awk '{print $1}')

    if test -z $issue_number
        printf "No issue selected\n"
        return
    end

    if test -z $issue_repo
        printf "No issue selected\n"
        return
    end

    gh issue view "$issue_number" --repo "$issue_repo" --comments
end
