# ~/.config/zsh/.zshrc

fpath=($ZDOTDIR/plugins $fpath)

source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/completion.zsh
source $ZDOTDIR/prompt.zsh
source $ZDOTDIR/plugins/z/z.sh

setopt HIST_SAVE_NO_DUPS
bindkey -e

