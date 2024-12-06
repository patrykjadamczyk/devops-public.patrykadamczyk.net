#!/usr/bin/env pwsh
. "$PSScriptRoot\..\packages\cmdletlib\Test-Command.ps1"
# XDG Variables
# $env:XDG_DATA_HOME = $env:XDG_DATA_HOME ?? $env:APPDATA
# $env:XDG_CONFIG_HOME = $env:XDG_CONFIG_HOME ?? $env:LOCALAPPDATA
# $env:XDG_CACHE_HOME = $env:XDG_CACHE_HOME ?? $env:TEMP
# Editor
$env:EDITOR = "nvim"
$env:GIT_EDITOR = "nvim"
# Pager
if (Test-Command gum) {
    $env:PAGER = "gum pager"
}
