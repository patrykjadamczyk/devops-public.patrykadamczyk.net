#!/bin/env pwsh

function Global:Test-Command($command) {
    try {
        if (Get-Command $command -ErrorAction Stop) {
            return $true
        }
    } catch {}
    return $false
}