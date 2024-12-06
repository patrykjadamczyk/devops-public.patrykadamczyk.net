#!/bin/env pwsh

function Global:Test-PSDrive($psdrive) {
    try {
        if (Get-PSDrive $psdrive -ErrorAction Stop) {
            return $true
        }
    } catch {}
    return $false
}
