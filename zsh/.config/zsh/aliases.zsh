# ~/.config/zsh/aliases.zsh

if command -v git &>/dev/null; then
  alias gad='git add'
  alias gbr='git branch'
  alias gbra='git branch -a'
  alias gca='git commit --amend'
  alias gcan='git commit --amend --no-edit'
  alias gcm='git commit'
  alias gdf='git diff'
  alias gdfs='git diff --staged'
  alias glg='git log --graph --decorate --pretty=oneline --abbrev-commit'
  alias glgl='git log --pretty=format:"%C(yellow)%h %C(blue)%ad %C(green)%an%n%Creset%s%n%n%b" --date=short --name-status'
  alias gpf='git push --force'
  alias gph='git push'
  alias gpln='git pull --no-rebase'
  alias gplr='git pull -r'
  alias gre='git rebase'
  alias gri='git rebase -i'
  alias gst='git status -sb'
  alias gsw='git switch'
fi

if command -v ls &>/dev/null; then
  alias ls='ls --color=auto'
  alias  l='ls --color=auto -1'
  alias la='ls --color=auto -A'
  alias ll='ls --color=auto -lAh'
fi

command -v tree &>/dev/null && alias tree='tree -C'
command -v grep &>/dev/null && alias grep='grep --color=auto'
command -v clang-tidy &>/dev/null && alias clang-tidy='clang-tidy --use-color'
command -v xclip &>/dev/null && alias cpy='xclip -selection clipboard'
command -v bat &>/dev/null && alias bat='bat --theme OneHalfDark'

alias ..='cd ..'
alias ...='cd ../..'

