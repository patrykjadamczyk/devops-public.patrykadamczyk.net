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

Write-Host "Specify additional arguments to clean command (Ctrl+D to finish, escape to leave empty)"

$cleanAdditionalArguments = (gum write --placeholder "Specify additional arguments to clean command")

Write-Host "Specify additional arguments to build command (Ctrl+D to finish, escape to leave empty)"

$buildAdditionalArguments = (gum write --placeholder "Specify additional arguments to build command")

Write-Host "Executing: dotnet clean $invokeProject $cleanAdditionalArguments"

dotnet clean $invokeProject $cleanAdditionalArguments

Write-Host "Executing: dotnet build $invokeProject $buildAdditionalArguments"

return dotnet build $invokeProject $buildAdditionalArguments
