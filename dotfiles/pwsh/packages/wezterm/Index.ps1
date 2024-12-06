#!/usr/bin/env pwsh
# Import Shell Completion
wezterm shell-completion --shell power-shell | Out-String | Invoke-Expression

# Main WezTerm
function main_wezterm {
    $id = (wezterm cli spawn --new-window -- pwsh)
    wezterm cli set-window-title --pane-id $id "Main WezTerm"
    wezterm cli set-tab-title --tab-id $id "Main WezTerm"
}
# WezTerm - NeoVim
function wnv {
    $id = (wezterm cli spawn -- pwsh -NoProfile -c nvim $args)
    # wezterm cli set-window-title --pane-id $id "NeoVim"
    wezterm cli set-tab-title --tab-id $id "NeoVim"
}
function wnnv {
    $id = (wezterm cli spawn -- pwsh -NoProfile -c nnvim $args)
    # wezterm cli set-window-title --pane-id $id "NeoVim - Nightly"
    wezterm cli set-tab-title --tab-id $id "NeoVim - Nightly"
}
# WezTerm - Sudo
# TODO: Not working correctly now because sudo on Windows is not doing passthrough of stdout or anything for that matter
# function wsudo {
    # $id = (sudo wezterm cli spawn -- pwsh -NoProfile -c $args)
    # wezterm cli set-tab-title --tab-id $id "Administrator Terminal"
# }
# WezTerm - Godot4
function wgodot {
    if ($Config_Godot4Exec -eq "" -or $Config_Godot4Title -eq "") {
        Write-Error "Godot is not configured. Update variables in Dotfiles\pwsh\variables\Godot.ps1"
        return
    }
    $id = (wezterm cli spawn -- pwsh -NoProfile -c $Config_Godot4Exec $args)
    wezterm cli set-tab-title --tab-id $id $Config_Godot4Title
}
# WezTerm - Check Internet Connection
function wping-monitor {
    $id = (wezterm cli spawn -- pwsh -NoProfile -c "gping google.com store.steampowered.com 9.9.9.9 8.8.8.8 8.8.4.4 1.1.1.1")
    wezterm cli set-tab-title --tab-id $id "Check Internet Connection"
}
