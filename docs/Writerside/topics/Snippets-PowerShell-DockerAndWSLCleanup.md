# Docker And WSL Cleanup

## Code
```Console
#!/usr/bin/env pwsh
Read-Host -Prompt "Make sure you are running this script as administrator"
Write-Host "Cleaning up..."
Write-Host "1/3 - Cleaning up build cache of docker..."
docker builder prune
Read-Host -Prompt "Quit Docker Desktop"
wsl --shutdown
Write-Host "2/3 - Optimizing WSL Distros Disks..."
Write-Host "- 1/5 - Ubuntu"
Optimize-VHD -Path C:\Users\patry\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\LocalState\ext4.vhdx -Mode Full
Write-Host "- 2/5 - Ubuntu Preview"
Optimize-VHD -Path C:\Users\patry\AppData\Local\Packages\CanonicalGroupLimited.UbuntuPreview_79rhkp1fndgsc\LocalState\ext4.vhdx -Mode Full
Write-Host "- 3/5 - Ubuntu 22.04 LTS"
Optimize-VHD -Path C:\Users\patry\AppData\Local\Packages\CanonicalGroupLimited.Ubuntu22.04LTS_79rhkp1fndgsc\LocalState\ext4.vhdx -Mode Full
Write-Host "- 4/5 - Fedora Remix WSL"
Optimize-VHD -Path C:\Users\patry\AppData\Local\Packages\WhitewaterFoundryLtd.Co.FedoraRemixforWSLSL_zxdhfybd17krt\LocalState\ext4.vhdx -Mode Full
Write-Host "- 5/5 - Alpine WSL"
Optimize-VHD -Path C:\Users\patry\AppData\Local\Packages\36828agowa338.AlpineWSL_my43bytk1c4nr\LocalState\ext4.vhdx -Mode Full
Write-Host "3/3 - Optimizing Docker Distros Disks..."
Write-Host "- 1/2 - Data Disk"
Optimize-VHD -Path C:\Users\patry\AppData\Local\Docker\wsl\data\ext4.vhdx -Mode Full
Write-Host "- 2/2 - Distro Disk"
Optimize-VHD -Path C:\Users\patry\AppData\Local\Docker\wsl\distro\ext4.vhdx -Mode Full

### Additional Note
# If you have problem with installing WSL Distro make sure C:\Users\<USER>\AppData\Local\Packages\<DISTRO>\LocalState is not compressed in preferences
```

## What is this script doing?

- First, it tries to prune docker (Cleanup of docker)
- Then, it waits until you quit Docker Desktop and shutdowns WSL
- Then, it optimizes WSL distros disks (Trying to make them size they need to be, which can change based on usage, these disks expand with usage, but they are not made smaller if they should be)
- Finally, it tries to optimize special Docker disks (These are virtual distros disks that Docker Desktop uses)

## Additional Note
If you have a problem with installing WSL Distro, make sure `~\AppData\Local\Packages\<DISTRO>\LocalState` is not compressed in preferences