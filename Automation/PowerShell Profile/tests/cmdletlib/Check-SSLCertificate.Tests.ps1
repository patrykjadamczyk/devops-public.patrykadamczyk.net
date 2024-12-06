#!/usr/bin/env pwsh
BeforeAll {
    $TestCmdLetScript = Join-Path $PSScriptRoot ".." ".." "cmdletlib" "Check-SSLCertificate.ps1"
    . $TestCmdLetScript
}
Describe 'Check-SSLCertificate' {
    It 'should get ssl certificate information' -Skip {
        Write-Host -ForegroundColor DarkRed "TODO: Test not implemented yet."
        "TODO" | Should -Be "DONE"
    }
}