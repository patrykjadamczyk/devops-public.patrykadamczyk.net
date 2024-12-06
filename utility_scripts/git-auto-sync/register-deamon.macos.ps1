#!/usr/bin/env pwsh
Write-Host -ForegroundColor Red "This script is not tested!!"
Read-Host -Prompt "Click any key to continue..."
# Define service parameters
$serviceParams = @{
    Label = "net.patrykadamczyk.GitAutoSyncPwshService"
    ProgramArguments = @("$(which pwsh)", "-NoProfile", "-File", "$PSScriptRoort/daemon.ps1")
    RunAtLoad = $true
    KeepAlive = $false
    StandardErrorPath = "/tmp/GitAutoSyncPwshService.log"
    StandardOutPath = "/tmp/GitAutoSyncPwshService.log"
}

# Generate plist file content
$plistContent = @"
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST  1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>$($serviceParams.Label)</string>
    <key>ProgramArguments</key>
    <array>
$(foreach ($arg in $serviceParams.ProgramArguments) { "<string>$arg</string>" })
    </array>
    <key>RunAtLoad</key>
    <$(if ($serviceParams.RunAtLoad) { "true" } else { "false" })/>
    <key>KeepAlive</key>
    <$(if ($serviceParams.KeepAlive) { "true" } else { "false" })/>
    <key>StandardErrorPath</key>
    <string>$($serviceParams.StandardErrorPath)</string>
    <key>StandardOutPath</key>
    <string>$($serviceParams.StandardOutPath)</string>
</dict>
</plist>
"@

# Set the path to the temporary plist file
$tempPlistPath = Join-Path $PSScriptRoot "$($serviceParams.Label).plist"

# Write the plist file content to the temporary file
Set-Content -Path $tempPlistPath -Value $plistContent

# Set the path to the LaunchAgents directory
$launchAgentsDir = Join-Path (Get-Location).Path "~/Library/LaunchAgents/"

# Copy the temporary plist file to the LaunchAgents directory with sudo
$tempPlistPathEscaped = [regex]::Escape($tempPlistPath)
Invoke-Expression -Command "sudo cp $tempPlistPathEscaped $launchAgentsDir"

# Delete the temporary plist file from the script directory
Remove-Item -Path $tempPlistPath

# Load the service into launchd and start it
Invoke-Expression -Command "launchctl load $launchAgentsDir$($serviceParams.Label).plist"
