# ~/.config/zsh/aliases.zsh

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
alias glgl='git log --pretty=format:"%C(yellow)%h %C(blue)%ad %C(green)%an%n%Creset%s%n%n%b" --date=short --name-status'
alias glog='git log --pretty=format:"%C(yellow)%h%Creset %s%n%C(cyan)Author%Creset: %an [%ae] - %ad%n%C(magenta)Committer%Creset: %cn [%ce] - %cd%n"'
alias gdf='git diff'
alias gdfs='git diff --staged'

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
alias cat='bat --style plain --paging never --theme OneHalfDark'
alias bat='bat --theme OneHalfDark'
alias cpy='xclip -selection clipboard'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias cxx='eval "$CXX $CXXFLAGS"'
alias ed='${EDITOR} -nw'
alias clfg='find . \( -name "*.cpp" -o -name "*.hpp" -o -name "*.h" \) -not -path "./build/*" -exec clang-format -i {} \;'

function cpploc {
    dir=${1:-.}
    for file in $(find $dir -type f -name "*.hpp" -o -name "*.cpp" -o -name "*.h"); do
        loc=$(tokei $file | tail -n2 | head -n1 | awk '{print $3}')
        echo -e "$loc\t$file"
    done 2>/dev/null | sort -n
    local total=0
    for file in $(find $dir -type f -name "*.hpp" -o -name "*.cpp" -o -name "*.h"); do
        loc=$(tokei $file | tail -n2 | head -n1 | awk '{print $3}')
        ((total += loc))
    done
    echo -e "\033[1mTotal:\t${total}\033[0m"
}

