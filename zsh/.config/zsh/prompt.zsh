# ~/.config/zsh/prompt.zsh

custom_prompt() {
  local WDIR_COL="%F{#88C0D0}"
  local GITB_COL="%F{#A3BE8C}"
  local GITM_COL="%F{#EBCB8B}"
  local SYMB_COL="%F{#D8DEE9}"
  local NULL_COL="%f"
  local SEP="${SYMB_COL} :: ${NULL_COL}"

  PROMPT=${WDIR_COL}%~${NULL_COL}
  local branch=$(git branch --show-current 2>/dev/null)
  if [[ -n "$branch" ]]; then
      PROMPT+=${SEP}
      if git status --porcelain 2>/dev/null | grep -qE "^ M|^M"; then
          PROMPT+=${GITM_COL}$branch\*${NULL_COL}
      else
          PROMPT+=${GITB_COL}$branch${NULL_COL}
      fi
  fi
  PROMPT+=$'\n'
  PROMPT+="${SYMB_COL}>${NULL_COL} "
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd custom_prompt

