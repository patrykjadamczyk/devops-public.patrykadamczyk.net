#!/usr/bin/env pwsh
BeforeAll {
    $TestCmdLetScript = Join-Path $PSScriptRoot ".." ".." "cmdletlib" "Convert-FromHumanReadableBytesBinary.ps1"
    . $TestCmdLetScript
}
Describe 'Convert-FromHumanReadableBytesBinary' {
    It 'should be calculate correctly' {
        "1.00 TB" | Convert-FromHumanReadableBytesBinary | Should -Be 1TB
    }
}