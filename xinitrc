#!/bin/bash

# load x resources
[[ -f ~/.Xresources ]] && xrdb ~/.Xresources

xset dpms 0 0 300

# disable touchpad when typing
syndaemon -k -R -d

#xcape
xcape -e '#66=Escape;#37=Return'

source /etc/X11/xinit/xinitrc.d/30-dbus.sh

# gnome keyring
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
export GNOME_KEYRING_CONTROL
export GNOME_KEYRING_PID

exec i3 >> .config/i3/log 2>&1
