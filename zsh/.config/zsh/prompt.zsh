# ~/.config/zsh/prompt.zsh

autoload -Uz colors
colors
setopt PROMPT_SUBST

custom_prompt()
{
    local SYMB_COL="%F{white}"
    local NULL_COL="%f"
    PROMPT="${SYMB_COL}>${NULL_COL} "
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd custom_prompt

