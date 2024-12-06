# My Cmdlet Library

## Package-Manager.ps1

### `Get-Status-<PackageManager>-Package-Manager`

Checks status of specified package manager

### `Install-<PackageManager>-Package <package>`

Install specified package using specified package manager

### `Update-<PackageManager>-Package-Database`

Update package database using specified package manager

### `Update-<PackageManager>-Package <package>`

Update specified package using specified package manager

### `Remove-<PackageManager>-Package <package>`

Remove specified package using specified package manager

### `Update-All-<PackageManager>-Packages`

Update all packages using specified package manager

### `Install-<PackageManager>-Package-Repository <repo>`

Add specified package repository to specified package manager

### `Install-System-Package <package> <flags>`

Install system package using specified package managers through flags

### `Update-System-Package-Database <flags>`

Update system package database using specified package managers through flags

### `Update-System-Package <package> <flags>`

Update specified system package using specified package managers through flags

### `Remove-System-Package <package> <flags>`

Remove specified system package using specified package managers through flags

### `Update-All-System-Packages`

Update all system packages using detected package managers

## Restart-Session.ps1

### `Restart-Session`

Restart current session of PowerShell

## Run-DockerShellImage.ps1

### `Run-DockerShellImage <dist> <shell>`

Run specified distribution with specified shell using docker

## Translate.ps1

### `Translate <text>` / `Translate <text> <from> <to>`

Translate specified text from specified language (default en) to specified language (default pl).
This is using terraprint.co API.

## Use-WSL.ps1

### `Invoke-InWSL <function> <dist> <no_profile>`

Runs specified function in powershell inside WSL.

### `Use-WSL <function> <dist>`

Runs specified function inside WSL using temp files to store functions.
