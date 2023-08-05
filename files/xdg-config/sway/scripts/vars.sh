#! /bin/sh

# This script defines variables for all other scripts in this directory.
# Source this file using `source $XDG_CONFIG_HOME/sway/scripts/vars.sh`

# Location of all scripts related to sway
scripts_dir="$XDG_CONFIG_HOME/sway/scripts"

# Command to lock the screen
lock_cmd="$scripts_dir/lockscreen.sh"

# Same command as above except that it detaches from the terminal after locking.
# It is different from using `$lock_cmd & some other command` because this method forks the process immediately and does not ensure that the screen is locked before the other command is executed
lock_cmd_d="$lock_cmd --daemonize"
