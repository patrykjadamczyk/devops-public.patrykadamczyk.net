#!/usr/bin/env pwsh
BeforeAll {
    $TestCmdLetScript = Join-Path $PSScriptRoot ".." ".." "cmdletlib" "Convert-FromHumanReadableBytes.ps1"
    . $TestCmdLetScript
}
Describe 'Convert-FromHumanReadableBytes' {
    It 'should be calculate correctly' {
        "1.00 TB" | Convert-FromHumanReadableBytes | Should -Be 1000000000000
    }
}