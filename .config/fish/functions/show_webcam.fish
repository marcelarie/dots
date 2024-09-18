function show_webcam
    set default_webcam (ls /dev/video* | head -n 1)

    if test -z $argv
        set webcam_number $default_webcam
    else
        set webcam_number "/dev/video$argv[1]"
    end

    if not test -e $webcam_number
        echo "Error: Webcam device $webcam_number not found."
        exit 1
    end

    gst-launch-1.0 -v v4l2src "device=$webcam_number" ! glimagesink
end
