function stayawake
    caffeinate -dims &
    set caffeinate_pid (pgrep -n caffeinate)


    set frames - "\\" "|" /
    # set frames "🏃" "🚶"
    while kill -0 $caffeinate_pid >/dev/null 2>&1
        for frame in $frames
            printf "\rCaffeinate activated. Press Ctrl+C to stop. %s" $frame
            sleep 0.2
        end
    end

    if kill -0 $caffeinate_pid >/dev/null 2>&1
        kill $caffeinate_pid
    end
    echo "\rStay awake deactivated."
end
