#!/usr/bin/env pwsh
Write-Host "Specify additional arguments to run command (Ctrl+D to finish, escape to leave empty)"

$additionalArguments = (gum write --placeholder "Specify additional arguments to run command")

Write-Host "Executing: cargo run $additionalArguments"

return Invoke-Expression "cargo run $additionalArguments".TrimEnd()
