#! /bin/sh

# Ask for command from user
cmd=$(echo 'Lock and Suspend
Shut Down
Restart
Exit Sway
Reload Sway
Lock Screen' | wofi --dmenu --insensitive --matching=fuzzy --prompt 'Action')

# Run command
case $cmd in
	'Lock and Suspend' ) $XDG_CONFIG_HOME/sway/scripts/lockscreen.sh --daemonize ; systemctl suspend ;;
	'Shut Down' )systemctl poweroff ;;
	'Restart' ) systemctl reboot ;;
	'Exit Sway' ) swaymsg exit ;;
	'Reload Sway' ) swaymsg reload ;;
	'Lock Screen' ) $XDG_CONFIG_HOME/sway/scripts/lockscreen.sh ;;
	* ) echo "Invalid Command" ;;
esac
