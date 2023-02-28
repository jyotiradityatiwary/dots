#!/bin/sh

# Set defaults if variable is not set
[ $XDG_CONFIG_HOME ] || XDG_CONFIG_HOME="$HOME/.config"
[ $XDG_DATA_HOME ] || XDG_DATA_HOME="$HOME/.local/share"

## Set default wallpaper if not present
[ -f "$XDG_DATA_HOME"/wallpapers/current] || {
	mkdir -p "$XDG_DATA_HOME"/wallpapers
	cp default-wallpaper "$XDG_DATA_HOME"/wallpapers/
	ln -s "$XDG_DATA_HOME"/wallpapers/default-wallpaper "$XDG_DATA_HOME"/wallpapers/current
}

## Create directory for screenshots otherwise command defined in sway config will not work
mkdir -p $HOME/Picrures/Screenshots

# Deploy dotfiles
mkdir -p "$XDG_CONFIG_HOME"/sway/scripts
cp sway/config "$XDG_CONFIG_HOME"/sway/config
cp sway/scripts/* "$XDG_CONFIG_HOME"/sway/scripts/

mkdir -p "$XDG_CONFIG_HOME"/foot
cp foot/foot.ini "$XDG_CONFIG_HOME"/foot/foot.ini

mkdir -p "$XDG_CONFIG_HOME"/waybar
cp waybar/* "$XDG_CONFIG_HOME"/waybar/

[ -e /usr/share/applications/nnn.desktop ] || [ -e /usr/local/share/applications/nnn.desktop ] || [ -e "$XDG_DATA_HOME"/applications/nnn.desktop ] || {
	mkdir -p "$XDG_DATA_HOME"/applications
	cp applications/nnn.desktop "$XDG_DATA_HOME"/applications/nnn.desktop
}

mkdir -p "$XDG_CONFIG_HOME"/mako
cp mako/config "$XDG_CONFIG_HOME"/mako/config

mkdir -p "$XDG_CONFIG_HOME"/wofi
cp wofi/style.css "$XDG_CONFIG_HOME"/wofi/style.css

mkdir -p "$XDG_CONFIG_HOME"/lf
cp lf/* "$XDG_CONFIG_HOME"/lf/
