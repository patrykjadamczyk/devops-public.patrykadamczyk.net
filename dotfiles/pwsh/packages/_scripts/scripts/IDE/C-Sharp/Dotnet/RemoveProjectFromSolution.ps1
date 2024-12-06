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

$SupportedProjectExtensions = @(
    # C# Project
    "*.csproj",
    # F# Project
    "*.fsproj",
    # Visual Basic Project
    "*.vbproj",
    # Shared Project
    "*.shproj",
    # Database Project
    "*.dbproj",
    # Old ASP.NET Project (according to Phind)
    "*.xproj"
)
$ProjectList = @(Get-ChildItem -Recurse -File -Include $SupportedProjectExtensions)

if ($ProjectList.Count -lt 1) {
    Write-Error "Error: Couldn't find any project file in current directory"
    return
}

$invokeProject = $null
if ($ProjectList.Count -gt 1) {
    $invokeProject = $ProjectList
        | Invoke-Fzf -Prompt "Choose project to use > "
} else {
    $invokeProject = $ProjectList[0]
}

Write-Host "Using project: $invokeProject"

Write-Host "Specify additional arguments to sln command (Ctrl+D to finish, escape to leave empty)"

$additionalArguments = (gum write --placeholder "Specify additional arguments to sln command")

Write-Host "Executing: dotnet sln $invokeSolution remove $invokeProject $additionalArguments"

return dotnet sln $invokeSolution remove $invokeProject $additionalArguments
