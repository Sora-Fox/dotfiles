# ~/.zshenv

export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache
export XDG_STATE_HOME=$HOME/.local/state

export XINITRC=$XDG_CONFIG_HOME/xorg/xinitrc.sh
export XAUTHORITY=$XDG_CONFIG_HOME/xorg/Xauthority
export VIMINIT="source $XDG_CONFIG_HOME/vim/init.vim"

export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export HISTFILE=$ZDOTDIR/zsh_history
export HISTSIZE=10000
export SAVEHIST=0

export CC=clang
export CXX=clang++
export EDITOR=vim

export GTK_THEME="Adwaita-dark"
export GDK_SCALE=1.25
export QT_SCALE_FACTOR=1.2

