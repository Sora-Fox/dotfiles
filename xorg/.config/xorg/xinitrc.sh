#!/bin/bash
# ~/.config/xorg/xinitrc.sh

setxkbmap -layout us,ru -option grp:win_space_toggle -option ctrl:nocaps 
redshift -O 5000

dunst &
flameshot &
diodon &
picom &
${HOME}/.config/xorg/status.sh &

exec dwm

