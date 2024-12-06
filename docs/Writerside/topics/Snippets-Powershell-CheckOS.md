# Check Operating System

## Code

```Console
#!/bin/env pwsh

# Check in Script or Shell which system is used
if ($IsWindows) {
    Write-Host "You are on Windows"
}
if ($IsCoreCLR) {
    Write-Host "PowerShell targetting .NET Core Runtime"
}
if ($IsLinux) {
    Write-Host "You are on Linux"
}
if ($IsMacOS) {
    Write-Host "You are on Mac OS"
}
# Check in CmdLets and everywhere else (Cmdlets don't have variables above)
# Logic of this code is from: https://github.com/PowerShell/PowerShell/blob/master/src/System.Management.Automation/CoreCLR/CorePsPlatform.cs
function Test-IsWindows
{
    return [System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Windows);
}
function Test-IsCoreCLR
{
    return $true
}
function Test-IsLinux
{
    return [System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Linux);
}
function Test-IsMacOS
{
    return [System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::OSX);
}
```

## Quick Copy
### Check if Windows
```Console
[System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Windows)
```
### Check if Linux
```Console
[System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Linux)
```
### Check if Mac OS X
```Console
[System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::OSX)
```