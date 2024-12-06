#!/bin/env pwsh
BeforeAll {
    $TestCmdLetScriptDependency1 = Join-Path $PSScriptRoot ".." ".." "cmdletlib" "Test-IsWindows.ps1"
    . $TestCmdLetScriptDependency1
    $TestCmdLetScriptDependency2 = Join-Path $PSScriptRoot ".." ".." "cmdletlib" "Test-IsMacOS.ps1"
    . $TestCmdLetScriptDependency2
    $TestCmdLetScriptDependency3 = Join-Path $PSScriptRoot ".." ".." "cmdletlib" "Test-IsLinux.ps1"
    . $TestCmdLetScriptDependency3
    $TestCmdLetScriptDependency4 = Join-Path $PSScriptRoot ".." ".." "cmdletlib" "Test-WinUserIsInRole.ps1"
    . $TestCmdLetScriptDependency4
    $TestCmdLetScriptDependency5 = Join-Path $PSScriptRoot ".." ".." "cmdletlib" "Test-UnixUserIsInRole.ps1"
    . $TestCmdLetScriptDependency5
    $TestCmdLetScript = Join-Path $PSScriptRoot ".." ".." "cmdletlib" "Test-IsUserAdministrator.ps1"
    . $TestCmdLetScript
}
Describe 'Test-UserIsAdministrator' {
    It 'should be true if run by administrator' {
        if ([System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Windows)) {
            $isAdmin = [Security.Principal.WindowsIdentity]::GetCurrent().Groups -contains 'S-1-5-32-544';
            Test-UserIsAdministrator | Should -Be $isAdmin
        } else {
            $isAdmin = (id -u) -eq 0 -or (id -g) -eq 0;
            Test-UserIsAdministrator | Should -Be $isAdmin
        }
    }
}