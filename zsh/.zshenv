# ~/.zshenv

: ${XDG_CONFIG_HOME:=$HOME/.config}
: ${XDG_DATA_HOME:=$HOME/.local/share}
: ${XDG_CACHE_HOME:=$HOME/.cache}
: ${XDG_STATE_HOME:=$HOME/.local/state}
export XDG_CONFIG_HOME XDG_DATA_HOME XDG_CACHE_HOME XDG_STATE_HOME

: ${ZDOTDIR:=$XDG_CONFIG_HOME/zsh}
export ZDOTDIR

: ${HISTFILE:="${XDG_STATE_HOME}/zsh_history"}
: ${HISTSIZE:=10000}
: ${SAVEHIST:=10000}
export HISTFILE HISTSIZE SAVEHIST

: ${CC:=clang}
: ${CXX:=clang++}
: ${EDITOR:=vim}
export CC CXX EDITOR

: ${VIMINIT:="source $XDG_CONFIG_HOME/vim/init.vim"}
export VIMINIT

