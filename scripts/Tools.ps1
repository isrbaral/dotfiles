# ---------------------------------------------- #
# Browsers  ------------------------------------ #
# ---------------------------------------------- #
choco install -y googlechrome
choco install -y firefox

# ---------------------------------------------- #
# Common tools  --------------------------------- #
# ---------------------------------------------- #
choco install -y 7zip
choco install -y paint.net
choco install -y screentogif
choco install -y zoomit
choco install -y wiztree
choco install -y ditto
choco install -y greenshot
choco install -y sysinternals
choco install -y autohotkey


# winget install -e -h --id Microsoft.BingWallpaper
# winget install -e -h --id Obsidian.Obsidian
# winget install -e -h --id JohnMacFarlane.Pandoc
# winget install -e -h --id Microsoft.Whiteboard -s msstore
winget install -e -h --id Microsoft.PowerToys # settings to sync
# Already  installed by default
# winget install -e -h --id Microsoft.Teams
# winget install -e -h --id Microsoft.Office
# winget install -e -h --id Logitech.Options
# winget install -e -h --id Dell.DisplayManager

# ---------------------------------------------- #
# Dev tools  ----------------------------------- #
# ---------------------------------------------- #
# winget install -e -h --id AndreasWascher.RepoZ
# winget install -e -h --id CoreyButler.NVMforWindows
# iwr https://get.pnpm.io/install.ps1 -useb | iex
# iwr -useb get.scoop.sh | iex
choco install -y python
choco install -y githubforwindows
choco install -y notepadplusplus
choco install -y putty
choco install -y mremoteng


# ---------------------------------------------- #
# PowerShell  ---------------------------------- #
# ---------------------------------------------- #
winget install -e -h --id Microsoft.PowerShell
# Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
$currentPath = "$env:OneDrive\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
if(Test-Path $currentPath) {Remove-Item -Path $currentPath -Force}
$currentPath = $null
New-Item -ItemType SymbolicLink -Path "$env:OneDrive\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" -Target "$env:USERPROFILE\dotfiles\config\powerShell\Microsoft.PowerShell_profile.ps1"
# Trust PSGallery
Get-PackageProvider -Name NuGet -ForceBootstrap
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
RefreshEnv

# ---------------------------------------------- #
# Prompt  -------------------------------------- #
# ---------------------------------------------- #
pwsh -Command { Install-Module posh-git -Scope CurrentUser -Force}
winget install -e -h --id JanDeDobbeleer.OhMyPosh
RefreshEnv

# ---------------------------------------------- #
# NuShell  ---------------------------------- #
# ---------------------------------------------- #
winget install -e -h --id Nushell.Nushell
# saves an initialization script to ~/.oh-my-posh.nu that will be used in Nushell config file
oh-my-posh init nu --config "$env:USERPROFILE\dotfiles\config\prompt\.oh-my-posh.omp.json"
# Remove-Item -Path "$env:USERPROFILE\AppData\Roaming\nushell\config.nu" -Force
# New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\AppData\Roaming\nushell\config.nu" -Target "$env:USERPROFILE\dotfiles\config\nu\config.nu"
# config auto complete dotnet / nuke / ...

# ---------------------------------------------- #
# Windows Terminal ----------------------------- #
# ---------------------------------------------- #
# Windows Terminal (stable + preview) install with Cascadia Code PL font
winget install -e -h --id Microsoft.WindowsTerminal -s msstore
# winget install -e -h --id Microsoft.WindowsTerminalPreview -s msstore
choco install -y cascadiacodepl
# Windows terminal configuration
$currentPath = "$env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
if(Test-Path $currentPath) {Remove-Item -Path $currentPath -Force}
$currentPath = $null
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -Target "$env:USERPROFILE\dotfiles\config\windowsTerminal\settings.json"
cp "$env:USERPROFILE\dotfiles\config\windowsTerminal\icons\*" "$env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\RoamingState\"
# Windows terminal preview configuration
# $currentPath = "$env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState\settings.json"
# if(Test-Path $currentPath) {Remove-Item -Path $currentPath -Force}
# $currentPath = $null
# New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState\settings.json" -Target "$env:USERPROFILE\dotfiles\config\windowsTerminal\settings.json"
# cp "$env:USERPROFILE\dotfiles\config\windowsTerminal\icons\*" "$env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\RoamingState\"




# ---------------------------------------------- #
# Azure tools  --------------------------------- #
# ---------------------------------------------- #
# winget install -e -h --id Microsoft.AzureCLI
# winget install -e -h --id Microsoft.AzureCosmosEmulator
# winget install -e -h --id Microsoft.AzureDataStudio
# winget install -e -h --id Microsoft.azure-iot-explorer
# winget install -e -h --id Microsoft.AzureStorageExplorer
# winget install -e -h --id Pulumi.Pulumi
# winget install -e -h --id Microsoft.AzureFunctionsCoreTools
# Azurite can be installed through vscode extension or as a global npm package
# pnpm add -g azurite



# ---------------------------------------------- #
# Blog tools  ---------------------------------- #
# ---------------------------------------------- #
# wyam
# netlify
# statiq
