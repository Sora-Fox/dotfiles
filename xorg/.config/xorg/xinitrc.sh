#!/bin/bash
# ~/.config/xorg/xinitrc.sh

brightnessctl set 5%
command -v setxkbmap &>/dev/null && setxkbmap -layout us,ru -option grp:win_space_toggle -option ctrl:nocaps
command -v redshift &>/dev/null && redshift -O 5000
command -v picom &>/dev/null && picom --daemon --vsync --backend glx
command -v dunst &>/dev/null && dunst &
command -v flameshot &>/dev/null && flameshot &
command -v diodon &>/dev/null && diodon &
command -v gentoo-pipewire-launcher &>/dev/null && gentoo-pipewire-launcher &
[ -x "${HOME}/.config/xorg/status.sh" ] && "${HOME}/.config/xorg/status.sh" &
exec dbus-launch --sh-syntax --exit-with-session dwm

