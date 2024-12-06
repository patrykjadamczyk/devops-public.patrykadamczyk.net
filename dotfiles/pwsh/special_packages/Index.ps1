#!/usr/bin/env pwsh
# OS Variables
$_IsWindows = [System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Windows);
$_IsLinux = [System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Linux);
$_IsMacOS = [System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::OSX);
# Load os specific packages
if ($_IsWindows) {
    try {
        foreach ($file in (Get-ChildItem $PSScriptRoot/windows_packages/**/Index.ps1 -ErrorAction Stop)) {
            . $file.FullName
        }
    } catch {
        if ($Config_Debug) {
            Write-Host "Error while loading Windows Packages: $($error[0].exception.message)"
        }
    }
} elseif ($_IsLinux) {
    try
    {
        foreach ($file in (Get-ChildItem $PSScriptRoot/linux_packages/**/Index.ps1 -ErrorAction Stop))
        {
            . $file.FullName
        }
    } catch {
        if ($Config_Debug) {
            Write-Host "Error while loading Linux Packages: $($error[0].exception.message)"
        }
    }
} elseif ($_IsMacOS) {
    try
    {
        foreach ($file in (Get-ChildItem $PSScriptRoot/macos_packages/**/Index.ps1 -ErrorAction Stop))
        {
            . $file.FullName
        }
    } catch {
        if ($Config_Debug) {
            Write-Host "Error while loading Mac OS X Packages: $($error[0].exception.message)"
        }
    }
}
# Load server packages
if ($Config_IsServer)
{
    try
    {
        foreach ($file in (Get-ChildItem $PSScriptRoot/server_packages/**/Index.ps1 -ErrorAction Stop))
        {
            . $file.FullName
        }
    } catch {
        if ($Config_Debug) {
            Write-Host "Error while loading Server Packages: $($error[0].exception.message)"
        }
    }
}
# Load OVH Specific Packages
if ($Config_IsOVHServer)
{
    try
    {
        foreach ($file in (Get-ChildItem $PSScriptRoot/ovh_server_packages/**/Index.ps1 -ErrorAction Stop))
        {
            . $file.FullName
        }
    } catch {
        if ($Config_Debug) {
            Write-Host "Error while loading OVH Server Packages: $($error[0].exception.message)"
        }
    }
}