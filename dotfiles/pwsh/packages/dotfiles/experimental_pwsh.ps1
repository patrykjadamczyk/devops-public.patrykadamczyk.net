#!/usr/bin/env pwsh
function Global:Start-ExperimentalPowerShell (
    [Parameter(Position=0,ValueFromRemainingArguments)]
    [string[]]$AdditionalArgs
) {
    $ExperimentalDotfiles = "~/go/src/bare.devops.patrykadamczyk.net/experimental"
    if (-not (Test-Path $ExperimentalDotfiles)) {
        Write-Error "Experimental dotfiles not found"
        Write-Error "Make experimental worktree in dotfiles to make this function work"
        Write-Error "Path searched: $ExperimentalDotfiles"
        return $null
    }

    $ExperimentalDotfiles = Resolve-Path $ExperimentalDotfiles
    $ExperimentalProfile = Join-Path $ExperimentalDotfiles "dotfiles/pwsh/CustomProfile.ps1"
    if (-not (Test-Path $ExperimentalProfile)) {
        Write-Error "Experimental profile not found"
        Write-Error "Make sure that $ExperimentalProfile exists"
        return $null
    }

    $ExperimentalProfile = Resolve-Path $ExperimentalProfile
    return pwsh -NoProfile -NoExit -Command "Write-Host 'Starting experimental PowerShell Instance';`$PROFILE = '$ExperimentalProfile';. `$PROFILE; Clear-Host" $AdditionalArgs
}
