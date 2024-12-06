#!/usr/bin/env pwsh
BeforeAll {
    $TestCmdLetScript = Join-Path $PSScriptRoot ".." ".." "cmdletlib" "Test-IsWSL.ps1"
    . $TestCmdLetScript
}
Describe 'Test-IsWSL' {
    It 'should be true if /proc/version have Microsoft on Linux OS' {
        if ([System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Linux)) {
            if (Test-Path /proc/version) {
                $procVersion = Get-Content /proc/version
                if ($procVersion -match "Microsoft") {
                    Test-IsWSL | Should -BeTrue
                } else {
                    Test-IsWSL | Should -BeFalse
                }
            } else {
                Test-IsWSL | Should -BeFalse
            }
        } else {
            Test-IsWSL | Should -BeFalse
        }
    }
}