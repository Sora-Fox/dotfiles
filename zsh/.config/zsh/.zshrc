# ~/.config/zsh/.zshrc

fpath=($ZDOTDIR/plugins/zsh-completions/src $fpath)
fpath=($ZDOTDIR/plugins $fpath)

source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/completion.zsh
source $ZDOTDIR/prompt.zsh
source $ZDOTDIR/plugins/z/z.sh
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#86b6c3"

setopt HIST_SAVE_NO_DUPS
bindkey -e
bindkey '^ ' autosuggest-accept

fastfetch --config $XDG_CONFIG_HOME/fastfetch/greeting.jsonc

