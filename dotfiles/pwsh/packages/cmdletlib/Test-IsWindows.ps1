#!/bin/env pwsh

function Global:Test-IsWindows
{
    return [System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Windows);
}