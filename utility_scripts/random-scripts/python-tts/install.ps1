#!/usr/bin/env pwsh
Set-Location $PSScriptRoot;
if ([System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Linux)) {
    sudo apt install espeak
}
python3 -m pip install ./requirements.txt
