#!/usr/bin/env nu
if ($_IsWindows) {
    let NVIMConfigFile = $env.LOCALAPPDATA | path join "nvim" "init.lua";
} else {
    try {
        let NVIMConfigFile = $env.XDG_CONFIG_HOME | path join "nvim" "init.lua";
    } catch {
        let NVIMConfigFile = $env.HOME | path join ".config" "nvim" "init.lua";
    }
}

$env.RIPGREP_CONFIG_PATH = $env.HOME | path join "go" "src" "devops.patrykadamczyk.net" "dotfiles" "rg" ".ripgreprc";
