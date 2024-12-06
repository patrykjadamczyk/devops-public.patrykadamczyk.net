#!/usr/bin/env pwsh
function Global:Enter-DirEnv {
    function Find-FileUpwards($path, $filename) {
        if ($path -eq "") {
            return $null
        } elseif (Test-Path (Join-Path $path $filename)) {
            return (Join-Path $path $filename)
        } else {
            return Find-FileUpwards (Split-Path $path) $filename
        }
    }
    $dirEnvPath = Find-FileUpwards (Get-Location) "direnv.env"
    $dirPs1Path = Find-FileUpwards (Get-Location) "direnv.ps1"
    if (![string]::IsNullOrWhiteSpace($dirEnvPath)) {
        Write-Host "Loading directory environment variables from $dirEnvPath"
        Get-Content $dirEnvPath | ForEach-Object {
            if ($_ -match '^(.*?)=(.*)$') {
                $name = $matches[1]
                $value = $matches[2]
                [System.Environment]::SetEnvironmentVariable($name, $value, 'Process')
            }
        }
    }
    if (![string]::IsNullOrWhiteSpace($dirPs1Path)) {
        Write-Host "Loading directory environment script from $dirPs1Path"
        . $dirPs1Path
    }
}
