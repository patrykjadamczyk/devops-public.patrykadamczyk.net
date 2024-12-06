#!/bin/env pwsh
BeforeAll {
    $TestCmdLetScript = Join-Path $PSScriptRoot ".." ".." "cmdletlib" "Test-UnixUserIsInRole.ps1"
    . $TestCmdLetScript
}
Describe 'Test-UnixUserIsInRole' {
    It 'should be true if run by administrator and group is not changed' {
        if ([System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Windows)) {
            Write-Host -ForegroundColor Red "Test of Test-UnixUserIsInRole is unsupported on your platform"
            "IGNORE" | Should -Be "IGNORE"
        } else {
            $isAdmin = (id -u) -eq 0 -or (id -g) -eq 0;
            Test-UnixUserIsInRole | Should -Be $isAdmin
        }
    }
    It 'should be true if run by administrator and group is set to root' {
        if ([System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Windows)) {
            Write-Host -ForegroundColor Red "Test of Test-UnixUserIsInRole is unsupported on your platform"
            "IGNORE" | Should -Be "IGNORE"
        } else {
            $isAdmin = (id -u) -eq 0 -or (id -g) -eq 0;
            Test-UnixUserIsInRole root | Should -Be $isAdmin
        }
    }
    It 'should be true if run by user and group is set to its group' {
        if ([System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Windows)) {
            Write-Host -ForegroundColor Red "Test of Test-UnixUserIsInRole is unsupported on your platform"
            "IGNORE" | Should -Be "IGNORE"
        } else {
            $groupName = id -gn
            $groupId = getent group $groupName | cut -d: -f3
            $isInGroup = (id -g) -eq $groupId
            Test-UnixUserIsInRole -Group $groupName | Should -Be $isInGroup
        }
    }
}