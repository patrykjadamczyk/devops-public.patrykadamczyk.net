#!/usr/bin/env pwsh
if($IsWindows) {
    Write-Output "Windows is not supported for Ansible!"
    exit 1
}
$AnsiblePath = Join-Path $PSScriptRoot ".."
# Debian Based
# For Ansible and PWBS
Write-Output "Installing Python 3"
sudo apt install python3 python3-pip
# For Ansible
Write-Output "Installing Ansible"
sudo apt install ansible
# For Small automation of ansible commands
Write-Output "Installing PWBS"
python3 -m pip install pwbs
# Installing functions
Write-Output "Installing helper functions"
Write-Output ". $AnsiblePath/functions.ps1" | Out-File $profile -Append
. "$AnsiblePath/functions.ps1"
