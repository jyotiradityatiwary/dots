# Frequently Asked Questions

##### Q) What is `$XDG_CONFIG_HOME`, `$XDG_DATA_HOME`, etc?

They are variables (also used inside this script) that determine where different programs place their config files, data files, etc. Unless changed their default values are :

```sh
XDG_CONFIG_HOME="$HOME/.config"
XDG_DATA_HOME="$HOME/.local/share"
```

where `$HOME` is your users home directory.

For now, they can be changed but manual changes will likely be overwritten by a future update. Changing them will become easy once scripts are updated to allow user configuration in `.bash_profile`

##### Q) How to set wallpaper?

Place your wallpapers inside `$XDG_DATA_HOME/wallpapers/`, then symlink them as `current` in the same directory.

Here is an example showing how to do this assuming environment variables have default values and you placed your wallpaper in a file called `picture.jpg` :

```sh
cd ~/.local/share/wallpapers/
ln -srf "picture.jpg" current
```
