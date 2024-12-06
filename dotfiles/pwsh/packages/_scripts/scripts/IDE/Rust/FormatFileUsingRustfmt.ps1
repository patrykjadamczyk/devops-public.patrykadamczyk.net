#!/usr/bin/env pwsh
$FileList = @(Get-ChildItem -Recurse -File -Filter "*.rs")

if ($FileList.Count -lt 1) {
    Write-Error "Error: Couldn't find any project file in current directory"
    return
}

$fileToFormat = $null
if ($FileList.Count -gt 1) {
    $fileToFormat = $FileList
        | Invoke-Fzf -Prompt "Choose project to use > "
} else {
    $fileToFormat = $FileList[0]
}

Write-Host "Using file: $fileToFormat"

Write-Host "Specify additional arguments to rustfmt command (Ctrl+D to finish, escape to leave empty)"

$additionalArguments = (gum write --placeholder "Specify additional arguments to rustfmt command")

Write-Host "Executing: cargo fmt -- $fileToFormat $additionalArguments"

return Invoke-Expression "cargo fmt -- $fileToFormat $additionalArguments".TrimEnd()
