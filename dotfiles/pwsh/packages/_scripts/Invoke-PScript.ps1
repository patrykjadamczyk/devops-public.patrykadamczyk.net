#!/usr/bin/env pwsh
function Global:Invoke-PScript(
    [Parameter(Mandatory=$true, Position=0)]
    [String] $ScriptName,
    [Parameter(Position=1,ValueFromRemainingArguments)]
    [string[]]$AdditionalArgs,
    [Parameter(ValueFromPipeline)]
    [string]$InputObject
) {
    $FullScriptName = (Get-ChildItem (Join-Path $PSScriptRoot "scripts" "$ScriptName.ps1")).FullName
    if ($InputObject) {
        return $InputObject | . $FullScriptName $AdditionalArgs
    }
    return . $FullScriptName $AdditionalArgs
}

function Global:Invoke-PScriptInteractively() {
    $ScriptsPath = (Resolve-Path ( Join-Path $PSScriptRoot "scripts" )).Path
    $ScriptsList = Get-ChildItem $ScriptsPath -Filter "*.ps1" -Recurse
    $ScriptsPathList = $ScriptsList | ForEach-Object {
        $_.FullName.Replace("$ScriptsPath\", "").Replace("$ScriptsPath/","")
    }
    $invokeScript = $ScriptsPathList | Invoke-Fzf
    if ([string]::IsNullOrWhiteSpace($invokeScript)) {
        return
    }
    $FullScriptName = Join-Path $ScriptsPath $invokeScript
    return . $FullScriptName
}

function Global:Show-PScriptInteractively() {
    $ScriptsPath = (Resolve-Path ( Join-Path $PSScriptRoot "scripts" )).Path
    $ScriptsList = Get-ChildItem $ScriptsPath -Filter "*.ps1" -Recurse
    $ScriptsPathList = $ScriptsList | ForEach-Object {
        $_.FullName.Replace("$ScriptsPath\", "").Replace("$ScriptsPath/","")
    }
    $invokeScript = $ScriptsPathList | Invoke-Fzf
    if ([string]::IsNullOrWhiteSpace($invokeScript)) {
        return
    }
    $FullScriptName = Join-Path $ScriptsPath $invokeScript
    return bat $FullScriptName
}
