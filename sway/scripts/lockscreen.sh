#!/bin/sh

[ $XDG_DATA_DIR ] || XDG_DATA_DIR="$HOME/.local/share"
# Times the screen off and puts it to background
swayidle \
    timeout 10 'swaymsg "output * dpms off"' \
    resume 'swaymsg "output * dpms on"' &

grim -s 0.5 /dev/stdout | convert /dev/stdin -blur 0x8 /tmp/lockscreen-blur-wallpaper-tmp

# Locks the screen immediately
swaylock --image /tmp/lockscreen-blur-wallpaper-tmp
# Kills last background task so idle timer doesn't keep running
kill %%
