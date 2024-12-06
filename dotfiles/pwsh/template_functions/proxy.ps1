#!/usr/bin/env pwsh
function Global:proxy (
    [Parameter(Position=0,ValueFromRemainingArguments)]
    [string[]]$AdditionalArgs,
    [Parameter(ValueFromPipeline)]
    [string]$InputObject
) {
    if ($InputObject) {
        Write-Host "IO:"
        Write-Host $InputObject
    }
    Write-Host "Args:"
    Write-Host $AdditionalArgs
}
