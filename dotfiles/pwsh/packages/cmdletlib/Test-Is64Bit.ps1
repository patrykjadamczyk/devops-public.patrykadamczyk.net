#!/bin/env pwsh

function Global:Test-Is64Bit
{
    return [IntPtr]::Size -eq 8;
}