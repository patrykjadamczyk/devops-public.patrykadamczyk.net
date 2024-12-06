Write-Host "Installing Scoop"
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex
Write-Host "Installing Chocolatey"
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
Write-Host "Installing git"
scoop install git
Write-Host "Adding buckets to scoop"
"main extras versions nirsoft sysinternals nerd-fonts nonportable".Split(" ") | ForEach-Object { scoop bucket add $_ }
Write-Host "Installing dependencies"
scoop install ripgrep neovim-nightly starship wezterm pwsh extras/vcredist2022 extras/processhacker sudo fzf
Write-Host "Installing fonts"
scoop install IosevkaTerm-NF IosevkaTerm-NF-Mono IosevkaTerm-NF-Propo
Write-Host "Enable Developer Mode for symlinks"
Show-WindowsDeveloperLicenseRegistration
