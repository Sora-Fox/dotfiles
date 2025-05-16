#!/bin/bash
# ~/.xinitrc

# export XCURSOR_THEME=arc_midnight_cur
# export XCURSOR_SIZE=24

setxkbmap -layout us,ru -option grp:win_space_toggle -option ctrl:nocaps 

dunst &
flameshot &
diodon &
redshift -l 55.751244:37.618423 &
picom --config ~/.config/picom/picom.conf  &

~/.config/xorg/status.sh &
exec dwm

