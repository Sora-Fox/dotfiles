#!/bin/bash
# ~/.xinitrc

export XCURSOR_THEME=arc_midnight_cur
export XCURSOR_SIZE=26

setxkbmap -layout us,ru -option grp:caps_toggle -option caps:none

dunst &
flameshot &
diodon &
redshift -l 55.751244:37.618423 &
picom --config ~/.config/picom/picom.conf  &

~/.config/status.sh &
exec dwm

