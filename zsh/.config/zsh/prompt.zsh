# ~/.config/zsh/prompt.zsh

custom_prompt()
{
    local SYMB_COL="%F{#D8DEE9}"
    local NULL_COL="%f"
    PROMPT="${SYMB_COL}>${NULL_COL} "
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd custom_prompt

