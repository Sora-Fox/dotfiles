# ~/.bashrc

if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache
export XDG_STATE_HOME=$HOME/.local/state

export CXX=clang++
export CC=clang
export COMMON_FLAGS="-O2 -pipe -march=native -mtune=native -Wall -Wextra"
export CFLAGS="${COMMON_FLAGS}"
export CXXFLAGS="${COMMON_FLAGS}"

export TERM=xterm-256color
export EDITOR=nvim

export GTK_THEME="Adwaita-dark"
export GDK_SCALE=1.25
export QT_SCALE_FACTOR=1.2

export HISTFILE=/dev/null
export HISTSIZE=1000
export HISTFILESIZE=0
shopt -s histappend

alias gad='git add'
alias gaa='git add -A'
alias gcm='git commit'
alias gca='git commit -a'
alias gcma='git commit --amend'
alias gcaa='git commit -a --amend'
alias gph='git push'
alias gpf='git push --force'
alias gplr='git pull -r'
alias gpln='git pull --no-rebase'
alias gre='git rebase'
alias gri='git rebase -i'
alias gbra='git branch -a'
alias gbr='git branch'
alias gsw='git switch'
alias gst='git status -sb'
alias glg='git log --graph --decorate --pretty=oneline --abbrev-commit'
alias gdf='git diff'
alias gdfs='git diff --staged'

alias cmk='cmake -S . -G Ninja -B build --DCMAKE_BUILD_TYPE=Debug'
alias cbld='cmake --build build/ -j$(nproc)'
alias ctst='cbld --target test -j$(nproc)'
alias clfg='find . \( -name "*.cpp" -o -name "*.hpp" -o -name "*.h" \) -not -path "./build/*" -exec clang-format -i {} \;'

alias top='sudo btop'
alias ping='ping -c 2'
alias md='mkdir -p'
alias rd='rmdir'
alias df='df -hT'
alias cls='clear'
alias ll='eza --header --long --group --git -Alh --sort=name'
alias l='eza -1'
alias ls='eza -Ah'
alias tree='eza -T'
alias cpy='wl-copy'
alias cat='bat --style plain --paging never --theme OneHalfDark'
alias bat='bat --theme OneHalfDark'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias dow='cd ~/Downloads'
alias doc='cd ~/Documents'

alias ins='sudo dnf install'
alias upd='sudo dnf update'
alias cxx='eval "$CXX $CXXFLAGS"'
alias ed='${EDITOR}'
alias sour='source ${ZDOTDIR}/.zshrc'

function custom_prompt {
    local RED="\[\033[0;31m\]"
    local LIGHT_RED="\[\033[1;31m\]"
    local GREEN="\[\033[0;32m\]"
    local BROWN="\[\033[0;33m\]"
    local CYAN="\[\033[0;36m\]"
    local LIGHT_GRAY="\[\033[0;37m\]"
    local RESET="\[\033[0m\]"
    local YELLOW="\[\033[38;5;220m\]"
    local ORANGE="\[\033[38;5;208m\]"
    local SAND="\[\033[38;5;183m\]"
    local SEPARATOR="${LIGHTGRAY} • ${RESET}"

    if [[ $LAST_STATUS != 0 ]]; then
        case $LAST_STATUS in
            1) error_msg="Error" ;;
            126) error_msg="Permission denied" ;;
            130) error_msg="Terminated by Ctrl-C" ;;
            137) error_msg="Killed (signal 9)" ;;
            *) error_msg="Error code: $LAST_STATUS" ;;
        esac
        PS1="${RED}ERROR: $error_msg${RESET}\n"
    else
        PS1=""
    fi

    PS1+="${RED}\u${RESET}"
    local SSH_IP="${SSH_CLIENT%% *}"
    if [[ -n "$SSH_IP" ]]; then
        PS1+="${RED}@\h${RESET}"
    fi
    PS1+="${SEPARATOR}${BROWN}\w${RESET}"

    local branch=$(git branch --show-current 2>/dev/null)
    if [[ -n "$branch" ]]; then
        local modified=$(git diff --name-only 2>/dev/null | wc -l)
        local untracked=$(git ls-files --others --exclude-standard 2>/dev/null | wc -l)
        local staged=$(git diff --cached --name-only 2>/dev/null | wc -l)
        local to_push=$(git log origin/$branch..$branch --oneline 2>/dev/null | wc -l)

        PS1+=$SEPARATOR"${CYAN}$branch${RESET}"
        ((untracked > 0)) && PS1+="${SEPARATOR}${YELLOW}U~${untracked}${RESET}"
        ((modified > 0)) && PS1+="${SEPARATOR}${ORANGE}M~${modified}${RESET}"
        ((staged > 0)) && PS1+="${SEPARATOR}${SAND}S~${staged}${RESET}"
        ((to_push > 0)) && PS1+="${SEPARATOR}${SAND}P~${to_push}${RESET}"
    fi

    if [[ $EUID -ne 0 ]]; then
        PS1+="\n${GREEN}> ${RESET}"
    else
        PS1+="\n${RED}# ${RESET}"
    fi
}

function save_last_status {
    LAST_STATUS=$?
}

command_not_found_handle() {
    error_msg="Command not found"
}

PROMPT_COMMAND='save_last_status; custom_prompt'

