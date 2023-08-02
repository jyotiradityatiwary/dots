#!/bin/sh

DEFAULT_WALLPAPER_URL = "https://images.unsplash.com/photo-1527001219169-937cc716391e?ixlib=rb-4.0.3&amp;q=85&amp;fm=jpg&amp;crop=entropy&amp;cs=srgb&amp;dl=kym-mackinnon-ohRlkFvO5e8-unsplash.jpg&amp;w=1920"
DEFAULT_WALLPAPER_NAME = "silhouette-tree-mountain.png"

# Set defaults if variable is not set
[ $XDG_CONFIG_HOME ] || XDG_CONFIG_HOME="$HOME/.config"
[ $XDG_DATA_HOME ] || XDG_DATA_HOME="$HOME/.local/share"

## Set default wallpaper if not present
[ -f "$XDG_DATA_HOME"/wallpapers/current ] || {
	echo "Setting Wallpaper..."
	echo "  No wallpaper found at \$XDG_DATA_HOME/wallpapers/current"
	echo "  Would you like to download and use wallpaper from unsplash?"
	echo "  (You can change it later)"
	echo "  Press 'y' to confirm, or 'n' if you would like to exit the script, manually"
	echo "  place the wallpaper and then re-run this script."
	read -n1
	[ $REPLY ] && [ $REPLY = y ] && {
		curl "$DEFAULT_WALLPAPER_URL" --output "$XDG_DATA_HOME/wallpapers/$DEFAULT_WALLPAPER_NAME" && {
			ln --symbolic --relative  "$XDG_DATA_HOME/wallpapers/$DEFAULT_WALLPAPER_NAME" "current"
			echo "Wallpaper set"
		} || {
			echo "error: Could not fetch wallpaper." > /dev/stderr
			echo "  Check network or else set the wallpaper manually, then re-run this script."
			echo "Script stopped"
			exit 1
		}
	} || {
		echo "Script Stopped"
		exit
	}
	
}

## Create directory for screenshots otherwise command defined in sway config will not work
mkdir -p $HOME/Picrures/Screenshots

# Deploy dotfiles
echo "Moving sway scripts"
mkdir -p "$XDG_CONFIG_HOME"/sway/scripts
cp sway/config "$XDG_CONFIG_HOME"/sway/config
cp sway/scripts/* "$XDG_CONFIG_HOME"/sway/scripts/

mkdir -p "$XDG_CONFIG_HOME"/foot
cp foot/foot.ini "$XDG_CONFIG_HOME"/foot/foot.ini

mkdir -p "$XDG_CONFIG_HOME"/waybar
cp waybar/* "$XDG_CONFIG_HOME"/waybar/

mkdir -p "$XDG_CONFIG_HOME"/mako
cp mako/config "$XDG_CONFIG_HOME"/mako/config

mkdir -p "$XDG_CONFIG_HOME"/wofi
cp wofi/style.css "$XDG_CONFIG_HOME"/wofi/style.css

mkdir -p "$XDG_CONFIG_HOME"/lf
cp lf/* "$XDG_CONFIG_HOME"/lf/

echo "Finished"
