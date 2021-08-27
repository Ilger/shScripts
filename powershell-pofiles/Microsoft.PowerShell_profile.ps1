
# Import-Module ZLocation
# Import-Module TabExpansionPlusPlus
# Import-Module PoShFuck
Import-Module 'C:\tools\poshgit\dahlbyk-posh-git-9bda399\src\posh-git.psd1'

# ----------------------
# Aliases:
# ----------------------

# One letter alias
# ----------------------
New-Alias -Name "c" -Value "clear" -Force -Option AllScope
New-Alias -Name "k" -Value "kubectl" -Force -Option AllScope

# Quick open apps
# ----------------------
function Open-Explore { & explorer.exe . }
New-Alias -Name o -Value Open-Explore -Force -Option AllScope
function Open-VSCode { & code.cmd . }
New-Alias -Name "c." -Value Open-VSCode -Force -Option AllScope

function Open-dirProjects { & Set-Location $HOME\projects\$args }
New-Alias -Name "cdp" -Value Open-dirProjects -Force -Option AllScope
function Open-dirProjectEasypost { & Set-Location $HOME\projects\easypost$args }
New-Alias -Name "cde" -Value Open-dirProjectEasypost -Force -Option AllScope
function Open-dirProjectEasypostBull { & Set-Location $HOME\projects\easypost\bull$args }
New-Alias -Name "cdeb" -Value Open-dirProjectBull -Force -Option AllScope

function Open-dirProjectsCrax { & Set-Location $HOME\projects\craxit\$args }
New-Alias -Name "cdcr" -Value Open-dirProjectsCrax -Force -Option AllScope


# Docker aliases
# ----------------------
function Get-DockerContainerLS { & 'docker' 'container' 'ls' $args }
New-Alias -Name "dpsa" -Value "Get-DockerPsA" -Force -Option AllScope
function Get-DockerExec { & 'docker' 'exec' '-it' $args '/bin/bash' }
New-Alias -Name "dbash" -Value "Get-DockerExec" -Force -Option AllScope

function Get-DockerStopAll { 
    $dockerContainers = docker ps -q
    docker stop $dockerContainers
    docker system prune -a -f
}
New-Alias -Name "dstpa" -Value "Get-DockerStopAll" -Force -Option AllScope

function Get-DockerCleanAll { & 'docker system prune -a' }
New-Alias -Name "dclean" -Value "Get-DockerCleanAll" -Force -Option AllScope
# Docker-compse
function Get-DockerComposePs { & 'docker-compose' 'ps' $args }
New-Alias -Name "dcps" -Value "Get-DockerComposePs" -Force -Option AllScope

function Get-DockerCompose { & 'docker-compose' $args }
New-Alias -Name "dc" -Value "Get-DockerCompose" -Force -Option AllScope

function Get-DockerComposeDown { & 'docker-compose' 'down' $args }
New-Alias -Name "dcd" -Value "Get-DockerComposeDown" -Force -Option AllScope

function Get-DockerComposeUpSpecial { & 'docker-compose' 'up' '--build' '-d' '--remove-orphans' $args }
New-Alias -Name "dcup" -Value "Get-DockerComposeUpSpecial" -Force -Option AllScope

# ----------------------
# Git aliases
# ----------------------
function Get-GitAdd { & git add $args }
function Get-GitAddAll { & git add --all $args }
function Get-GitBranch { & git branch $args }
function Get-GitBranchDelete { & git branch --delete $args }
function Get-GitCommit { & git commit $args }
function Get-GitCommitMessage { & git commit -m $args }
# function Get-GitCheckout { & 'git' 'checkout' $args }
function Get-GitCheckout {
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [ArgumentCompleter( {
                param($pCmd, $pParam, $pWord, $pAst, $pFakes)

                $branchList = (git branch --format='%(refname:short)')

                if ([string]::IsNullOrWhiteSpace($pWord)) {
                    return $branchList;
                }

                $branchList | Select-String "$pWord"
            })]
        [string] $branch
    )

    git checkout $branch;
}
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

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
    Import-Module "$ChocolateyProfile"
}


# # yarn link/unlink bookit
# function Open-YarnLinkCraxAngularCore { 
#     Write-Host "Checking if Crax-Core is on local device"
#     $Currentlocation = Get-Location
#     if (Test-Path -Path "..\Angular.Core.Crax\dist\angular-crax-core") {
#         Set-Location "..\Angular.Core.Crax\dist\angular-crax-core"
#         yarn link 
#         Set-Location "$Currentlocation"
#         yarn link "@crax/angular-core"
#         Write-Host "Successfully linked Core package"
#     }
#     else {
#         Write-Host "CRAX-CORE NOT FOUND!"
#         Write-Host "Please clone the Crax.Core.Angular repository onto your device, or if you already have the repository build the library first by navigating into the folder and using 'ng build --watch'"
#     }
# }
# New-Alias -Name "ylccm" -Value Open-YarnLinkCraxAngularCore -Force -Option AllScope
