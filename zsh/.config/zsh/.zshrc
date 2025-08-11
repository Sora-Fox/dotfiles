# ~/.config/zsh/.zshrc

source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/completion.zsh"
source "$ZDOTDIR/prompt.zsh"

setopt INTERACTIVE_COMMENTS
setopt HIST_SAVE_NO_DUPS EXTENDED_HISTORY
setopt INC_APPEND_HISTORY SHARE_HISTORY HIST_EXPIRE_DUPS_FIRST
bindkey -e

