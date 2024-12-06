#!/usr/bin/env pwsh
# Base Variables
$BasePath = $PSScriptRoot
$BaseDotfiles = Join-Path $BasePath "dotfiles"

# Welcome Message
Write-Host -ForegroundColor Green "Welcome to Dotfile Installer v0.2"
Write-Host -ForegroundColor Green "---------------------------------"

# Finding Installer Scripts
Write-Host -ForegroundColor Green "Finding installer scripts"
$ScriptsPaths = Join-Path $BaseDotfiles "**/Install.ps1"
$InstallerScripts = Get-ChildItem -Path $ScriptsPaths
$i = 0
$max = $InstallerScripts.Count
foreach ($InstallerScript in $InstallerScripts) {
    $percent = ($i / $max) * 100
    Write-Host -ForegroundColor Green "Installing... $percent% ($i/$max)"
    Write-Host -ForegroundColor Green "Installer script: $InstallerScript"
    . $InstallerScript
    $i += 1
}

$os = "unknown"
if ([System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Windows)) {
    $os = "windows"
} elseif ([System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Linux)) {
    $os = "linux"
} elseif ([System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::OSX)) {
    $os = "macos"
} elseif ([System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::FreeBSD)) {
    $os = "freebsd"
}
# Finding OS Specific Installer Scripts
Write-Host -ForegroundColor Green "Finding os specific installer scripts"
$ScriptsPaths = Join-Path $BaseDotfiles "**/Install.$os.ps1"
$InstallerScripts = Get-ChildItem -Path $ScriptsPaths
$i = 0
$max = $InstallerScripts.Count
foreach ($InstallerScript in $InstallerScripts) {
    $percent = ($i / $max) * 100
    Write-Host -ForegroundColor Green "Installing... $percent% ($i/$max)"
    Write-Host -ForegroundColor Green "Installer script: $InstallerScript"
    . $InstallerScript
    $i += 1
}
