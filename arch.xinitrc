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

# default brightness set to 50%
xrandr --output eDP-1 --brightness 0.5

# sets monitors to turn off due to inactivity after 1 hour
xset dpms 3600 3600 3600

ibus-daemon -drx

# exec dbus-launch i3
exec i3

