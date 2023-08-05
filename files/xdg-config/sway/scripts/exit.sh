#! /bin/sh

# Note : Running `systemctl suspend` automatically locks the screen because of swayidle running $XDG_CONFIG_HOME/sway/scripts/exit.sh

source $XDG_CONFIG_HOME/sway/scripts/vars.sh

# Define t=text and c=commands
suspend_t='󰤄 Suspend'
poweroff_t='⏻  Shut Down'
reboot_t='  Restart'
exit_t='󰗼  Exit Sway'
reload_t='󰑓  Reload Sway'
lock_t='󰌾  Lock Screen'

# Ask for command from user
cmd=$(echo "$suspend_t
$poweroff_t
$reboot_t
$exit_t
$reload_t
$lock_t" | wofi --dmenu --insensitive --matching=fuzzy --prompt 'Action')

# Run command
case $cmd in
	$suspend_t ) systemctl suspend ;;
	$poweroff_t )systemctl poweroff ;;
	$reboot_t ) systemctl reboot ;;
	$exit_t ) swaymsg exit ;;
	$reload_t ) swaymsg reload ;;
	$lock_t ) $lock_cmd ;;
	* ) echo "Invalid Command" ;;
esac
