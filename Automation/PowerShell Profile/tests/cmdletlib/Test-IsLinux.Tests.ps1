#!/bin/env pwsh
BeforeAll {
    $TestCmdLetScript = Join-Path $PSScriptRoot ".." ".." "cmdletlib" "Test-IsLinux.ps1"
    . $TestCmdLetScript
}
Describe 'Test-IsLinux' {
    It 'should be true if run on Mac OS' {
        if ([System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Linux)) {
            Test-IsLinux | Should -BeTrue
        } else {
            Test-IsLinux | Should -BeFalse
        }
    }
}