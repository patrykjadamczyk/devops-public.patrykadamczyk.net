# PowerShell Profile Tries

## Try Code 1

```Console
#!/usr/bin/env pwsh

Write-Host -ForegroundColor Green "Loading PowerShell Profile File..."
Start-Sleep 0.1
$__maxBaseSteps = 6;
Write-Progress -Id 1 -Activity "Loading PowerShell Profile File" -Status "1. Initialization" -PercentComplete ((1/$__maxBaseSteps)*100) -CurrentOperation "Loading ..."
Start-Sleep 0.1
Write-Progress -Id 1 -Activity "Loading PowerShell Profile File" -Status "2. Alf Aliases" -PercentComplete ((2/$__maxBaseSteps)*100) -CurrentOperation "Loading ..."
Start-Sleep 0.1
Write-Progress -Id 1 -Activity "Loading PowerShell Profile File" -Status "3. Cmdlet Library" -PercentComplete ((3/$__maxBaseSteps)*100) -CurrentOperation "Loading ..."
Start-Sleep 0.1
$__maxSteps = 15;
Write-Progress -Id 2 -Activity "Loading Cmdlet Library" -Status "Convert-FromHumanReadableBytes" -PercentComplete ((1/$__maxSteps)*100) -CurrentOperation "Loading ..."
Start-Sleep 0.1
Write-Progress -Id 2 -Activity "Loading Cmdlet Library" -Status "Convert-FromHumanReadableBytesBinary" -PercentComplete ((2/$__maxSteps)*100) -CurrentOperation "Loading ..."
Start-Sleep 0.1
Write-Progress -Id 2 -Activity "Loading Cmdlet Library" -Status "Format-FileSize" -PercentComplete ((3/$__maxSteps)*100) -CurrentOperation "Loading ..."
Start-Sleep 0.1
Write-Progress -Id 2 -Activity "Loading Cmdlet Library" -Status "Format-FileSizeBinary" -PercentComplete ((4/$__maxSteps)*100) -CurrentOperation "Loading ..."
Start-Sleep 0.1
Write-Progress -Id 2 -Activity "Loading Cmdlet Library" -Status "Get-Disk" -PercentComplete ((5/$__maxSteps)*100) -CurrentOperation "Loading ..."
Start-Sleep 0.1
Write-Progress -Id 2 -Activity "Loading Cmdlet Library" -Status "Get-WhoIs" -PercentComplete ((6/$__maxSteps)*100) -CurrentOperation "Loading ..."
Start-Sleep 0.1
Write-Progress -Id 2 -Activity "Loading Cmdlet Library" -Status "Test-IsElevated" -PercentComplete ((7/$__maxSteps)*100) -CurrentOperation "Loading ..."
Start-Sleep 0.1
Write-Progress -Id 2 -Activity "Loading Cmdlet Library" -Status "Test-Is64Bit" -PercentComplete ((8/$__maxSteps)*100) -CurrentOperation "Loading ..."
Start-Sleep 0.1
Write-Progress -Id 2 -Activity "Loading Cmdlet Library" -Status "Test-IsLinux" -PercentComplete ((9/$__maxSteps)*100) -CurrentOperation "Loading ..."
Start-Sleep 0.1
Write-Progress -Id 2 -Activity "Loading Cmdlet Library" -Status "Test-IsMacOS" -PercentComplete ((10/$__maxSteps)*100) -CurrentOperation "Loading ..."
Start-Sleep 0.1
Write-Progress -Id 2 -Activity "Loading Cmdlet Library" -Status "Test-IsWindows" -PercentComplete ((11/$__maxSteps)*100) -CurrentOperation "Loading ..."
Start-Sleep 0.1
Write-Progress -Id 2 -Activity "Loading Cmdlet Library" -Status "Test-WinUserIsInRole" -PercentComplete ((12/$__maxSteps)*100) -CurrentOperation "Loading ..."
Start-Sleep 0.1
Write-Progress -Id 2 -Activity "Loading Cmdlet Library" -Status "Test-UnixUserIsInRole" -PercentComplete ((13/$__maxSteps)*100) -CurrentOperation "Loading ..."
Start-Sleep 0.1
Write-Progress -Id 2 -Activity "Loading Cmdlet Library" -Status "Test-IsUserAdministrator" -PercentComplete ((14/$__maxSteps)*100) -CurrentOperation "Loading ..."
Start-Sleep 0.1
Write-Progress -Id 2 -Activity "Loading Cmdlet Library" -Status "Check-SSLCertificate" -PercentComplete ((15/$__maxSteps)*100) -CurrentOperation "Loading ..."
Start-Sleep 0.1
Write-Progress -Id 2 -Activity "Loading Cmdlet Library" -Completed
Start-Sleep 0.1
Write-Progress -Id 1 -Activity "Loading PowerShell Profile File" -Status "4. My Cmdlet Library" -PercentComplete ((4/$__maxBaseSteps)*100) -CurrentOperation "Loading ..."
Start-Sleep 0.1
Write-Progress -Id 1 -Activity "Loading PowerShell Profile File" -Status "5. Profile Scripts" -PercentComplete ((5/$__maxBaseSteps)*100) -CurrentOperation "Loading ..."
Start-Sleep 0.1
Write-Progress -Id 1 -Activity "Loading PowerShell Profile File" -Status "6. Finishing" -PercentComplete ((6/$__maxBaseSteps)*100) -CurrentOperation "Loading ..."
Start-Sleep 0.1
```