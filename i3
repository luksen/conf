#modkey
set $mod Mod1

# font for window titles. ISO 10646 = Unicode
font xft:DejaVu Sans 9

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# start programms
#bindsym $mod+Return exec gnome-terminal
bindsym $mod+Return exec sakura
bindsym $mod+w exec tools/rungoto.sh claws-mail
bindsym $mod+e exec firefox
bindsym $mod+r exec j4-dmenu-desktop --term="gnome-terminal" --dmenu="rofi -dmenu -p '→ '"
bindsym $mod+Tab exec rofi -show window

# border
bindsym $mod+z border pixel 2
bindsym $mod+Shift+Z border normal 2
new_window pixel 2
for_window [class="MuPDF"] border normal 2

# mail to workspace 0
assign [class="Claws"] 0:mail

#scratchpad
#bindsym $mod+Tab scratchpad show
#bindsym $mod+Shift+Tab move scratchpad

# volume control
bindcode 122 exec amixer -q set Master 5%- && killall -USR1 i3status
bindcode 123 exec amixer -q set Master 5%+ && killall -USR1 i3status

# brightness
bindsym XF86MonBrightnessUp exec xbacklight -inc 10 -steps 1
bindsym XF86MonBrightnessDown exec xbacklight -dec 10 -steps 1

# lock screen
bindsym XF86ScreenSaver exec "i3lock -d -c 000000"
# screen off
bindsym XF86Launch1 exec "xset dpms force off"

# kill focused window
bindsym $mod+q kill
bindsym --release button2 kill

# change focus
bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right

# move focused window
bindsym $mod+Shift+H move left
bindsym $mod+Shift+J move down
bindsym $mod+Shift+K move up
bindsym $mod+Shift+L move right

# resize window (you can also use the mouse for that)
bindsym $mod+m mode "resize"

mode "resize" {
    bindsym Escape mode "default"
    bindsym Return mode "default"
    bindsym h resize grow   left 5 px or 5 ppt
    bindsym j resize grow   down 5 px or 5 ppt
    bindsym k resize grow   up 5 px or 5 ppt
    bindsym l resize grow   right 5 px or 5 ppt
    bindsym $mod+h resize shrink   right 5 px or 5 ppt
    bindsym $mod+j resize shrink   up 5 px or 5 ppt
    bindsym $mod+k resize shrink   down 5 px or 5 ppt
    bindsym $mod+l resize shrink   left 5 px or 5 ppt
}

# split in horizontal orientation
bindsym $mod+c split h

# split in vertical orientation
bindsym $mod+v split v

# change container layout (stacked, tabbed, default)
bindsym $mod+o layout stacking
bindsym $mod+i layout tabbed
bindsym $mod+u layout default

# enter fullscreen mode for the focused container
bindsym $mod+p fullscreen

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+y focus parent

# focus the child container
bindsym $mod+x focus child

# switch to workspace
bindsym $mod+a workspace 1:a
bindsym $mod+s workspace 2:s
bindsym $mod+d workspace 3:d
bindsym $mod+f workspace 4:f
bindsym $mod+g workspace 5:g

# move focused container to workspace
bindsym $mod+Shift+a move workspace 1:a
bindsym $mod+Shift+s move workspace 2:s
bindsym $mod+Shift+d move workspace 3:d
bindsym $mod+Shift+f move workspace 4:f
bindsym $mod+Shift+g move workspace 5:g

bindsym $mod+Shift+p move container to output VGA1

# outputs to screens
workspace "1:a" output HDMI1
workspace "2:s" output HDMI1
workspace "3:d" output HDMI1
workspace "4:f" output HDMI1
workspace "5:g" output LVDS1

# reload the configuration file
bindsym $mod+Shift+C reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+R restart
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+E exit

# colors
# class					border	back	text	indicator
client.focused			#87875f	#87875f	#ffffdf	#dfdf87
client.focused_inactive	#303030	#303030	#949494	#303030
client.unfocused		#1c1c1c	#1c1c1c	#949494	#1c1c1c
client.urgent			#ff5f5f	#ff5f5f	#949494	#ff5f5f

# Start i3bar
bar {
	colors {
		background			#1c1c1c
		statusline			#d0d0d0
		focused_workspace	#87875f	#87875f	#ffffdf
		inactive_workspace	#1c1c1c	#1c1c1c	#949494
		active_workspace	#303030	#303030	#949494
		urgent_workspace	#ff5f5f	#ff5f5f	#949494
	}
	status_command i3status
	strip_workspace_numbers yes
}

exec eval "$(<.fehbg)"
exec compton --config conf/compton
