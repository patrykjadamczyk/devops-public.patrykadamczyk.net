#!/usr/bin/env pwsh
$Global:RealProfileDir = Join-Path $PSScriptRoot "..";
$Global:RealProfile = Join-Path $RealProfileDir "Index.ps1";
if ($_IsWindows) {
    $Global:APPDATA = Join-Path $env:APPDATA "..";
    $Global:LocalAppData = $env:LOCALAPPDATA;
    $Global:RoamingAppData = $env:APPDATA;
    $Global:LocalLowAppData = Join-Path $APPDATA "LocalLow";
}

$Global:HostsFile = Join-Path "/" "etc" "hosts";
if ($_IsWindows) {
    $Global:HostsFile = Join-Path $env:WINDIR "System32" "drivers" "etc" "hosts";
}
$PSDefaultParameterValues = @{
 "ConvertFrom-Text:NoProgress"=$true
}

if (Test-Path "Env:/ZELLIJ") {
    if (Test-Path "Env:/LD_LIBRARY_PATH") {
        $env:LD_LIBRARY_PATH = ""
    }
}

try {
    $ZEIT_DB = Join-Path "~" "go" "src" "devops.patrykadamczyk.net" "dotfiles" "zeit" "zeit.db"
    $ZEIT_DB = Resolve-Path $ZEIT_DB -ErrorAction Stop
    $env:ZEIT_DB="$ZEIT_DB"
} catch {}
