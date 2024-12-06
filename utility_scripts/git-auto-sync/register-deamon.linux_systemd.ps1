#!/usr/bin/env pwsh
# Define service parameters
$serviceParams = @{
    Name = "GitAutoSyncPwshService"
    DisplayName = "Git Automatic Synchronisation Service using PowerShell Script"
    Description = "This is a service that runs a PowerShell script that automatically synchronizes configured Git repositories."
    Executable = (which pwsh)
    WorkingDirectory = "$PSScriptRoot"
    ScriptPath = "$PSScriptRoot/daemon.ps1"
}

# Generate systemd service unit file content
$serviceContent = @"
[Unit]
Description=$($serviceParams.Description)
After=network.target

[Service]
Type=simple
User=$env:USER
WorkingDirectory=$($serviceParams.WorkingDirectory)
ExecStart=$($serviceParams.Executable) -NoProfile -File $($serviceParams.ScriptPath)
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
"@

# Set the path to the systemd service directory
$serviceDir = "/etc/systemd/system/"
$tempServiceFilePath = Join-Path $PSScriptRoot "$($serviceParams.Name).service"
$serviceFilePath = "$serviceDir/$($serviceParams.Name).service"

# Create the service unit file
Set-Content -Path $tempServiceFilePath -Value $serviceContent

# Copy the temporary service unit file to the systemd service directory with sudo
sudo cp $tempServiceFilePath $serviceFilePath

# Delete the temporary service unit file from the script directory
Remove-Item -Path $tempServiceFilePath

# Reload the systemd daemon to recognize the new service
sudo systemctl daemon-reload

# Enable the service to start on boot
sudo systemctl enable $serviceParams.Name

# Start the service immediately
sudo systemctl start $serviceParams.Name
