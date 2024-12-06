#!/usr/bin/env pwsh
BeforeAll {
    $TestCmdLetScript = Join-Path $PSScriptRoot ".." ".." "cmdletlib" "Get-Disk.ps1"
    . $TestCmdLetScript
}
Describe 'Get-Disk' {
    It 'should get disk information' -Skip {
        Write-Host -ForegroundColor DarkRed "TODO: Test not implemented yet."
        "TODO" | Should -Be "DONE"
    }
}