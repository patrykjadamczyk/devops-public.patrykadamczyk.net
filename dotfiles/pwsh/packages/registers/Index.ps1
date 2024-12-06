#!/usr/bin/env pwsh
# This concept is based on: https://github.com/cal2195/q

. "$PSScriptRoot\..\cmdletlib\Get-OS.ps1"
. "$PSScriptRoot\..\cmdletlib\Test-Command.ps1"
. "$PSScriptRoot\registers\Index.ps1"

function Global:Q(
    [Parameter(Position=0, Mandatory=$true)]
    [string]$Register,
    [Parameter(Position=1,ValueFromRemainingArguments)]
    [string[]]$CommandToSaveExploded
) {
    $CommandToSave = [System.String]::Join(" ", $CommandToSaveExploded)
    $OS = Get-OS
    $RegisterDirPath = Join-Path $PSScriptRoot "registers" $OS

    if (!(Test-Path $RegisterDirPath)) {
        Write-Error "Register Directory $RegisterDirPath not found";
        return;
    }

    if (!($Register -match "^[a-zA-Z0-9]*$")) {
        Write-Error "Invalid Register name: $Register. Make sure that it's alphanumeric.";
        return;
    }

    $RegisterPath = Join-Path $RegisterDirPath "$Register.ps1"

$generatedRegisterFunction = @"
#!/usr/bin/env pwsh
function Global:q-$Register {
    $CommandToSave
}
"@
    Write-Host "Generating function q-$Register with content: $CommandToSave"
    Set-Content -Path $RegisterPath -Value $generatedRegisterFunction
    Write-Host "Applying register function to current shell"
    . "$RegisterPath"
}

function Global:U(
    [Parameter(Position=0, Mandatory=$true)]
    [string]$Register
) {
    $OS = Get-OS
    $RegisterDirPath = Join-Path $PSScriptRoot "registers" $OS

    if (!(Test-Path $RegisterDirPath)) {
        Write-Error "Register Directory $RegisterDirPath not found";
        return;
    }

    if (!($Register -match "^[a-zA-Z0-9]*$")) {
        Write-Error "Invalid Register name: $Register. Make sure that it's alphanumeric.";
        return;
    }

    $RegisterPath = Join-Path $RegisterDirPath "$Register.ps1"

    if (Test-Path $RegisterPath) {
        Remove-Item $RegisterPath
    }

    Remove-Item "Function:\q-$Register" -ErrorAction SilentlyContinue

    Write-Host "Removed register $Register"
}

function Global:q- {
    $OS = Get-OS
    $RegisterDirPath = Join-Path $PSScriptRoot "registers" $OS

    if (!(Test-Path $RegisterDirPath)) {
        Write-Error "Register Directory $RegisterDirPath not found";
        return;
    }

    Write-Host "Listing Registers:"
    if (Test-Command bat) {
        Get-ChildItem $RegisterDirPath/*.ps1 | ForEach-Object { bat -P $_.FullName }
    } else {
        Get-ChildItem $RegisterDirPath/*.ps1 | ForEach-Object { Get-Content $_.FullName }
    }
}
