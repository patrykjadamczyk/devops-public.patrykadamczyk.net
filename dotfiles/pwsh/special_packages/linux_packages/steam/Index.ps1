#!/usr/bin/env pwsh
function Global:steam (
    [Parameter(Position=0,ValueFromRemainingArguments)]
    [string[]]$AdditionalArgs
) {
    $oldPath = "$env:PATH"

    # $steamExe = (which steam)
    $steamExe = "~/.var/app/com.valvesoftware.Steam/.local/share/Steam/steam.sh"

    $env:PATH = $env:PATH -replace ":/home/linuxbrew/.linuxbrew/bin",""
    $env:PATH = $env:PATH -replace ":/home/linuxbrew/.linuxbrew/sbin",""
    $env:PATH = $env:PATH -replace ":/snap/bin",""
    $env:PATH = $env:PATH -replace ":/home/patryk/.nix-profile/bin",""
    $env:PATH = $env:PATH -replace "/home/patryk/.nix-profile/bin:",""
    Write-Host "Overriding PATH variable"
    Write-Host "OLD: $oldPath"
    Write-Host "NEW: $env:PATH"
    # &"$steamExe" $AdditionalArgs
    Invoke-Expression "$steamExe $AdditionalArgs"
    Write-Host "Restoring original PATH variable"
    $env:PATH = $oldPath
}
