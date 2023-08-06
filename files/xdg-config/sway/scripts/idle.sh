#! /bin/sh

source $XDG_CONFIG_HOME/sway/scripts/vars.sh

# Important : do not disable this script as it is responsible for locking the screen whenever `systemctl suspend` and `loginctl lock-session` are called

# The behavior of the following command is not affected by `swaymsg inhibit_idle <args>`

swayidle -w \
	timeout 180 "$lock_cmd_d" \
	timeout 240 'swaymsg "output * dpms off"' \
	timeout 300 "systemctl suspend" \
	resume 'swaymsg "output * dpms on"' \
	lock "$lock_cmd_d" \
	before-sleep "$lock_cmd_d"
