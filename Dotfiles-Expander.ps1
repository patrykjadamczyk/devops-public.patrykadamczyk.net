#!/usr/bin/env pwsh
# Base Variables
$BasePath = $PSScriptRoot
$ConfigName = "expand.config.json"
$ConfigFile = Join-Path $BasePath $ConfigName
$BaseDotfiles = Join-Path $BasePath "dotfiles"

# Utility functions
function EnsurePath($path) {
    $dirPath = Split-Path -Parent $path
    if (!(Test-Path -path $dirPath)) {
        Write-Host -ForegroundColor Yellow "Creating directory: $dirPath"
        New-Item $dirPath -Type Directory
    }
}
function EnsureOs($oses) {
    if (!$oses) {
        return $true
    }
    $nOSes = $oses -is [string] ? @($oses) : $oses;
    $result = $false
    foreach($os in $nOSes) {
        switch ($os.ToString().ToLower()) {
            "windows" {
                $result = $result -or [System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Windows);
            }
            "linux" {
                $result = $result -or [System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Linux);
            }
            "macos" {
                $result = $result -or [System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::OSX);
            }
            "freebsd" {
                $result = $result -or [System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::FreeBSD);
            }
            Default {
                Write-Host -ForegroundColor Red "Unknown OS: $os"
            }
        }
    }
    return $result
}
function TemplatePath($path) {
    $PowerShellConfigDir = Join-Path "~" ".config" "powershell";
    $ConfigDir = Join-Path "~" ".config";
    $RootConfigDir = Join-Path "~" ".config";
    $LocalConfigDir = Join-Path "~" ".config";
    $LocalLowConfigDir = Join-Path "~" ".config";
    $RoamingConfigDir = Join-Path "~" ".config";
    $AppSupportConfigDir = Join-Path "~" ".config";
    $XdgAppSupportConfigDir = Join-Path "~" ".config";
    if ([System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Windows)) {
        $PowerShellConfigDir = Join-Path "~" "Documents" "PowerShell";
        $RootConfigDir = Join-Path $env:APPDATA "..";
        $LocalConfigDir = $env:LOCALAPPDATA;
        $LocalLowConfigDir = Join-Path $env:APPDATA "LocalLow";
        $RoamingConfigDir = $env:APPDATA;
        $AppSupportConfigDir = $env:APPDATA;
        $XdgAppSupportConfigDir = $env:APPDATA;
    } elseif ($env:XDG_CONFIG_HOME) {
        $PowerShellConfigDir = Join-Path $env:XDG_CONFIG_HOME "powershell";
        $ConfigDir = $env:XDG_CONFIG_HOME;
        $RootConfigDir = $env:XDG_CONFIG_HOME;
        $LocalConfigDir = $env:XDG_CONFIG_HOME;
        $LocalLowConfigDir = $env:XDG_CONFIG_HOME;
        $RoamingConfigDir = $env:XDG_CONFIG_HOME;
        $XdgAppSupportConfigDir = $env:XDG_CONFIG_HOME;
    }
    if ([System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::OSX)) {
        $AppSupportConfigDir = Join-Path "~" "Library" "Application Support";
        $XdgAppSupportConfigDir = Join-Path "~" "Library" "Application Support";
    }
    $XDG_DATA_HOME = $env:XDG_DATA_HOME ?? $env:APPDATA;
    $XDG_CONFIG_HOME = $env:XDG_CONFIG_HOME ?? $env:LOCALAPPDATA ?? $LocalConfigDir;
    $XDG_CACHE_HOME = $env:XDG_CACHE_HOME ?? $env:TEMP;
    $XDG_STATE_HOME = $env:XDG_STATE_HOME ?? $env:LOCALAPPDATA ?? $LocalConfigDir;

    $path = $path.ToString();
    $path = $path.Replace("%PowerShellConfigDir%", $PowerShellConfigDir);
    $path = $path.Replace("%ConfigDir%", $ConfigDir);
    $path = $path.Replace("%RootConfigDir%", $RootConfigDir);
    $path = $path.Replace("%LocalConfigDir%", $LocalConfigDir);
    $path = $path.Replace("%LocalLowConfigDir%", $LocalLowConfigDir);
    $path = $path.Replace("%RoamingConfigDir%", $RoamingConfigDir);
    $path = $path.Replace("%XDG_DATA_HOME%", $XDG_DATA_HOME);
    $path = $path.Replace("%XDG_CONFIG_HOME%", $XDG_CONFIG_HOME);
    $path = $path.Replace("%XDG_CACHE_HOME%", $XDG_CACHE_HOME);
    $path = $path.Replace("%XDG_STATE_HOME%", $XDG_STATE_HOME);
    $path = $path.Replace("%AppSupportConfigDir%", $AppSupportConfigDir);
    $path = $path.Replace("%XdgAppSupportConfigDir%", $XdgAppSupportConfigDir);

    # Replace all %env:<X>%
    foreach($key in $env.Keys) {
        $path = $path.Replace("%env:$key%", $env[$key]);
    }

    return $path
}

