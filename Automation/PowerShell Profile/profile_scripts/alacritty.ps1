#!/usr/bin/env pwsh

# Main Alacritty
function main_alacritty {
    alacritty -T "MAIN ALACRITTY"
}
# Alacritty - NeoVim
function anv {
    alacritty -T "NeoVim" -o "window.startup_mode=Maximized" -e pwsh -NoProfile -c nvim $args
}
# Alacrity - Sudo
function asudo {
    sudo alacritty -T "Administrator Terminal" -e pwsh -NoProfile -c $args
}
# Alacritty - Godot4
function godot {
    Invoke-AlacrittyWithGodot4-0-2 $args
}
# Alacritty - Godot 4.0.2
function Invoke-AlacrittyWithGodot4-0-2 {
    $Godot4Exec = "E:\Tools\Godot\Godot_v4.0.2-stable_mono_win64\Godot_v4.0.2-stable_mono_win64_console.exe"
    alacritty -T "Godot Engine - Stable 4.0.2 - .NET" -e pwsh -NoProfile -c $Godot4Exec $args
}
# Alacritty - Check Internet Connection
function ping-monitor {
    alacritty -T "Check Internet Connection" -o "window.startup_mode=Maximized" -e pwsh -NoProfile -c "gping google.com store.steampowered.com patrykadamczyk.net 9.9.9.9 8.8.8.8 8.8.4.4 1.1.1.1 172.20.0.1 192.168.8.1"
}
