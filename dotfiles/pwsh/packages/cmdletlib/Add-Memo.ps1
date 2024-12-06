#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Adds a memo text 
.DESCRIPTION
    This PowerShell script saves the given memo text to Memos.csv in your home folder.
.PARAMETER text
    Specifies the text to memorize
.EXAMPLE
    PS> Add-Memo "Buy apples"
    ✔️ saved to 📄/home/markus/Memos.csv
.LINK
    https://github.com/fleschutz/PowerShell
    https://github.com/fleschutz/PowerShell/blob/828e741c74251129724ce9df99c97d83b53f1fa3/scripts/add-memo.ps1
.NOTES
    Author: Markus Fleschutz | License: CC0
    Changes: Patryk Adamczyk
#>
function Global:Add-Memo([string]$text = "") {
    try {
        if ($text -eq "" ) {
            $text = Read-Host "Enter the text to memorize"
        }

        $Path = "~/Memos.csv"
        $Time = Get-Date -format FileDateTimeUniversal
        $Line = "$Time,$text"

        if (-not(Test-Path "$Path" -pathType leaf)) {
            Write-Output "TIME,TEXT" > "$Path"
        }
        Write-Output $Line >> "$Path"

        Write-Host "✔️ saved to 📄$Path"
    } catch {
        Write-Host "⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
    }
}
