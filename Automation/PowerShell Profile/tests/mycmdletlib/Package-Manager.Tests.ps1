#!/usr/bin/env pwsh
BeforeAll {
    $TestCmdLetScript = Join-Path $PSScriptRoot ".." ".." "cmdletlib" "Package-Manager.ps1"
    . $TestCmdLetScript
}
Describe 'Package-Manager' {
    It 'should get whois information' -Skip {
        Write-Host -ForegroundColor DarkRed "TODO: Test not implemented yet."
        "TODO" | Should -Be "DONE"
    }
}