function timer
    set time_unit minutes
    set time_value $argv[1]
    set time_left (math "$time_value * 60")

    if test $time_value -eq 1
        echo 'match 1'
        set time_unit seconds
    else if echo $time_value | grep -E '^0\.' >/dev/null
        echo 'match 0.*'
        set time_unit seconds
    end

    echo "Timer set for $time_left $time_unit."

    for x in (seq $time_value)
        echo "$time_left $time_unit left."
        sleep 1
        set time_left (math "$time_value - $x")
    end

    set say_text = "Doo da doo da dum dee dee doodly doo dum dum dum doo da doo da doo da doo da doo da doo da doo"
    set voice = Cellos

    for x in (seq 1000)
        say --voice=$voice $say_text
        sleep 0.5
    end
end
