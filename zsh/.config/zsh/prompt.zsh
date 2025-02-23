# ~/.config/zsh/prompt.zsh

custom_prompt() {
  local RED="%F{red}"
  local YELLOW="%F{220}"
  local SAND="%F{183}"
  local GREEN="%F{green}"
  local CYAN="%F{cyan}"
  local BROWN="%F{yellow}"

  local RESET="%f"
  local SEPARATOR="%F{white} :: ${RESET}"

  PROMPT=${RED}%n${RESET}
  PROMPT+=${SEPARATOR}
  PROMPT+=${BROWN}%~${RESET}

  local branch=$(git branch --show-current 2>/dev/null)
  if [[ -n "$branch" ]]; then
      local modified=$(git diff --name-only                      2>/dev/null | wc -l)
      local untracked=$(git ls-files --others --exclude-standard 2>/dev/null | wc -l)
      local staged=$(git diff --cached --name-only               2>/dev/null | wc -l)
      local to_push=$(git log origin/$branch..$branch --oneline  2>/dev/null | wc -l)

      PROMPT+=${SEPARATOR}
      PROMPT+=${CYAN}$branch${RESET}
      ((untracked > 0)) && PROMPT+="${SEPARATOR}${YELLOW}U~${untracked}${RESET}"
      ((modified > 0))  && PROMPT+="${SEPARATOR}${ORANGE}M~${modified}${RESET}"
      ((staged > 0))    && PROMPT+="${SEPARATOR}${SAND}S~${staged}${RESET}"
      ((to_push > 0))   && PROMPT+="${SEPARATOR}${SAND}P~${to_push}${RESET}"
  fi

  PROMPT+=$'\n'
  PROMPT+="${GREEN}>${RESET} "
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd custom_prompt

