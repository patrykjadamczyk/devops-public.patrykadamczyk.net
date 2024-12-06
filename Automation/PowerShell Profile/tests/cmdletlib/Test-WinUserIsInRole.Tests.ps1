#!/bin/env pwsh
BeforeAll {
    $TestCmdLetScript = Join-Path $PSScriptRoot ".." ".." "cmdletlib" "Test-WinUserIsInRole.ps1"
    . $TestCmdLetScript
}
Describe 'Test-WinUserIsInRole' {
    It 'should be true if run by administrator and group is not changed' {
        if ([System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Windows)) {
            $isAdmin = [Security.Principal.WindowsIdentity]::GetCurrent().Groups -contains 'S-1-5-32-544';
            Test-WinUserIsInRole | Should -Be $isAdmin
        } else {
            Write-Host -ForegroundColor Red "Test of Test-WinUserIsInRole is unsupported on your platform"
            "IGNORE" | Should -Be "IGNORE"
        }
    }
    It 'should be true if run by administrator and group is set to root' {
        if ([System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Windows)) {
            $isAdmin = [Security.Principal.WindowsIdentity]::GetCurrent().Groups -contains 'S-1-5-32-544';
            Test-WinUserIsInRole -BuiltInRole Administrator | Should -Be $isAdmin
        } else {
            Write-Host -ForegroundColor Red "Test of Test-WinUserIsInRole is unsupported on your platform"
            "IGNORE" | Should -Be "IGNORE"
        }
    }
    It 'should be true if run by user and group is set to User group' {
        if ([System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Windows)) {
            $isUser = [Security.Principal.WindowsIdentity]::GetCurrent().Groups -contains 'S-1-5-32-545';
            Test-WinUserIsInRole -BuiltInRole User | Should -Be $isUser
        } else {
            Write-Host -ForegroundColor Red "Test of Test-WinUserIsInRole is unsupported on your platform"
            "IGNORE" | Should -Be "IGNORE"
        }
    }
}