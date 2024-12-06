#!/usr/bin/env pwsh
. "$PSScriptRoot\..\cmdletlib\Test-Command.ps1"
# Proxy function arround yazi that would auto install it if it's windows with scoop
function Local:yazifm (
    [Parameter(Position=0,ValueFromRemainingArguments)]
    [string[]]$AdditionalArgs,
    [Parameter(ValueFromPipeline)]
    [string]$InputObject
) {
    if (!(Test-Command yazi)) {
        if (Test-Command scoop) {
            scoop install yazi
        } else {
            Write-Host -ForegroundColor Red "yazi command is not found and scoop is not found"
        }
    }
    if ($InputObject) {
        return $InputObject | yazi $AdditionalArgs
    }
    return yazi $AdditionalArgs
}
# File manager alias
function Global:fm (
    [Parameter(Position=0,ValueFromRemainingArguments)]
    [string[]]$AdditionalArgs,
    [Parameter(ValueFromPipeline)]
    [string]$InputObject
) {
    if (![System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Windows)) {
        return yazifm -InputObject $InputObject -AdditionalArgs $AdditionalArgs
    }
    $oldPath = $env:PATH
    # Add Git stuff for file.exe
    $env:PATH = "$oldPath;C:\Program Files\Git\usr\bin"
    yazifm -InputObject $InputObject -AdditionalArgs $AdditionalArgs
    $env:PATH = $oldPath;
}
