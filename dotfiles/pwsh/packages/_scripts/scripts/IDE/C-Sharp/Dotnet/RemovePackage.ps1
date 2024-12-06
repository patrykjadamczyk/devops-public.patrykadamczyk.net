#!/usr/bin/env pwsh
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

$packageName = (gum input --prompt "Specify package to remove > ")

Write-Host "Specify additional arguments to remove package command (Ctrl+D to finish, escape to leave empty)"

$additionalArguments = (gum write --placeholder "Specify additional arguments to remove package command")

Write-Host "Executing: dotnet remove $invokeProject package $packageName $additionalArguments"

return dotnet remove $invokeProject package $packageName $additionalArguments
