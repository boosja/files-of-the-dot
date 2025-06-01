#!/bin/sh

# Fast key repeat
xset r rate 200 25

# Caps Lock as Ctrl, Swap left Alt and Windows key
# setxkbmap -option ctrl:nocaps -option altwin:swap_lalt_lwin
# Set keyboard layout to norwegian mac
setxkbmap -layout no -variant mac

# Natural scroll
xinput set-prop "$(xinput list --name-only | grep -i touchpad)" "libinput Natural Scrolling Enabled" 1

exec dwm
