function init --on-event fish_prompt
    set repo_identifier (echo "$PWD-$fish_pid" | md5sum | cut -d" " -f1)

    if not test -f /tmp/$repo_identifier"_rund"
        touch /tmp/$repo_identifier"_rund"
        if test -f .rundir
            source .rundir
        end
    end
end

init
