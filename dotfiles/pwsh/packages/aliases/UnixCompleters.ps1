#!/usr/bin/env pwsh
if ([System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Windows)) {
} else {
    try
    {
        Import-UnixCompleters
    }
    catch
    {
    }
}