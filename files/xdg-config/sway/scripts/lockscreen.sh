#!/bin/sh

# Times the screen off and puts it to background
swayidle \
    timeout 10 'swaymsg "output * dpms off"' \
    resume 'swaymsg "output * dpms on"' &

grim -s 0.5 /dev/stdout | convert /dev/stdin -blur 0x8 /tmp/lockscreen-blur-wallpaper-tmp

# Locks the screen immediately
# Also, pass arguments from this script to swaylock, which is needed to implement '--daemonize'
swaylock --show-failed-attempts --image /tmp/lockscreen-blur-wallpaper-tmp $@
# Kills last background task so idle timer doesn't keep running
kill %%
