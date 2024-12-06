#!/usr/bin/env pwsh
# Debug Variable
$Debug = $false
# Get Configuration
$configPath = Join-Path $PSScriptRoot "config.json"
$config = Get-Content -Path $configPath | ConvertFrom-Json
# Get Log Path
$logOutPath = Join-Path $PSScriptRoot "deamon_out.log"
$logErrPath = Join-Path $PSScriptRoot "deamon_err.log"
# Get Repositories
$configRepos = $config.repositories;
if ($null -eq $configRepos) {
    Write-Error "Repositories not found in configuration"
    return $null
}
# List of Watchers
$watchers = @()
# Watch all repos
foreach ($repoConfig in $configRepos) {
    $repo = $repoConfig.path
    $repoFilter = $repoConfig.filter
    # Config
    Write-Host "Starting watching on repository:"
    Write-Host "Path: $repo"
    Write-Host "Filter: $repoFilter"
    # Create a new FileSystemWatcher object
    $watcher = New-Object System.IO.FileSystemWatcher

    # Change possibly relative path to absolute path
    $repoPath = Resolve-Path $repo

    # Set the directory to watch
    $watcher.Path = $repoPath

    # Set the file to watch
    $watcher.Filter = $repoFilter

    # Watch Subdirectories
    $watcher.IncludeSubdirectories = $true

    # Add Scope Message Data
    $messageData = New-Object PSObject -Property @{
        Repo = $repo
        LogPathOut = $logOutPath
        LogPathErr = $logErrPath
    }

    # Set the event to trigger when the file is changed
    # $watcher.Changed.Add({
    Register-ObjectEvent $watcher Changed -Action {
        # Add data from scope through message data
        $repo = $Event.MessageData.Repo
        $logPathOut = $Event.MessageData.LogPathOut
        $logPathErr = $Event.MessageData.LogPathErr
        # Command itself
        pwsh -NoProfile -WorkingDirectory $repo -Command 'pwd;git add -A;git commit -am "Git Automatic Synchronisation";git push'  1>> $logPathOut 2>> $logPathErr
    } -MessageData $messageData
    # })

    # Start watching
    $watcher.EnableRaisingEvents = $true
    # Add watcher to list of watchers
    $watchers += $watcher
}

# Keep the script running
while ($true) {
    if ($Debug) {
        Get-Job
    }
    Start-Sleep -Seconds 1
}
