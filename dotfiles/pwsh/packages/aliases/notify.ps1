#!/usr/bin/env pwsh

function Global:notify(
    [Parameter(Position = 0)]
    [string]$title,
    [Parameter(Position = 1)]
    [string]$body
) {
    Write-Host -NoNewline -Object ("`e]777;notify;{0};{1}`e\" -f "$title","$body")
}
