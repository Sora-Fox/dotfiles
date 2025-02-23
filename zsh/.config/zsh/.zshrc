# ~/.config/zsh/.zshrc

fpath=($ZDOTDIR/plugins/zsh-completions/src $fpath)
fpath=($ZDOTDIR/plugins $fpath)

source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/completion.zsh
source $ZDOTDIR/prompt.zsh
source $ZDOTDIR/plugins/z/z.sh
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

setopt HIST_SAVE_NO_DUPS
bindkey -e

fastfetch --config $XDG_CONFIG_HOME/fastfetch/greeting.jsonc

