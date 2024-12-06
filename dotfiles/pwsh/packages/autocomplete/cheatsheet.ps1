#!/usr/bin/env pwsh
function Global:Get-CheatSheet {
    $CheatSheetPath = Join-Path $PSScriptRoot "cheatsheets"
    $CheatSheetPath = Resolve-Path $CheatSheetPath

    return Get-ChildItem -Recurse -Path $CheatSheetPath -Filter "*.md"
        | Invoke-Fzf -Prompt "CheatSheet > " -Preview "bat {} | gum format -t markdown" -PreviewWindow "down:50%"
}

function Global:Open-CheatSheet {
    $file = Get-CheatSheet
    return glow $file
}

function Global:Search-CheatSheet (
    [Parameter(Mandatory = $false, Position = 0)]
    [string]$Query = "# ``"
) {
    $CheatSheetPath = Join-Path $PSScriptRoot "cheatsheets"
    $CheatSheetPath = Resolve-Path $CheatSheetPath
    return Invoke-PsFzfRg -SearchString $Query -Path $CheatSheetPath
}

function Global:Edit-CheatSheet (
    [ValidateSet("neovim", "neovide", "vscode", "vscode-insiders", "nvim")]
    [String] $Editor = "neovide"
) {
    $CheatSheetPath = Join-Path $PSScriptRoot "cheatsheets"
    $CheatSheetPath = Resolve-Path $CheatSheetPath
    switch ($Editor) {
        "neovim" {
            n $CheatSheetPath
        }
        "nvim" {
            n $CheatSheetPath
        }
        "neovide" {
            nn $CheatSheetPath
        }
        "vscode" {
            code $CheatSheetPath
        }
        "vscode-insiders" {
            code-insiders $CheatSheetPath
        }
    }
}
