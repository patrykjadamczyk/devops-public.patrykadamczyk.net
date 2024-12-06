#!/usr/bin/env pwsh
# Based on https://github.com/fleschutz/PowerShell/blob/adca1ca2f7e8303e47e65830db6045aec9be5f6b/scripts/convert-ps2bat.ps1
<#
.SYNOPSIS
    Converts PowerShell scripts to batch files
.DESCRIPTION
    This PowerShell script converts one or more PowerShell scripts to .bat batch files.
.PARAMETER Path
    Specifies the file
.EXAMPLE
    PS> Convert-FromPowerShellToBatch test.ps1
#>
function Global:Convert-FromPowerShellToBatch(
    [Parameter(Mandatory,ValueFromPipeline,ValueFromPipelineByPropertyName)]
    [string]
    [Alias("FullName")]
    $Path
) {
    if ($Path -eq "") {
        $Path = Read-Host "Enter path to the PowerShell script(s)"
    }
    $encoded = [Convert]::ToBase64String(
        [System.Text.Encoding]::Unicode.GetBytes(
            (Get-Content -Path $Path -Raw -Encoding UTF8)
        )
    )
    $newPath = [Io.Path]::ChangeExtension($Path, ".bat")
    "@echo off`npowershell.exe -NoExit -encodedCommand $encoded" | Set-Content -Path $newPath -Encoding Ascii
}
