#!/usr/bin/env pwsh
if ($_IsWindows) {
    $Global:AlacrittyConfig = Join-Path $RoamingAppData "alacritty" "alacritty.yml";
} elseif ($env:XDG_CONFIG_HOME) {
    $Global:AlacrittyConfig = Join-Path $env:XDG_CONFIG_HOME "alacritty" "alacritty.yml";
} else {
    $Global:AlacrittyConfig = Join-Path $env:HOME ".config" "alacritty" "alacritty.yml";
}
