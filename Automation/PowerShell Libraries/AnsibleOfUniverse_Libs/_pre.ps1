#!/usr/bin/env pwsh
$AnsiblePath = Join-Path $PSScriptRoot ".."
$localEnvFile = Join-Path $AnsiblePath ".env"
if (Test-Path $localEnvFile) {
    if($Global:PreviousDir -eq (Get-Location).Path){
        Write-Verbose "Set-PsEnv:Skipping same dir"
        return
    } else {
        $Global:PreviousDir = (Get-Location).Path
    }

    #return if no env file
    if (!( Test-Path $localEnvFile)) {c
        Write-Verbose "No .env file"
        return
    }

    #read the local env file
    $content = Get-Content $localEnvFile -ErrorAction Stop
    Write-Verbose "Parsed .env file"

    #load the content to environment
    foreach ($line in $content) {

        if([string]::IsNullOrWhiteSpace($line)){
            Write-Verbose "Skipping empty line"
            continue
        }

        #ignore comments
        if($line.StartsWith("#")){
            Write-Verbose "Skipping comment: $line"
            continue
        }

        #get the operator
        if($line -like "*:=*"){
            Write-Verbose "Prefix"
            $kvp = $line -split ":=",2
            $key = $kvp[0].Trim()
            $value = "{0};{1}" -f  $kvp[1].Trim(),[System.Environment]::GetEnvironmentVariable($key)
        }
        elseif ($line -like "*=:*"){
            Write-Verbose "Suffix"
            $kvp = $line -split "=:",2
            $key = $kvp[0].Trim()
            $value = "{1};{0}" -f  $kvp[1].Trim(),[System.Environment]::GetEnvironmentVariable($key)
        }
        else {
            Write-Verbose "Assign"
            $kvp = $line -split "=",2
            $key = $kvp[0].Trim()
            $value = $kvp[1].Trim()
        }

        Write-Verbose "$key=$value"
        [Environment]::SetEnvironmentVariable($key, $value, "Process") | Out-Null
    }
}
$AnsibleConfig = Join-Path $AnsiblePath "etc" "ansible" "ansible.cfg"

Set-Item -Path "Env:ANSIBLE_CONFIG" -Value $AnsibleConfig
[Environment]::SetEnvironmentVariable("ANSIBLE_CONFIG", $AnsibleConfig, "Process") | Out-Null