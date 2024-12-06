#!/usr/bin/env pwsh
. "$PSScriptRoot\..\cmdletlib\Test-Command.ps1"
. "$PSScriptRoot\..\cmdletlib\Test-PSDrive.ps1"
New-PSDrive User filesystem ~/ -ErrorAction SilentlyContinue | Out-Null
New-PSDrive Projects filesystem ~/go/src -ErrorAction SilentlyContinue | Out-Null
New-PSDrive PWSH_Config filesystem $PROFILE.Replace("Microsoft.PowerShell_profile.ps1", "") -ErrorAction SilentlyContinue | Out-Null
New-PSDrive PWSH_Conf filesystem $RealProfileDir -ErrorAction SilentlyContinue | Out-Null

@("User", "Projects", "PWSH_Config", "PWSH_Conf") | ForEach-Object {
    if (!(Test-PSDrive $_)) {
        Write-Host -ForegroundColor Red "PSDrive $_ is not found"
        Write-Host "-------------------------------------------------------------------"
        Write-Host "This is content of PSDrives/Index.ps1 file. You can try running command making specific PSDrive and checking error and then fixing it."
        Write-Host "-------------------------------------------------------------------"
        $content = Get-Content (Join-Path $PSScriptRoot "Index.ps1")
        if (Test-Command bat) {
            $content | bat --paging=never
        } else {
            $content | Write-Host
        }
    }
}
