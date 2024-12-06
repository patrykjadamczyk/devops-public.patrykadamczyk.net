#!/usr/bin/env pwsh
BeforeAll {
    $TestCmdLetScript = Join-Path $PSScriptRoot ".." ".." "cmdletlib" "Format-FileSize.ps1"
    . $TestCmdLetScript
}
Describe 'Format-FileSize' {
    It 'should be calculate correctly' {
        Format-FileSize -Size (1TB + 1GB) | Should -Match "1.10 TB"
    }
}