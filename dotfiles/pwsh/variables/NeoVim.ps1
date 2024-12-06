#!/usr/bin/env pwsh
if ($_IsWindows) {
    $Global:NVIMConfigFile = Join-Path $LocalAppData "nvim" "init.lua";
} elseif ($env:XDG_CONFIG_HOME) {
    $Global:NVIMConfigFile = Join-Path $env:XDG_CONFIG_HOME "nvim" "init.lua";
} else {
    $Global:NVIMConfigFile = Join-Path $env:HOME ".config" "nvim" "init.lua";
}
