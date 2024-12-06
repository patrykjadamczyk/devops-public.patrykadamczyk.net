#!/usr/bin/env pwsh
function Global:Add-FileToClipboard (
    [Parameter(Mandatory=$true, Position=0)]
    [String] $Path
) {
    $realPath = Resolve-Path -Path $Path
    Set-Clipboard -Value $realPath
    Write-Host -ForegroundColor Green "Added $realPath to clipboard"
}
function Global:Copy-FileFromClipboard (
    [Parameter(Mandatory=$false, Position=0)]
    [String] $Path = "./"
) {
    $clipboardContent = Get-Clipboard
    if(![string]::IsNullOrWhiteSpace($clipboardContent)) {
        Write-Host -ForegroundColor Red "Error: Clipboard is empty"
    }
    Copy-Item -Path $clipboardContent -Destination $Path
}
function Global:Move-FileFromClipboard (
    [Parameter(Mandatory=$false, Position=0)]
    [String] $Path = "./"
) {
    $clipboardContent = Get-Clipboard
    if(![string]::IsNullOrWhiteSpace($clipboardContent)) {
        Write-Host -ForegroundColor Red "Error: Clipboard is empty"
    }
    Move-Item -Path $clipboardContent -Destination $Path
}
function Global:Copy-CWDToClipboard {
    Set-Clipboard -Value (Resolve-Path -Path .)
}
