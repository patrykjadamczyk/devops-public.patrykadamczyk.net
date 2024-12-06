#!/usr/bin/env pwsh
Write-Host "Specify additional arguments to rustfmt command (Ctrl+D to finish, escape to leave empty)"

$additionalArguments = (gum write --placeholder "Specify additional arguments to rustfmt command")
$additionalArguments = "$additionalArguments"

Write-Host "Executing: cargo fmt --all $additionalArguments"

return Invoke-Expression "cargo fmt --all $additionalArguments".TrimEnd()
