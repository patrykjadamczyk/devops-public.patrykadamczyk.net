#!/usr/bin/env pwsh
<#
.SYNOPSIS
	Lists your memo entries
.DESCRIPTION
	This PowerShell script lists all memo entries in Memos.csv in your home folder.
.EXAMPLE
	PS> Get-Memos
.LINK
	https://github.com/fleschutz/PowerShell
    https://github.com/fleschutz/PowerShell/blob/828e741c74251129724ce9df99c97d83b53f1fa3/scripts/list-memos.ps1
.NOTES
	Author: Markus Fleschutz | License: CC0
    Changes: Patryk Adamczyk
#>
function Global:Get-Memos {
    try {
        $Path = "~/Memos.csv"
        if (Test-Path "$Path" -pathType leaf) {
            Write-Progress "Reading $Path ..."
            $Table = Import-CSV "$Path"
            Write-Progress -completed "Reading $Path"

            Write-Host ""
            Write-Host "Time                  Text"
            Write-Host "----                  ----"
            foreach($Row in $Table) {
                $Time = $Row.Time
                $Text = $Row.Text
                "$Time  $Text"
            }
        } else {
            Write-Warning "Sorry, no memos saved yet"
            return
        }
    } catch {
        Write-Error "⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
    }
}
