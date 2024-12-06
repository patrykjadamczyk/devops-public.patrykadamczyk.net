#!/usr/bin/env nu
# XDG Variables
# $env.XDG_DATA_HOME = $env.XDG_DATA_HOME ?? $env.APPDATA
# $env.XDG_CONFIG_HOME = $env.XDG_CONFIG_HOME ?? $env.LOCALAPPDATA
# $env.XDG_CACHE_HOME = $env.XDG_CACHE_HOME ?? $env.TEMP
# Editor
$env.EDITOR = "nvim"
$env.GIT_EDITOR = "nvim"
# Browser
# $env.BROWSER = "min"
$env.BROWSER = "brave-browser"
# Pager
{ ||
    if (which gum | is-empty) {
        return
    }

    $env.PAGER = "gum pager"
}
