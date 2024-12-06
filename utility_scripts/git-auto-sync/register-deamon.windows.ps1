#!/usr/bin/env pwsh
# Variables
# Path to Script
$deamonScriptPath = Join-Path $PSScriptRoot "deamon.ps1"
$deamonScriptPath = '"'+$deamonScriptPath+'"'
# Path to PowerShell Core
$pwshPath = (where.exe pwsh)
# Parameters of Service
$params = @{
    Name = "GitAutoSyncPwshService"
    DisplayName = "Git Automatic Synchronisation Service using PowerShell Script"
    Description = "This is a service that runs a PowerShell script that automatically synchronizes configured Git repositories."
}
# Verbose stuff
Write-Host "Ensure that you are administrator. Not administrator can't add new services."
Write-Host "Ensure that all parameters are corrent:"
# Write-Host $params
Write-Host ($params | Format-Table | Out-String)
Read-Host -Prompt "Is everything correct? (whatever=yes, Ctrl+C=no)"
# Find nssm
$nssmPath = Join-Path $PSScriptRoot "../additional-binaries/nssm-2.24/win64/nssm.exe"
$nssmPath = Resolve-Path $nssmPath
# Make Base Service
&"$nssmPath" install $params.Name $pwshPath -NoProfile -File $deamonScriptPath
&"$nssmPath" set $params.Name AppDirectory $PSScriptRoot
&"$nssmPath" set $params.Name DisplayName $params.DisplayName
&"$nssmPath" set $params.Name Description $params.Description
&"$nssmPath" set $params.Name Start SERVICE_AUTO_START
&"$nssmPath" start $params.Name

