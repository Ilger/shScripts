
Import-Module 'C:\tools\poshgit\dahlbyk-posh-git-9bda399\src\posh-git.psd1'


# ----------------------
# Aliases:
# ----------------------

# Clear terminal
# ----------------------
New-Alias -Name "c" -Value "clear" -Force -Option AllScope

# Quick open apps
# ----------------------
function Open-Explore { & explorer.exe . }
New-Alias -Name o -Value Open-Explore -Force -Option AllScope
function Open-VSCode { & code.cmd . }
New-Alias -Name "c." -Value Open-VSCode -Force -Option AllScope

# Docker aliases
# ----------------------
function Get-DockerPs { & 'docker' 'ps' $args}
function Get-DockerPsA { & 'docker' 'ps' '-a' $args }
New-Alias -Name "dps" -Value "Get-DockerPs" -Force -Option AllScope
New-Alias -Name "dpsa" -Value "Get-DockerPsA" -Force -Option AllScope
# Docker-compse
function Get-DockerPs { & 'docker-compose' 'ps' $args}
New-Alias -Name "dcps" -Value "Get-DockerPs" -Force -Option AllScope


# ----------------------
# Git aliases
# ----------------------
function Get-GitAdd { & git add $args }
function Get-GitAddAll { & git add --all $args }
function Get-GitBranch { & git branch $args }
function Get-GitBranchDelete { & git branch --delete $args }
function Get-GitCommit { & git commit $args }
function Get-GitCommitMessage { & git commit -m $args }
function Get-GitCheckout { & git checkout $args }
function Get-GitCheckoutBranch { & git checkout -b $args }
function Get-GitCheckoutMaster { & git checkout master $args }
function Get-GitCheckoutStaging { & git checkout staging $args }
function Get-GitCheckoutDevelopment { & git checkout development $args }
function Get-GitLogGraph { & git log --oneline --decorate --all --graph $args }
function Get-GitLogDateShort { & 'git' 'log' '--pretty=format:"%h %ad %s"' '--date=short' '--all' }

function Get-GitFetch { & git fetch $args }
function Get-GitPull { & git pull $args }
# Name is GitStatusLong because posh git already had GitStatus
function Get-GitStatusLong { & git status --long $args }
function Get-GitStatusShort { & git status -s $args }
function Get-GitRemote { & git remote -v $args }

# The aliases
New-Alias -Name ga -Value Get-GitAdd -Force -Option AllScope
New-Alias -Name gaa -Value Get-GitAddAll -Force -Option AllScope
New-Alias -Name gb -Value Get-GitBranch -Force -Option AllScope
New-Alias -Name gbd -Value Get-GitBranchDelete -Force -Option AllScope
New-Alias -Name gc -Value Get-GitCommit -Force -Option AllScope
New-Alias -Name gcm -Value Get-GitCommitMessage -Force -Option AllScope
New-Alias -Name gco -Value Get-GitCheckout -Force -Option AllScope
New-Alias -Name gcob -Value Get-GitCheckoutBranch -Force -Option AllScope
New-Alias -Name gcom -Value Get-GitCheckoutMaster -Force -Option AllScope
New-Alias -Name gcos -Value Get-GitCheckoutStaging -Force -Option AllScope
New-Alias -Name gcod -Value Get-GitCheckoutDevelopment -Force -Option AllScope
New-Alias -Name glg -Value Get-GitLogGraph -Force -Option AllScope
New-Alias -Name gld -Value Get-GitLogDateShort -Force -Option AllScope
New-Alias -Name gf -Value Get-GitFetch -Force -Option AllScope
New-Alias -Name gpl -Value Get-GitPull -Force -Option AllScope
New-Alias -Name gs -Value Get-GitStatusLong -Force -Option AllScope
New-Alias -Name gss -Value Get-GitStatusShort -Force -Option AllScope
New-Alias -Name gr -Value Get-GitRemote -Force -Option AllScope
