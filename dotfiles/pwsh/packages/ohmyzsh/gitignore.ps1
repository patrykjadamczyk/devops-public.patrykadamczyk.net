#!/usr/bin/env pwsh
function Global:Get-GitIgnore {
    $baseUrl = "https://www.toptal.com/developers/gitignore/api"
    $gitIgnore = Invoke-RestMethod -Method Get -Uri "$baseUrl/list"
    if ([string]::IsNullOrWhiteSpace($gitIgnore)) {
        Write-Host -ForegroundColor Red "Git ignore list is not found"
    }
    $gitIgnore = "$gitIgnore".Split(",") | Foreach-Object { $_.Trim() }
    $foundIgnore = $gitIgnore | Invoke-Fzf
    if ([string]::IsNullOrWhiteSpace($foundIgnore)) {
        Write-Host -ForegroundColor Red "No type specified"
        return
    }
    return Invoke-RestMethod -Method Get -Uri "$baseUrl/$foundIgnore"
}
function Global:Add-GitIgnore {
    $pathToRepo = (git rev-parse --show-toplevel)
    if (!(Test-Path $pathToRepo)) {
        Write-Host -ForegroundColor Red "Path to repo is not found"
        return $null
    }
    Get-GitIgnore | Add-Content -Path (Join-Path $pathToRepo ".gitignore")
}
