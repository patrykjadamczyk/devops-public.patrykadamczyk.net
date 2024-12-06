#!/usr/bin/env pwsh
# SSL Store Location
$script:basePath = Join-Path $PSScriptRoot "store"
$script:storeCertPath = Join-Path $PSScriptRoot "store.pem"
# Regenerate Store
$regenStore = (-not (Test-Path $storeCertPath)) -or $env:POWERSHELL_REGEN_SSL_STORE -or $POWERSHELL_REGEN_SSL_STORE
if ($regenStore) {
    # Cleanup Store Location
    Remove-Item $basePath -Recurse -ErrorAction SilentlyContinue | Out-Null
    New-Item $basePath -ItemType Directory | Out-Null
    # Get all certs into the store
    Get-ChildItem -Path Cert:\LocalMachine\Root
        | ForEach-Object {
            Export-Certificate -Cert $_ -FilePath (Join-Path $basePath "$($_.Thumbprint).cer")
        }
        | Out-Null
    Get-ChildItem -Filter *.cer -Path $basePath
        | ForEach-Object {
            openssl x509 -outform PEM -in $_.FullName -inform der -out (Join-Path $basePath "$($_.BaseName).pem")
        } > $null 2>&1
        # | Out-Null
    # Combine certs
    $script:allCerts = Get-ChildItem -Filter "*.pem" -Path $basePath
        | ForEach-Object { Get-Content $_.FullName }
    $script:combinedCert = $allCerts -join "`n"
    Set-Content -Value $combinedCert -Path $storeCertPath
}
# Make environment variable for Node
$env:NODE_EXTRA_CA_CERTS = $storeCertPath
[System.Environment]::SetEnvironmentVariable('NODE_EXTRA_CA_CERTS', $storeCertPath, 'User')
