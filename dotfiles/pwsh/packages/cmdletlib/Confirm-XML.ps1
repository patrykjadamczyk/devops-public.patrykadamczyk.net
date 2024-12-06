#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Checks the given XML file for validity
.DESCRIPTION
    This PowerShell script checks the given XML file for validity.
.PARAMETER file
    Specifies the path to the XML file to check
.EXAMPLE
    PS> Confirm-Xml myfile.xml
    ✔️ XML file is valid
.LINK
    https://github.com/fleschutz/PowerShell
    https://github.com/fleschutz/PowerShell/blob/adca1ca2f7e8303e47e65830db6045aec9be5f6b/scripts/check-xml-file.ps1
.NOTES
    Author: Markus Fleschutz | License: CC0
    Changes: Patryk Adamczyk
#>
function Global:Confirm-Xml([string]$file = "") {
    try {
        if ($file -eq "" ) {
            $file = Read-Host "Enter path to XML file"
        }

        $XmlFile = Get-Item $file
        
        $script:ErrorCount = 0
        
        # Perform the XSD Validation
        $ReaderSettings = New-Object -TypeName System.Xml.XmlReaderSettings
        $ReaderSettings.ValidationType = [System.Xml.ValidationType]::Schema
        $ReaderSettings.ValidationFlags = [System.Xml.Schema.XmlSchemaValidationFlags]::ProcessInlineSchema -bor [System.Xml.Schema.XmlSchemaValidationFlags]::ProcessSchemaLocation
        $ReaderSettings.add_ValidationEventHandler({ $script:ErrorCount++ })
        $Reader = [System.Xml.XmlReader]::Create($XmlFile.FullName, $ReaderSettings)
        while ($Reader.Read()) { }
        $Reader.Close()
        
        if ($script:ErrorCount -gt 0) {
            Write-Error "Invalid XML file"
            return
        } 

        Write-Host "✔️ XML file is valid"
    } catch {
        Write-Error "⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
    }
}
