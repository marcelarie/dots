function ytmu
    yt-dlp -f "bestaudio[ext=m4a]","bestaudio[ext=webm]" -x $argv
end
