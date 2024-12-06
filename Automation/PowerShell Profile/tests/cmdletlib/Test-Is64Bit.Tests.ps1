#!/bin/env pwsh
BeforeAll {
    $TestCmdLetScript = Join-Path $PSScriptRoot ".." ".." "cmdletlib" "Test-Is64Bit.ps1"
    . $TestCmdLetScript
}
Describe 'Test-Is64Bit' {
    It 'should be true if run on 64 bit system' {
        $is64 = [IntPtr]::Size -eq 8;
        Test-Is64Bit | Should -Be $is64
    }
}