Write-Host "Running Disk Cleanup on Drive C:..."
cmd /c cleanmgr.exe /d C: /VERYLOWDISK
$WPFEssTweaksDiskCleanup.IsChecked = $false