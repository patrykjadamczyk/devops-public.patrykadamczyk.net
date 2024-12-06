#!/usr/bin/env pwsh
$RealProfileDir = Join-Path $PSScriptRoot "..";
$RealProfile = Join-Path $RealProfileDir "Index.ps1";
if ($_IsWindows) {
    $APPDATA = Join-Path $env:APPDATA "..";
    $LocalAppData = $env:LOCALAPPDATA;
    $RoamingAppData = $env:APPDATA;
    $LocalLowAppData = Join-Path $APPDATA "LocalLow";
    $NVIMConfigFile = Join-Path $LocalAppData "nvim" "init.vim";
    $AlacrittyConfig = Join-Path $RoamingAppData "alacritty" "alacritty.yml";
} elseif ($env:XDG_CONFIG_HOME) {
    $NVIMConfigFile = Join-Path $env:XDG_CONFIG_HOME "nvim" "init.vim";
    $AlacrittyConfig = Join-Path $env:XDG_CONFIG_HOME "alacritty" "alacritty.yml";
} else {
    $NVIMConfigFile = Join-Path $env:HOME ".config" "nvim" "init.vim";
    $AlacrittyConfig = Join-Path $env:HOME ".config" "alacritty" "alacritty.yml";
}
