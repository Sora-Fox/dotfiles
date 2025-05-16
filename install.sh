#!/bin/bash

if ! command -v stow &> /dev/null; then
    echo "Error: stow not found" >&2
    exit 1
fi

stow -t $HOME alacritty
stow -t $HOME qutebrowser

stow -t $HOME dunst
stow -t $HOME xorg

stow -t $HOME bash
stow -t $HOME zsh

stow -t $HOME emacs
stow -t $HOME vim
stow -t $HOME nvim

