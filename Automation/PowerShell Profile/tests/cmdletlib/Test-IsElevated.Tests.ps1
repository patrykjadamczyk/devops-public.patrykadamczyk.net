#!/bin/env pwsh
BeforeAll {
    $TestCmdLetScript = Join-Path $PSScriptRoot ".." ".." "cmdletlib" "Test-IsElevated.ps1"
    . $TestCmdLetScript
}
Describe 'Test-IsElevated' {
    It 'should be true if run by administrator' {
        if ([System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Windows)) {
            $isAdmin = [Security.Principal.WindowsIdentity]::GetCurrent().Groups -contains 'S-1-5-32-544';
            Test-IsElevated | Should -Be $isAdmin
        } else {
            $isAdmin = (id -u) -eq 0 -or (id -g) -eq 0;
            Test-IsElevated | Should -Be $isAdmin
        }
    }
}