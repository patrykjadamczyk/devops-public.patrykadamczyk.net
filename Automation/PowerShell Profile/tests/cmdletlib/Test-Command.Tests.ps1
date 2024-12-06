#!/usr/bin/env pwsh
BeforeAll {
    $TestCmdLetScript = Join-Path $PSScriptRoot ".." ".." "cmdletlib" "Test-Command.ps1"
    . $TestCmdLetScript
    function Test-HelloWorldCommand {}
}
Describe 'Test-Command' {
    It 'should be true if command exists' {
        Test-Command Test-HelloWorldCommand | Should -BeTrue
    }
    It 'should be false if command do not exists' {
        Test-Command Test-HelloWorldCommand21287381273912379128379812398 | Should -BeFalse
    }
}