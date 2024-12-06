#!/bin/env pwsh

function Global:Test-IsDebug
{
    return $DebugPreference -ne "SilentlyContinue";
}
