#!/usr/bin/env pwsh
BeforeAll {
    $TestCmdLetScript = Join-Path $PSScriptRoot ".." ".." "cmdletlib" "Format-FileSizeBinary.ps1"
    . $TestCmdLetScript
}
Describe 'Format-FileSizeBinary' {
    It 'should be calculate correctly' {
        Format-FileSizeBinary -Size (1TB + 1GB) | Should -Match "1.00 TB"
    }
}