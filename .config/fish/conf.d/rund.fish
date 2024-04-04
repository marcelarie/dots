function init --on-event fish_prompt
    if test -f .rundir
        source .rundir
    end
end

init
