#!/usr/bin/env nu
# Base Variables
let $BasePath = ($env.FILE_PWD | path expand)
let $BaseDotfiles = ($BasePath | path join "dotfiles")
let $BaseNix = ($BasePath | path join "nix")
let $PWSHDotfiles = ($BaseDotfiles | path join "pwsh")
# Welcome Message
print $"(ansi green)Welcome to Installer of all dotfiles v0.2 Nushell(ansi reset)"
print $"(ansi green)-----------------------------------------(ansi reset)"
# OS
const _IsWindows = $nu.os-info.name == "windows" and $nu.os-info.family == "windows"
const _IsLinux = $nu.os-info.name == "linux" and $nu.os-info.family == "unix"
const _IsMacOS = $nu.os-info.name == "macos" and $nu.os-info.family == "unix"
# Notes
if ($_IsWindows) {
    print $"(ansi blue)Note: If you want to install dotfiles on WSL. Run this script under WSL.(ansi reset)"
}
# Config
print $"(ansi cyan)Installing dotfiles configuration...(ansi reset)"
^nu ($BasePath | path join "Dotfiles-Expander.nu")
# Nix
# if ($_IsWindows) {
#     $BaseWindowsNix = Join-Path $BaseNix "windows"
#     $WindowsNixInstaller = Join-Path $BaseWindowsNix "Index.ps1"
#     if (Test-Path $WindowsNixInstaller) {
#         Write-Host -ForegroundColor Cyan "Installing Nix Packages on Windows..."
#         . $WindowsNixInstaller
#     } else {
#         Write-Host -ForegroundColor Red "Nix packages installer for Windows not found"
#         Write-Host -ForegroundColor Red "Skipping..."
#     }
# } elseif ($_IsLinux) {
#     Write-Host -ForegroundColor Cyan "Installing Nix Packages..."
#     if (!(Test-Command "sudo")) {
#         Write-Host -ForegroundColor Red "Sudo not found. Please install it first..."
#         return 1;
#     }
#     if (!(Test-Command "nix")) {
#         Write-Host -ForegroundColor Red "Nix not found. Installing it first..."
#         if (!(Test-Command "curl")) {
#             Write-Host -ForegroundColor Red "Curl not found. Please install it first..."
#             return 1;
#         }
#         $IsDeamon = "";
#         $IsDeamonPrefix = "";
#         while ($true) {
#             $IsDeamon = Read-Host "Do you want to install Nix in multi-user mode or single-user mode? [mu/su]"
#             if ($IsDeamon -eq "mu") {
#                 Write-Host -ForegroundColor Cyan "Installing Nix in multi-user mode..."
#                 $IsDeamon = " --deamon"
#                 $IsDeamonPrefix = "sudo "
#                 break
#             } elseif ($IsDeamon -eq "su") {
#                 Write-Host -ForegroundColor Cyan "Installing Nix in single-user mode..."
#                 $IsDeamon = " --no-deamon"
#                 break
#             }
#             Write-Host -ForegroundColor Red "Wrong input try again..."
#         }
#         sh -c "$IsDeamonPrefix`sh <(curl -L https://nixos.org/nix/install) $IsDeamon"
#         Write-Host -ForegroundColor Cyan "Reloading PWSH Dotfiles to load nix..."
#         $PWSHInit = Join-Path $PWSHDotfiles "Profile.ps1"
#         . $PWSHInit
#         Write-Host -ForegroundColor Cyan "Trying again to install Nix Packages..."
#     }

#     if (!(Test-Command "nix")) {
#         Write-Host -ForegroundColor Red "Nix not found. Try installing it manually or debugging install script."
#         return 1;
#     }

#     if (!(Test-Path "/etc/nix/nix.conf")) {
#         Write-Host -ForegroundColor Cyan "Installing Nix Configuration..."
#         sudo cp (Join-Path $BaseNix "etc_nix_nix.conf") "/etc/nix/nix.conf"
#     }

#     Write-Host -ForegroundColor Cyan "Installing Nix Packages using Home Manager..."
#     if (Test-Command "home-manager") {
#         # GC of nix
#         nix-collect-garbage
#         # Force home-manager to work properly (first errors out about news files for some reason)
#         home-manager switch
#         home-manager switch
#     } else {
#         # GC of nix
#         nix-collect-garbage
#         # Force home-manager to work properly (first errors out about news files for some reason)
#         nix-shell -p home-manager --run "home-manager switch"
#         nix-shell -p home-manager --run "home-manager switch"
#     }
# } elseif ($_IsMacOS) {
#     Write-Host -ForegroundColor Cyan "Installing Nix Packages..."
#     if (!(Test-Command "sudo")) {
#         Write-Host -ForegroundColor Red "Sudo not found. Please install it first..."
#         return 1;
#     }
#     if (!(Test-Command "nix")) {
#         Write-Host -ForegroundColor Red "Nix not found. Installing it first..."
#         if (!(Test-Command "curl")) {
#             Write-Host -ForegroundColor Red "Curl not found. Please install it first..."
#             return 1;
#         }
#         sh -c "sh <(curl -L https://nixos.org/nix/install)"
#         Write-Host -ForegroundColor Cyan "Reloading PWSH Dotfiles to load nix..."
#         $PWSHInit = Join-Path $PWSHDotfiles "Profile.ps1"
#         . $PWSHInit
#         Write-Host -ForegroundColor Cyan "Trying again to install Nix Packages..."
#     }

#     if (!(Test-Command "nix")) {
#         Write-Host -ForegroundColor Red "Nix not found. Try installing it manually or debugging install script."
#         return 1;
#     }

#     if (!(Test-Path "/etc/nix/nix.conf")) {
#         Write-Host -ForegroundColor Cyan "Installing Nix Configuration..."
#         sudo cp (Join-Path $BaseNix "etc_nix_nix.conf") "/etc/nix/nix.conf"
#     }

#     Write-Host -ForegroundColor Cyan "Installing Nix Packages using Home Manager..."
#     if (Test-Command "home-manager") {
#         # GC of nix
#         nix-collect-garbage
#         # Force home-manager to work properly (first errors out about news files for some reason)
#         home-manager switch
#         home-manager switch
#     } else {
#         # GC of nix
#         nix-collect-garbage
#         # Force home-manager to work properly (first errors out about news files for some reason)
#         nix-shell -p home-manager --run "home-manager switch"
#         nix-shell -p home-manager --run "home-manager switch"
#     }
# }

print $"(ansi cyan)Installing dotfiles installer scripts...(ansi reset)"
^nu ($BasePath | path join "Dotfiles-Installer.nu")
