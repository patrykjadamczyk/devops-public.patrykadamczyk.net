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
    if ($Config_Godot4Exec -eq "" -or $Config_Godot4Title -eq "") {
        Write-Error "Godot is not configured. Update variables in Dotfiles\pwsh\variables\Godot.ps1"
        return
    }
    alacritty -T $Config_Godot4Title -e pwsh -NoProfile -c $Config_Godot4Exec $args
}
# Alacritty - Check Internet Connection
function ping-monitor {
    alacritty -T "Check Internet Connection" -o "window.startup_mode=Maximized" -e pwsh -NoProfile -c "gping google.com store.steampowered.com patrykadamczyk.net 9.9.9.9 8.8.8.8 8.8.4.4 1.1.1.1 172.20.0.1 192.168.8.1"
}
