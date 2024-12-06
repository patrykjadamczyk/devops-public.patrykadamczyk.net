#!/usr/bin/env pwsh
# Add FZF to PATH
if ($_IsWindows) {
    $Env:PATH += ";$(Join-Path "~" ".fzf" "bin")"
} else {
    $Env:PATH += ":$(Join-Path "~" ".fzf" "bin")"
}
# Change options for FZF
# Catpuccin Theme
$ENV:FZF_DEFAULT_OPTS=@"
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8
"@
# Add FZF Module to PowerShell
try
{
    Import-Module -Name PSFzf -ErrorAction Stop
}
catch
{
    Install-Module -Name PSFzf -Force
    Import-Module -Name PSFzf
}
# Change FZF for Alt+C to Zoxide
. (Join-Path $PSScriptRoot ".." "cmdletlib" "Test-Command.ps1")
if (Test-Command zoxide) {
    $commandOverride = [ScriptBlock]{ param($Location) z $Location }
    Set-PsFzfOption -AltCCommand $commandOverride
}
