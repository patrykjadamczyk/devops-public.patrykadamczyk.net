#!/usr/bin/env pwsh
# Find all fonts that contains a certain string and pipe them to FZF
function Global:Find-Font (
    [Parameter(Mandatory=$true, Position=0)]
    [String] $FontNameContains
) {
    [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
    (New-Object System.Drawing.Text.InstalledFontCollection).Families | Where-Object { (Select-String -InputObject $_ -Pattern "$FontNameContains" -Quiet) -eq $true} | Invoke-Fzf
}
function Global:RunInVsDevCmd() {
    $devCmdScript = '"C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools\VsDevCmd.bat"'
    cmd.exe /C "call $devCmdScript && $args"
}
