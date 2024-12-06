#!/usr/bin/env nu
if ($_IsWindows) {
    let AlacrittyConfig = $env.APPDATA | path join "alacritty" "alacritty.yml";
} else {
    try {
        let AlacrittyConfig = $env.XDG_CONFIG_HOME | path join "alacritty" "alacritty.yml";
    } catch {
        let AlacrittyConfig = $env.HOME | path join ".config" "alacritty" "alacritty.yml";
    }
}
