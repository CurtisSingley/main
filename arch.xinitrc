#!/bin/sh
#
# ~/.xinitrc

userresources=$HOME/.Xresources
# usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
# sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

# if [ -f $sysmodmap ]; then
#     xmodmap $sysmodmap
# fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

# if [ -f "$usermodmap" ]; then
#     xmodmap "$usermodmap"
# fi

# enable mousekeys
xkbset m
xkbset exp =m

ibus-daemon -drx

# exec dbus-launch i3
exec i3

