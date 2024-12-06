Write-Host "Disabling TPM Check..."
If (!(Test-Path "HKLM:\SYSTEM\Setup\MoSetup")) {
    New-Item -Path "HKLM:\SYSTEM\Setup\MoSetup" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SYSTEM\Setup\MoSetup" -Name "AllowUpgradesWithUnsupportedTPM" -Type DWord -Value 1