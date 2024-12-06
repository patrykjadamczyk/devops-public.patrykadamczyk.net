#!/usr/bin/env pwsh
try
{
    if ($_IsLinux) {
        Import-Module `
            -Name Terminal-Icons `
            -ErrorAction Stop `
            2>&1 3>&1 4>&1 5>&1 6>&1 | Out-Null
    } else {
        Import-Module -Name Terminal-Icons -ErrorAction Stop
    }
}
catch
{
    Install-Module -Name Terminal-Icons -Force
    Import-Module -Name Terminal-Icons
}
