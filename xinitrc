#!/bin/bash

# load x resources
[[ -f ~/.Xresources ]] && xrdb ~/.Xresources

xset dpms 0 0 300

# disable touchpad when typing
syndaemon -k -R -d

# xcape
xcape -e '#66=Escape;#37=Return'

# source /etc/X11/xinit/xinitrc.d/30-dbus.sh
export DBUS_SESSION_BUS_ADDRESS

# notifications
dunst &

# reddish screen at night
redshift -t 6500:4500 &

# gnome keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

exec i3 >> .config/i3/log 2>&1