# Welcome Message
Write-Host -ForegroundColor Green "Welcome to Dotfile Expander v0.2"
Write-Host -ForegroundColor Green "--------------------------------"

# Config Read
Write-Host -ForegroundColor Green "Reading config file: $ConfigFile"
$ConfigObject = Get-Content $ConfigFile | ConvertFrom-Json
$ExpanderSections = $ConfigObject.sections

foreach($ExpanderSection in $ExpanderSections)
{
    Write-Host -ForegroundColor Green "Starting expanding: $($ExpanderSection.title)"
    if (!(EnsureOs $ExpanderSection.os)) {
        Write-Host -ForegroundColor Blue "Skipping section: $($ExpanderSection.title) because it's not for this operating system"
        Write-Host -ForegroundColor Blue "OS needed for this section: $($ExpanderSection.os)"
        continue
    }

    foreach($ExpanderItem in $ExpanderSection.items)
    {
        $ExpanderItemType = $ExpanderItem.type
        $ExpanderItemLocation = $ExpanderItem.location
        $ExpanderItemLocation = TemplatePath($ExpanderItemLocation)
        $ExpanderItemFrom = Join-Path $BaseDotfiles ($ExpanderItem.file ?? $ExpanderItem.directory)
        if (!(EnsureOs $ExpanderItem.os)) {
            Write-Host -ForegroundColor Blue "Skipping item: $ExpanderItemFrom -> $ExpanderItemLocation because it's not for this operating system"
            Write-Host -ForegroundColor Blue "OS needed for this section: $($ExpanderItem.os)"
            continue
        }
        if (Test-Path $ExpanderItemLocation) {
            Write-Host -ForegroundColor DarkBlue "Skipping item: $ExpanderItemFrom -> $ExpanderItemLocation because it already exists"
            continue
        }
        switch ($ExpanderItemType) {
            "file" {
                Write-Host -ForegroundColor Yellow "Expanding file: $ExpanderItemFrom to $ExpanderItemLocation"
                EnsurePath $ExpanderItemLocation
                Get-ChildItem (Split-Path -Parent $expanderItemLocation)
                Copy-Item -Force -Path $ExpanderItemFrom -Destination $ExpanderItemLocation
            }
            "symlink" {
                Write-Host -ForegroundColor Yellow "Expanding symlink: $ExpanderItemFrom to $ExpanderItemLocation"
                EnsurePath $ExpanderItemLocation
                New-Item -Path $ExpanderItemLocation -ItemType SymbolicLink -Value $ExpanderItemFrom
            }
            "directory" {
                Write-Host -ForegroundColor Yellow "Expanding directory: $ExpanderItemFrom to $ExpanderItemLocation"
                EnsurePath $ExpanderItemLocation
                Copy-Item -Force -Recurse -Path $ExpanderItemFrom -Destination $ExpanderItemLocation
            }
            "directory-symlink" {
                Write-Host -ForegroundColor Yellow "Expanding directory-symlink: $ExpanderItemFrom to $ExpanderItemLocation"
                EnsurePath $ExpanderItemLocation
                New-Item -Path $ExpanderItemLocation -ItemType SymbolicLink -Value $ExpanderItemFrom
            }
            Default {
                Write-Host -ForegroundColor Red "Unknown item type: $ExpanderItemType"
            }
        }
    }
}
