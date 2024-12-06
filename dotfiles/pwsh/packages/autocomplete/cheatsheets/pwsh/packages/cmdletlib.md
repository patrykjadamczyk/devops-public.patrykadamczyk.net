# Cmdlet Library

## Check-SSLCertificate.ps1

### `Check-SSLCertificate <url>`

Check SSL Certificate for specified URL.

Warning! This cmdlet uses C# Code inside PowerShell. This cmdlet can be slow to startup because of that. And note for
deving it. When you change C# code of this cmdlet, you need to make new instance of powershell to see changes. You can't
re-add it or anything like that to make it work.

## Convert-FromHumanReadableBytes.ps1

### `Convert-FromHumanReadableBytes`

Change size in human readable format to machine readable format.

## Convert-FromHumanReadableBytesBinary.ps1

### `Convert-FromHumanReadableBytesBinary`

Change size in binary format to human readable format.

## Format-FileSize.ps1

### `Format-FileSize`

Change size in human readable format to machine readable format.

## Format-FileSizeBinary.ps1

### `Format-FileSizeBinary`

Change size in binary format to human readable format.

## Get-Disk.ps1

### `Get-Disk`

Get all available disks.
This cmdlet is crossplatform.
This cmdlet shadows PowerShell's cmdlet Get-Disk that is based on WMI so doesn't work outside
of Windows.

## Get-WhoIs.ps1

### `Get-WhoIs <IP_ADDRESS>`

Get WhoIS information for IP Address.

## Test-Command.ps1

### `Test-Command <command>`

Check if command exist. Returns true or false.

## Test-Is64Bit.ps1

### `Test-Is64Bit`

Check if operating system is 64 bit.

## Test-IsDebug.ps1

### `Test-IsDebug`

Check if debug mode.
Based on DebugPreference be to anything else than SilentlyContinue.

## Test-IsElevated.ps1

### `Test-IsElevated`

Check if running as administrator.

## Test-Is(PLATFORM).ps1

### `Test-IsLinux` / `Test-IsMacOS` / `Test-IsWindows`

Check if it's running on specified in cmdlet platform.

### `Test-IsWSL`

Check if it's running in WSL

## Test-IsUserAdministrator.ps1

### `Test-UserIsAdministrator`

Check if current user is administrator

## Test-PSDrive.ps1

### `Test-PSDrive <PSDRIVE>`

Checks if specified PSDrive exists

## Test-UnixUserIsInRole.ps1 / Test-WinUserIsInRole.ps1

### `Test-UnixUserIsInRole <USER> <ROLE>`

Check if specified user is in role.
By default it's checking current user and group root.
Works on linux (doesn't work on Windows).

### `Test-WinUserIsInRole <USER> -Role <ROLE>` / `Test-WinUserIsInRole -BuiltInRole <ROLE>`

Check if specified user is in role.
By default it's checking it against current user.

## Add-Memo.ps1 / Get-Memos.ps1

### `Add-Memo <SomeText>`

Add something you want to remember.

### `Get-Memos`

Get list of all the memos

## Confirm-XML.ps1

### `Confirm-XML <File>`

Validate that specified XML file is valid

## Convert-FromPowerShellToBatch.ps1 / Convert-FromPowerShellToSh.ps1

### `Convert-FromPowerShellToBatch <File>`

Convert specified PowerShell script into batch file calling powershell process with encoded command.

### `Convert-FromPowerShellToSh <File>`

Convert specified PowerShell script into sh file calling powershell process with encoded command.

## Get-ExchangeRate.ps1

### `Get-ExchangeRate <currency>`

Get exchange rates for specified currency. If not specified it's PLN.

## Get-ExeInformation.ps1

### `Get-ExeInformation <exe_file>`

Get information about version and other things from executable file.

## Get-Weather.ps1

### `Get-Weather <city>`

Get information as PowerShell object about weather in specified city.
If not specified it's Lodz.

### `Show-Weather <city>` / `Show-Weather -DefaultFormat` / `Show-Weather -V2Format`

Show information about weather in specified city in human readable way.
If not specified it's Lodz.
If no flags it's just current weather.
If DefaualFormat flag it's using default format of wttr.in showing weather for near days as well.
If V2Format flag it's using v2 format of wttr.in showing weather in a graph with more data.

## Invoke-WakeOnLan.ps1

### `Invoke-WakeOnLan <MAC_ADDR> <IP_ADDR>`

Sends wake on lan packet to specified machine.

## Start-Hibernation.ps1

### `Start-Hibernation`

Tries to hibernate the machine.

## Start-Timer.ps1

### `Start-Timer <seconds>`

Starts small countdown for specified number of seconds.
