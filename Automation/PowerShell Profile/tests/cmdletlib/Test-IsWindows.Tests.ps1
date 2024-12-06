#!/bin/env pwsh
BeforeAll {
    $TestCmdLetScript = Join-Path $PSScriptRoot ".." ".." "cmdletlib" "Test-IsWindows.ps1"
    . $TestCmdLetScript
}
Describe 'Test-IsWindows' {
    It 'should be true if run on Windows' {
        if ([System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Windows)) {
            Test-IsWindows | Should -BeTrue
        } else {
            Test-IsWindows | Should -BeFalse
        }
    }
}