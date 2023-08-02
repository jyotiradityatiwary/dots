# Frequently Asked Questions

**Q) What is XDG_CONFIG_HOME, XDG_DATA_HOME, etc?**
They are variables (also used inside this script) that determine where different programs place their config files, data files, etc. Unless changed their default values are :

```sh
XDG_CONFIG_HOME="$HOME/.config"
XDG_DATA_HOME="$HOME/.local/share"
```

where `$HOME` is your users home directory.

1) **How to set wallpaper?**

Place your wallpapers inside `$XDG_DATA_HOME/wallpapers/`, then symlink them as `current` in the same directory.

Here is an example showing how to do this assuming environment variables have default values and you placed your wallpaper in a file called `picture.jpg` :

```sh
cd "~/.local/share/wallpapers/picture.jpg"
ln -sf "picture.jpg" "current"
```
