#!/bin/sh
killall swaybg
OLD_PID=$!
while true; do
    img_path=$(find ~/Pictures/Wallpapers/ -type f | shuf -n1)
    swaybg -i $img_path -m fill &
    wal -i $img_path -e -t -q -n 
    eww -c /home/vikram/.config/eww/bar/ reload
    pywalfox update
    echo $img_path > ~/.cache/curr_bg
    wal-telegram --wal -r 
    sway reload
    NEXT_PID=$!
    kill $OLD_PID
    OLD_PID=$NEXT_PID
    sleep 1800
done
