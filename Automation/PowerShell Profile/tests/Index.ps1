#!/usr/bin/env pwsh
$padding = "============"
Write-Host -ForegroundColor Green "${padding} Install Pester ${padding}"
Install-Module -Name Pester -Force
Write-Host -ForegroundColor Green "${padding} Import Pester ${padding}"
Import-Module Pester -PassThru
Write-Host -ForegroundColor Green "${padding} Imported Pester ${padding}"

Write-Host -ForegroundColor Green "${padding} Start tests ${padding}"
Invoke-Pester -Output Detailed $PSScriptRoot
Write-Host -ForegroundColor Green "${padding} Finished tests ${padding}"