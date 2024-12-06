#!/usr/bin/env pwsh
. (Join-Path $PSScriptRoot ".." "cmdletlib" "Test-Command.ps1")
if (Test-Command zoxide) {
    Invoke-Expression (& {
        $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
        (zoxide init --hook $hook powershell | Out-String)
    })

    # Alacritty base directory workaround to change from windows dir to base user dir
    if ((pwd).Path -eq "C:\Windows") {
        z
    }
    New-Alias -Force -Option AllScope -Name cd -Value z
}