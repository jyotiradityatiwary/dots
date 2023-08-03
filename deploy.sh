#!/bin/sh

SCRIPT_NAME="deploy.sh"

DEFAULT_WALLPAPER_URL="https://images.unsplash.com/photo-1527001219169-937cc716391e?ixlib=rb-4.0.3&amp;q=85&amp;fm=jpg&amp;crop=entropy&amp;cs=srgb&amp;dl=kym-mackinnon-ohRlkFvO5e8-unsplash.jpg&amp;w=1920"
DEFAULT_WALLPAPER_NAME="silhouette-tree-mountain.png"

# refuse to run if script called from external directory
[ $0 == "./$SCRIPT_NAME" ] || {
	echo "Please cd to the directory of the script and run using ./$SCRIPT_NAME"
	exit 1
}


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

echo "Copying configs to $XDG_CONFIG_HOME..."
cp --verbose --recursive "files/xdg-config/* " "$XDG_CONFIG_HOME/"
echo ""
echo "Copying files to $HOME..."
cp --verbose --recursive "files/xdg-config/*" "$HOME/"

# Rename files from files/home-hidden/FILENAME to .FILENAME and copy them to $HOME
echo "Copying dotfiles to home folder..."
for filename in $(ls files/home-hidden/)
do
	cp --verbose "files/home-hidden/$filename" "$HOME/.$filename"
done

echo "Finished"
