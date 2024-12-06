#!/usr/bin/env pwsh
Write-Host "Specify additional arguments to test command (Ctrl+D to finish, escape to leave empty)"

$additionalArguments = (gum write --placeholder "Specify additional arguments to test command")

Write-Host "Executing: dotnet test $additionalArguments"

return dotnet test $additionalArguments
