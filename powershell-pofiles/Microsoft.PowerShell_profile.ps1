

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
function Open-dirProjectEasypostEasyPrint { & Set-Location $HOME\projects\easypost\easyprint$args }
New-Alias -Name "cdee" -Value Open-dirProjectEasypostEasyPrint -Force -Option AllScope

function Open-dirProjectsCrax { & Set-Location $HOME\projects\crax\$args }
New-Alias -Name "cdpc" -Value Open-dirProjectsCrax -Force -Option AllScope

function Open-dirBookit { & Set-Location $HOME\projects\crax\BookitWeb\$args }
New-Alias -Name "cdb" -Value Open-dirBookit -Force -Option AllScope
function Open-dirBookitWeb { & Set-Location $HOME\projects\crax\BookitWeb\$args }
New-Alias -Name "cdbw" -Value Open-dirBookitWeb -Force -Option AllScope
function Open-dirBookitApi { & Set-Location $HOME\projects\crax\BookitApi\$args }
New-Alias -Name "cdba" -Value Open-dirBookitApi -Force -Option AllScope

function Open-dirCraxAgularCore { & Set-Location $HOME\projects\crax\Angular.Core.Crax$args }
New-Alias -Name "cdccm" -Value Open-dirCraxAgularCore  -Force -Option AllScope

function Open-dirCraxAgularForm { & Set-Location $HOME\projects\crax\Angular.Forms.Crax$args }
New-Alias -Name "cdcfm" -Value Open-dirCraxAgularForm  -Force -Option AllScope

function Open-dirCraxAgularTable { & Set-Location $HOME\projects\Crax\Angular.Table.Crax$args }
New-Alias -Name "cdctm" -Value Open-dirCraxAgularTable  -Force -Option AllScop
function Open-dirCraxIdentityServer { & Set-Location $HOME\projects\Crax\IdentityCMS.Crax$args }
New-Alias -Name "cdsso" -Value Open-dirCraxIdentityServer  -Force -Option AllScop

# Docker aliases
# ----------------------
function Get-DockerContainerLS { & 'docker' 'container' 'ls' $args }
New-Alias -Name "dpsa" -Value "Get-DockerPsA" -Force -Option AllScope
function Get-DockerExec { & 'docker' 'exec' '-it' $args '/bin/bash' }
New-Alias -Name "dbash" -Value "Get-DockerExec" -Force -Option AllScope
# Docker-compse
function Get-DockerComposePs { & 'docker-compose' 'ps' $args }
New-Alias -Name "dcps" -Value "Get-DockerComposePs" -Force -Option AllScope

function Get-DockerCompose { & 'docker-compose' $args }
New-Alias -Name "dc" -Value "Get-DockerCompose" -Force -Option AllScope

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


# yarn link/unlink bookit
function Open-YarnLinkCraxAngularCore { 
  Write-Host "Checking if Crax-Core is on local device"
  $Currentlocation = Get-Location
  if (Test-Path -Path "..\Angular.Core.Crax\dist\angular-crax-core") {
    Set-Location "..\Angular.Core.Crax\dist\angular-crax-core"
    yarn link 
    Set-Location "$Currentlocation"
    yarn link "@crax/angular-core"
    Write-Host "Successfully linked Core package"
  }
  else {
    Write-Host "CRAX-CORE NOT FOUND!"
    Write-Host "Please clone the Crax.Core.Angular repository onto your device, or if you already have the repository build the library first by navigating into the folder and using 'ng build --watch'"
  }
}
New-Alias -Name "ylccm" -Value Open-YarnLinkCraxAngularCore -Force -Option AllScope

function Open-YarnLinkCraxAngularForm { 
  Write-Host "Checking if Crax-Angular-Forms is on local device"
  $Currentlocation = Get-Location
  if (Test-Path -Path "..\Angular.Forms.Crax\dist\angular-crax-forms") {
    Set-Location "..\Angular.Forms.Crax\dist\angular-crax-forms"
    yarn link
    Set-Location "$Currentlocation"
    yarn link "@crax/angular-forms"
    Write-Host "Successfully linked Forms package"
  }
  else {
    Write-Host "CRAX-FORMS NOT FOUND!"
    Write-Host "Please clone the Crax.Forms.Angular repository onto your device, or if you already have the repository build the library first by navigating into the folder and using 'ng build --watch'"
  }
}
New-Alias -Name "ylcfm" -Value Open-YarnLinkCraxAngularForm -Force -Option AllScope

function Open-YarnLinkCraxAngularTable { 
  Write-Host "Checking if Crax-Angular-Table is on local device"
  $Currentlocation = Get-Location
  if (Test-Path -Path "..\Angular.Table.Crax\dist\angular-crax-table") {
    Set-Location "..\Angular.Table.Crax\dist\angular-crax-table"
    yarn link
    Set-Location "$Currentlocation"
    yarn link "@crax/angular-table"
    Write-Host "Successfully linked Table package"
  }
  else {
    Write-Host "CRAX-TABLE NOT FOUND!"
    Write-Host "Please clone the Crax.Table.Angular repository onto your device, or if you already have the repository build the library first by navigating into the folder and using 'ng build --watch'"
  }  
}
New-Alias -Name "ylctm" -Value Open-YarnLinkCraxAngularTable -Force -Option AllScope


function Open-YarnUnLinkCraxAngularCore { 
  Write-Host "Checking if Crax-Core is on local device"
  $Currentlocation = Get-Location
  if (Test-Path -Path "..\Angular.Core.Crax\dist\angular-crax-core") {
    yarn unlink "@crax/angular-core"
    Set-Location "..\Angular.Core.Crax\dist\angular-crax-core"
    yarn unlink 
    Set-Location "$Currentlocation"
    Write-Host "Successfully unlinked Core package"
  }
  else {
    Write-Host "Please clone the repository onto your device, or if you already have the repository build the library first using 'ng build --watch'"
  }
  
}
New-Alias -Name "yulccm" -Value Open-YarnUnLinkCraxAngularCore -Force -Option AllScope

function Open-YarnUnLinkCraxAngularForm { 
  Write-Host "Checking if Crax-Forms is on local device"
  $Currentlocation = Get-Location
  if (Test-Path -Path "..\Angular.Forms.Crax\dist\angular-crax-forms") {
    yarn unlink "@crax/angular-forms"
    Set-Location "..\Angular.Forms.Crax\dist\angular-crax-forms"
    yarn unlink
    Set-Location "$Currentlocation"
    Write-Host "Successfully unlinked Forms package"
  }
  else {
    Write-Host "Please clone the repository onto your device, or if you already have the repository build the library first using 'ng build --watch'"
  }
  
}
New-Alias -Name "yulcfm" -Value Open-YarnUnLinkCraxAngularForm -Force -Option AllScope

function Open-YarnUnLinkCraxAngularTable { 
  Write-Host "Checking if Crax-Table is on local device"
  $Currentlocation = Get-Location
  if (Test-Path -Path "..\Angular.Table.Crax\dist\angular-crax-table") {
    yarn unlink "@crax/angular-table"
    Set-Location "..\Angular.Table.Crax\dist\angular-crax-table"
    yarn unlink
    Set-Location "$Currentlocation"
    Write-Host "Successfully unlinked Table package"
  }
  else {
    Write-Host "Please clone the repository onto your device, or if you already have the repository build the library first using 'ng build --watch'"
  }
}
New-Alias -Name "yulctm" -Value Open-YarnUnLinkCraxAngularTable -Force -Option AllScope
