#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Wakes up a computer using Wake-on-LAN
.DESCRIPTION
    This PowerShell script sends a magic UDP packet to a computer to wake him up (requires the target computer to have Wake-on-LAN activated).
.PARAMETER MACaddress
    Specifies the host's MAC address (e.g. 11:22:33:44:55:66)
.PARAMETER IPaddress
    Specifies the host's IP address or subnet address (e.g. 192.168.0.255)
.PARAMETER Port
    Specifies the UDP port (9 by default)
.PARAMETER NumRetries
    Specifies number of retries (3 by default)
.EXAMPLE
    PS> Invoke-WakeOnLan 11:22:33:44:55:66 192.168.100.100
.LINK
    https://github.com/fleschutz/PowerShell
    https://github.com/fleschutz/PowerShell/blob/adca1ca2f7e8303e47e65830db6045aec9be5f6b/scripts/wake-up.ps1
.NOTES
    Author: Markus Fleschutz | License: CC0
    Changes: Patryk Adamczyk
#>
function Global:Invoke-WakeOnLan([string]$MACaddress = "", [string]$IPaddress = "", [int]$Port=9, [int]$NumRetries=3) {
    function Send-WOL { param([string]$mac, [string]$ip, [int]$port) 
        $broadcast = [Net.IPAddress]::Parse($ip) 

        $mac=(($mac.replace(":","")).replace("-","")).replace(".","") 
        $target=0,2,4,6,8,10 | ForEach-Object {[convert]::ToByte($mac.substring($_,2),16)} 
        $packet = (,[byte]255 * 6) + ($target * 16) 

        $UDPclient = New-Object System.Net.Sockets.UdpClient 
        $UDPclient.Connect($broadcast,$port) 
        [void]$UDPclient.Send($packet, 102)  
    } 

    try {
        if ($MACaddress -eq "" ) {
            $MACaddress = Read-Host "Enter the host's MAC address, e.g. 11:22:33:44:55:66"
        }
        if ($IPaddress -eq "" ) {
            $IPaddress = Read-Host "Enter the host's IP or subnet address, e.g. 192.168.0.255"
        }

        Send-WOL $MACaddress $IPaddress $Port
        for ($i = 0; $i -lt $NumRetries; $i++) {
            Start-Sleep -milliseconds 100
            Send-WOL $MACaddress $IPaddress $Port
        }
        Write-Host "✔️ sent magic packet with MAC $MACaddress to IP $IPaddress on port $Port as wakeup call ($($NumRetries + 1) times)"
        Write-Host "   (Hint: wait a minute until the computer fully boots up)"
} catch {
        Write-Error "⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
    }
}
