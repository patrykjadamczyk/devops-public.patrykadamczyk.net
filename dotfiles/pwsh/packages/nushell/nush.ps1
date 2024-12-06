#!/usr/bin/env pwsh
function Global:nush-json (
    [Parameter(Position=0)]
    [string]$Command
) {
    return (nu -c "$Command | to json" | ConvertFrom-Json)
}

function Global:nush (
    [Parameter(Position=0)]
    [string]$Command
) {
    nu -c "$Command"
}

function Global:ConvertTo-NuTable (
    [Parameter(Position=0,ValueFromRemainingArguments)]
    [string[]]$AdditionalArgs,
    [Parameter(ValueFromPipeline)]
    $InputObject
) {
    if ($AdditionalArgs.Length -eq 0) {
        $InputObject | nu --stdin -c "from json"
    } else {
        $InputObject | nu --stdin -c "from json | $AdditionalArgs"
    }
}
