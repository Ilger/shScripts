# Clear terminal
# ----------------------
alias c='clear'

#switch terminal back to bash
alias swt='chsh -s /bin/bash'

# Change dir Aliases
# ----------------------
alias p='cd ~/Desktop/CodePrjcts/'
alias h='cd ~/Desktop/CodePrjcts/other,\ test\ and\ learn/internettingishard'

cc ()
{
    cd "$1" &&
    code
}

mc ()
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}

mcw ()
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"  &&
    touch index.html &&
    touch style.css  &&
    code .
}


# open apps
# ----------------------
alias o='xdg-open .'
alias a='atom .'

# Sass watch and compile
# ----------------------
alias sw='sass --watch'
alias sv='sass --version'


# ----------------------
# Git Aliases
# ----------------------
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add --all'
alias gau='git add --update'
alias gb='git branch'
alias gbd='git branch --delete '
alias gc='git commit'
alias gcm='git commit --message'
alias gcf='git commit --fixup'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gcos='git checkout staging'
alias gcod='git checkout develop'
alias gd='git diff'
alias gda='git diff HEAD'
alias gi='git init'
alias glg='git log --oneline --decorate --all --graph'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gm='git merge --no-ff'
alias gma='git merge --abort'
alias gmc='git merge --continue'
alias gp='git pull'
alias gpr='git pull --rebase'
alias gr='git rebase'
alias gs='git status'
alias gss='git status --short'
alias gst='git stash'
alias gsta='git stash apply'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash save'

# ----------------------
# Git Functions
# ----------------------
# Git log find by commit message
function glf() { git log --all --grep="$1"; }
