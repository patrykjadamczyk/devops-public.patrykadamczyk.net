#!/usr/bin/env pwsh
BeforeAll {
    $TestCmdLetScript = Join-Path $PSScriptRoot ".." ".." "cmdletlib" "Get-WhoIs.ps1"
    . $TestCmdLetScript
}
Describe 'Get-WhoIs' {
    It 'should get whois information' -Skip {
        Write-Host -ForegroundColor DarkRed "TODO: Test not implemented yet."
        "TODO" | Should -Be "DONE"
    }
}