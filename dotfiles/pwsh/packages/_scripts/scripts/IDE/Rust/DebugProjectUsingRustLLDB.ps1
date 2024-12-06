#!/usr/bin/env pwsh
Write-Host "Specify additional arguments to build command (Ctrl+D to finish, escape to leave empty)"

$additionalArguments = (gum write --placeholder "Specify additional arguments to build command")

Write-Host "Executing: cargo build $additionalArguments"

Invoke-Expression "cargo build $additionalArguments".TrimEnd()

$executable = Get-ChildItem -Path ./target/debug -Recurse
    | ForEach-Object { $_.FullName }
    | Invoke-Fzf -Prompt "Specify executable to debug > "

Write-Host "Specify additional arguments to rust-lldb command (Ctrl+D to finish, escape to leave empty)"

$additionalArguments = (gum write --placeholder "Specify additional arguments to rust-lldb command")

Write-Host "Executing: rust-lldb $executable $additionalArguments"

return Invoke-Expression "rust-lldb $executable $additionalArguments".TrimEnd()
