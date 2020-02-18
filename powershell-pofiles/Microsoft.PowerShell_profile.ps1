
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

function Open-dirProjects { & Set-Location C:\Users\idmrr\Documents\projects\$args}
New-Alias -Name "cdp" -Value Open-dirProjects -Force -Option AllScope

function Open-dirProjectsCrax { & Set-Location C:\Users\idmrr\Documents\projects\crax\$args}
New-Alias -Name "cdpc" -Value Open-dirProjectsCrax -Force -Option AllScope

# Docker aliases
# ----------------------
function Get-DockerContainerLS { & 'docker' 'container' 'ls' $args}
function Get-DockerPsA { & 'docker' 'ps' '-a' $args }
New-Alias -Name "dps" -Value "Get-DockerContainerLS" -Force -Option AllScope
New-Alias -Name "dpsa" -Value "Get-DockerPsA" -Force -Option AllScope
# Docker-compse
function Get-DockerComposePs { & 'docker-compose' 'ps' $args}
New-Alias -Name "dcps" -Value "Get-DockerComposePs" -Force -Option AllScope


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

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}


# yarn link/unlink bookit
function Open-YarnLinkCraxAngularCore { 
  Write-Host "Checking if Crax-Core is on local device"
  $ScriptDir = Split-Path $script:MyInvocation.MyCommand.Path
  if (Test-Path -Path "..\Crax.Angular.Core\dist\angular-crax-core") {
    cd "..\Crax.Angular.Core\dist\angular-crax-core"
    yarn link 
    cd "$ScriptDir"
    yarn link "@crax/angular-core"
    Write-Host "Successfully linked Core package"
  }
  else {
    Write-Host "CRAX-CORE NOT FOUND!"
    Write-Host "Please clone the Crax.Core.Angular repository onto your device, or if you already have the repository build the library first by navigating into the folder and using 'ng build --watch'"
  }
}
New-Alias -Name "ylccm" -Value Open-YarnLinkCraxAngularCore -Force -Option AllScope

function Open-YarnLinkCraxAngularForm{ 
  Write-Host "Checking if Crax-Angular-Forms is on local device"
  $ScriptDir = Split-Path $script:MyInvocation.MyCommand.Path
  if (Test-Path -Path "..\Crax.Angular.Forms\dist\angular-crax-forms") {
    cd "..\Crax.Angular.Forms\dist\angular-crax-forms"
    yarn link
    cd "$ScriptDir"
    yarn link "@crax/angular-forms"
    Write-Host "Successfully linked Forms package"
  }
  else {
    Write-Host "CRAX-FORMS NOT FOUND!"
    Write-Host "Please clone the Crax.Forms.Angular repository onto your device, or if you already have the repository build the library first by navigating into the folder and using 'ng build --watch'"
  }
}
New-Alias -Name "ylcfm" -Value Open-YarnLinkCraxAngularForm -Force -Option AllScope

function Open-YarnLinkCraxAngularTable{ 
  Write-Host "Checking if Crax-Angular-Table is on local device"
  $ScriptDir = Split-Path $script:MyInvocation.MyCommand.Path
  if (Test-Path -Path "..\Crax.Angular.Table\dist\angular-crax-table") {
    cd "..\Crax.Angular.Table\dist\angular-crax-table"
    yarn link
    cd "$ScriptDir"
    yarn link "@crax/angular-table"
    Write-Host "Successfully linked Table package"
  }
  else {
    Write-Host "CRAX-TABLE NOT FOUND!"
    Write-Host "Please clone the Crax.Table.Angular repository onto your device, or if you already have the repository build the library first by navigating into the folder and using 'ng build --watch'"
  }  
}
New-Alias -Name "ylcct" -Value Open-YarnLinkCraxAngularTable -Force -Option AllScope


function Open-YarnUnLinkCraxAngularCore { 
  Write-Host "Checking if Crax-Core is on local device"
  $ScriptDir = Split-Path $script:MyInvocation.MyCommand.Path
  if (Test-Path -Path "..\Crax.Angular.Core\dist\angular-crax-core") {
      yarn unlink "@crax/angular-core"
      cd "..\Crax.Angular.Core\dist\angular-crax-core"
      yarn unlink 
      cd "$ScriptDir"
      Write-Host "Successfully unlinked Core package"
  }
  else {
      Write-Host "Please clone the repository onto your device, or if you already have the repository build the library first using 'ng build --watch'"
  }
  
}
New-Alias -Name "yulccm" -Value Open-YarnUnLinkCraxAngularCore -Force -Option AllScope

function Open-YarnUnLinkCraxAngularForm{ 
  Write-Host "Checking if Crax-Forms is on local device"
  $ScriptDir = Split-Path $script:MyInvocation.MyCommand.Path
  if (Test-Path -Path "..\Crax.Angular.Forms\dist\angular-crax-forms") {
    yarn unlink "@crax/angular-forms"
    cd "..\Crax.Angular.Forms\dist\angular-crax-forms"
    yarn unlink
    cd "$ScriptDir"
    Write-Host "Successfully unlinked Forms package"
  }
  else {
    Write-Host "Please clone the repository onto your device, or if you already have the repository build the library first using 'ng build --watch'"
  }
  
}
New-Alias -Name "yulcfm" -Value Open-YarnUnLinkCraxAngularForm -Force -Option AllScope

function Open-YarnUnLinkCraxAngularTable{ 
  Write-Host "Checking if Crax-Table is on local device"
  $ScriptDir = Split-Path $script:MyInvocation.MyCommand.Path
  if (Test-Path -Path "..\Crax.Angular.Table\dist\angular-crax-table") {
    yarn unlink "@crax/angular-table"
    cd "..\Crax.Angular.Table\dist\angular-crax-table"
    yarn unlink
    cd "$ScriptDir"
    Write-Host "Successfully unlinked Table package"
  }
  else {
    Write-Host "Please clone the repository onto your device, or if you already have the repository build the library first using 'ng build --watch'"
  }
}
New-Alias -Name "yulcct" -Value Open-YarnUnLinkCraxAngularTable -Force -Option AllScope
