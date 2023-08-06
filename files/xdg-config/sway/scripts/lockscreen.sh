#!/bin/sh

# Using `grim`, take a screenshot scaled to 50%, pass it to ImageMagick `convert` which
# blurs it and saves it to a temporary file
grim -s 0.5 /dev/stdout | convert /dev/stdin -blur 0x8 /tmp/lockscreen-blur-wallpaper-tmp

# Locks the screen immediately, using wallpaper obtained from above command
# Also, pass arguments from this script to swaylock, which is needed to implement '--daemonize'
swaylock --show-failed-attempts --image /tmp/lockscreen-blur-wallpaper-tmp $@
