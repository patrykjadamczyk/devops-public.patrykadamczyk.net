#!/usr/bin/env pwsh
Install-Module -Name PSToml
Import-Module -Name PSToml

$accounts = (Get-Content ./config.toml | ConvertFrom-Toml).Keys

foreach ($account in $accounts) {
    Write-Host "Configuring account $account..."
    himalaya account configure "$account"
}
