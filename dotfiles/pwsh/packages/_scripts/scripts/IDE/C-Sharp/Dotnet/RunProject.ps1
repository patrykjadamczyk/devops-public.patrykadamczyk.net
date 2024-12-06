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
    "*.dbproj"
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

$configurations = @("Debug", "Release")
try {
    $invokeProjectXml = [xml](Get-Content $invokeProject)
    $invokeProjectConfigurationsXml = $invokeProjectXml
        | Select-Xml -XPath "/Project/PropertyGroup/Configurations"
        | ForEach-Object { $_.Node.InnerText }
    $configurations = $invokeProjectConfigurationsXml.Split(";")
} catch {
}

$invokeConfiguration = $configurations
    | Invoke-Fzf -Prompt "Choose configuration to use > "

Write-Host "Using configuration: $invokeConfiguration"

Write-Host "Specify additional arguments to run command (Ctrl+D to finish, escape to leave empty)"

$additionalArguments = (gum write --placeholder "Specify additional arguments to run command")

Write-Host "Executing: dotnet run --project $invokeProject --configuration $invokeConfiguration $additionalArguments"

return dotnet run --project $invokeProject --configuration $invokeConfiguration $additionalArguments
