#!/bin/env pwsh
BeforeAll {
    $TestCmdLetScript = Join-Path $PSScriptRoot ".." ".." "cmdletlib" "Test-IsMacOS.ps1"
    . $TestCmdLetScript
}
Describe 'Test-IsMacOS' {
    It 'should be true if run on Mac OS' {
        if ([System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::OSX)) {
            Test-IsMacOS | Should -BeTrue
        } else {
            Test-IsMacOS | Should -BeFalse
        }
    }
}