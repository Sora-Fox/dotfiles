# ~/.zshenv

export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache
export XDG_STATE_HOME=$HOME/.local/state

export XINITRC=$XDG_CONFIG_HOME/xorg/xinitrc.sh
export VIMINIT="source $XDG_CONFIG_HOME/vim/init.vim"

export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export _Z_DATA=$ZDOTDIR/z_data
export HISTFILE=$ZDOTDIR/zsh_history
export HISTSIZE=10000
export SAVEHIST=0

export CC=clang
export CPP=clang-cpp
export CXX=clang++
export AR=llvm-ar
export NM=llvm-nm
export LD=ld.lld
export RANLIB=llvm-ranlib

export COMMON_FLAGS="-O2 -pipe -march=native -mtune=native"
export CFLAGS="${COMMON_FLAGS}"
export CXXFLAGS="${COMMON_FLAGS}"

export TERM=xterm-256color
export EDITOR=emacsclient
export MANPAGER="bat --style plain"

export GTK_THEME="Adwaita-dark"
export GDK_SCALE=1.25
export QT_SCALE_FACTOR=1.2

