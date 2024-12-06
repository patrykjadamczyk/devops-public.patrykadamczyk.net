#!/usr/bin/env pwsh
$SolutionList = @(Get-ChildItem -Filter "*.sln" -Recurse)

if ($SolutionList.Count -lt 1) {
    Write-Error "Error: Couldn't find any solution file in current directory"
    return
}

$invokeSolution = $null
if ($SolutionList.Count -gt 1) {
    $invokeSolution = $SolutionList
        | Invoke-Fzf -Prompt "Choose solution to use > "
} else {
    $invokeSolution = $SolutionList[0]
}

Write-Host "Using solution: $invokeSolution"

Write-Host "Specify additional arguments to build command (Ctrl+D to finish, escape to leave empty)"

$additionalArguments = (gum write --placeholder "Specify additional arguments to build command")

Write-Host "Executing: dotnet build $invokeSolution $additionalArguments"

return dotnet build $invokeSolution $additionalArguments
