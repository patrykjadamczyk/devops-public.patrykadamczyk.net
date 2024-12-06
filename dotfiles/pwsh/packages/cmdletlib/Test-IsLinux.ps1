#!/bin/env pwsh

function Global:Test-IsLinux
{
    return [System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Linux);
}