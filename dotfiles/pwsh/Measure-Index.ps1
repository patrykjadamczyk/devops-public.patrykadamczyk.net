#!/usr/bin/env pwsh
# Variables
$global:_IsWindows = [System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Windows);
$global:_IsLinux = [System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Linux);
$global:_IsMacOS = [System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::OSX);
$global:_IsNoLogo = [Environment]::GetCommandLineArgs().Contains("-NoLogo")

$_IsNoLogo ? $null : ( Write-Host -ForegroundColor Green "Loading PowerShell Profile File..." )

$_IsNoLogo ? $null : ( Write-Progress -Id 1 -Activity "Loading PowerShell Profile File" -Status "1. Setting Variables" -PercentComplete ((1/4)*100) -CurrentOperation "Loading ..." )
foreach ($file in (Get-ChildItem $PSScriptRoot/variables/*.ps1 -Exclude *.ignore.ps1)) {
    Measure-Script $file.FullName
}
$_IsNoLogo ? $null : ( Write-Progress -Id 1 -Activity "Loading PowerShell Profile File" -Status "2. Loading all scripts" -PercentComplete ((2/4)*100) -CurrentOperation "Loading ..." )
foreach ($file in (Get-ChildItem $PSScriptRoot/packages/**/Index.ps1)) {
    Measure-Script $file.FullName
}
$_IsNoLogo ? $null : ( Write-Progress -Id 1 -Activity "Loading PowerShell Profile File" -Status "3. Loading all special scripts" -PercentComplete ((3/4)*100) -CurrentOperation "Loading ..." )
Measure-Script (Join-Path $PSScriptRoot "special_packages" "Index.ps1")

$_IsNoLogo ? $null : ( Write-Progress -Id 1 -Activity "Loading PowerShell Profile File" -Completed )

$_IsNoLogo ? $null : ( Write-Host -ForegroundColor Green "PowerShell Profile File Loaded!" )
