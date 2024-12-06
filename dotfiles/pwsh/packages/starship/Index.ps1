#!/usr/bin/env pwsh

# WezTerm Dir
$_prompt = ""
function Invoke-Starship-PreCommand {
    # Set Correct Working Directory in WezTerm (or anything that supports OSC Escapes)
    $current_location = $executionContext.SessionState.Path.CurrentLocation
    if ($current_location.Provider.Name -eq "FileSystem") {
        $ansi_escape = [char]27
        $provider_path = $current_location.ProviderPath -replace "\\", "/"
        # Get Computern name in a way that works cross-platform ($env:COMPUTERNAME is not cross-platform)
        $computerName = [System.Net.Dns]::GetHostName()
        $_prompt = "$ansi_escape]7;file://${computerName}/${provider_path}$ansi_escape\"
    }
    $host.ui.Write($_prompt)
    # Set Env:PWD with current working directory
    $env:PWD=Get-Location
    # Set Title
    $title = $host.UI.RawUI.WindowTitle
    if ([System.String]::IsNullOrWhiteSpace($title)) { # If empty (when pwsh starts for example)
        $host.ui.RawUI.WindowTitle = "$pwd"
    } elseif ($title.StartsWith("/")) { # If Path Unix
        $host.ui.RawUI.WindowTitle = "$pwd"
    } elseif ($title -match "^[a-zA-Z]:\\") { # If Path Windows
        $host.ui.RawUI.WindowTitle = "$pwd"
    } elseif ($title -match "^[a-zA-Z]+:\/") { # If Path Provider
        $host.ui.RawUI.WindowTitle = "$pwd"
    }
}

# Starship assumes UTF-8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

function global:prompt2 {
    Invoke-Starship-PreCommand
    $out = $null
    # @ makes sure the result is an array even if single or no values are returned
    $jobs = @(Get-Job | Where-Object { $_.State -eq 'Running' }).Count

    if ($lastCmd = Get-History -Count 1) {
        $duration = [math]::Round(($lastCmd.EndExecutionTime - $lastCmd.StartExecutionTime).TotalSeconds)
        # & ensures the path is interpreted as something to execute
        $out = @(&starship prompt --status=$lastexitcode --jobs=$jobs --cmd-duration=$duration)
    } else {
        $out = @(&starship prompt --status=$lastexitcode --jobs=$jobs)
    }

    # Convert stdout (array of lines) to expected return type string
    # `n is an escaped newline
    $out -join "`n"
}
$ENV:STARSHIP_SHELL = "powershell"

Invoke-Expression (&starship init powershell)

$_promptFunction = $function:prompt
function global:prompt {
    $current_location = $executionContext.SessionState.Path.CurrentLocation
    if ($current_location.Provider.Name -eq "FileSystem") {
        & $_promptFunction
    } else {
        prompt2
    }
}
