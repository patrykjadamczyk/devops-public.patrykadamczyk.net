Write-Host "Creating Restore Point in case something bad happens"
Enable-ComputerRestore -Drive "$env:SystemDrive"
Checkpoint-Computer -Description "RestorePoint1" -RestorePointType "MODIFY_SETTINGS"