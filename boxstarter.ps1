## This command disables User Account Control to run the script without user interaction, it is enabled at the end of the script.
## To avoid security concerns you can comment it if you prefer, otherwhise please check the software you install is safe and use this command at your own risk.
Disable-UAC
$Boxstarter.AutoLogin=$false
# Install git and clone repository containing scripts and config files
# TODO: see how to improve install that by using chezmoi (choco install -y chezmoi)
choco install -y git --params "/GitOnlyOnPath /WindowsTerminal"
RefreshEnv
if(Test-Path $env:USERPROFILE\dotfiles) {
    Remove-Item $env:USERPROFILE\dotfiles -Recurse -Force
    if(Test-Path $env:USERPROFILE\dotfiles) {
        Remove-Item $env:USERPROFILE\dotfiles -Recurse -Force
    }
}
Start-Sleep 5
git clone https://github.com/isrbaral/dotfiles.git "$env:USERPROFILE\dotfiles"
# Git configuration
$currentPath = "$env:USERPROFILE\.gitconfig"
if(Test-Path $currentPath) {Remove-Item -Path $currentPath -Force}
$currentPath = $null
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.gitconfig" -Target "$env:USERPROFILE\dotfiles\config\git\.gitconfig"
# TODO: configure git signature

# Winget configuration
$currentPath = "$env:USERPROFILE\AppData\Local\Packages\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe\LocalState\settings.json"
if(Test-Path $currentPath) {Remove-Item -Path $currentPath -Force}
$currentPath = $null
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\AppData\Local\Packages\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe\LocalState\settings.json" -Target "$env:USERPROFILE\dotfiles\config\winget\settings.json"

#--- Enable developer mode on the system ---
Set-ItemProperty -Path HKLM:\Software\Microsoft\Windows\CurrentVersion\AppModelUnlock -Name AllowDevelopmentWithoutDevLicense -Value 1

#--- Setting up Windows ---
. "$env:USERPROFILE\dotfiles\scripts\FileExplorerSettings.ps1"
. "$env:USERPROFILE\dotfiles\scripts\RemoveDefaultApps.ps1"
. "$env:USERPROFILE\dotfiles\scripts\Tools.ps1"
. "$env:USERPROFILE\dotfiles\scripts\IDEs.ps1"

# TODO: install WSL2 / Ubuntu
# choco install -y Microsoft-Windows-Subsystem-Linux -source windowsfeatures
# choco install -y VirtualMachinePlatform -source windowsfeatures
# wsl --set-default-version 2
# choco install wsl2 --params "/Version:2 /Retry:true"

# TODO: Docker
# winget install -e -h --id suse.RancherDesktop

# // windowsfeatures (Windows Sandbox, .NET Framework)
# // Taskbar (Set-BoxstarterTaskbarOptions)

#--- reenabling critial items ---
Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate
