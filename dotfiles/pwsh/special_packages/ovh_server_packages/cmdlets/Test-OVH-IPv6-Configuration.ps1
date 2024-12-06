#!/bin/env pwsh

function Global:Test-OVH-IPv6-Configuration
{
<#
.SYNOPSIS
    Test-OVH-IPv6-Configuration
.DESCRIPTION
	Configure IPv6 Networking for testing [Linux only]
.PARAMETER  IPv6Address
	IPv6 Address for machine from OVH Panel
.PARAMETER  IPv6GatewayAddress
	IPv6 Gateway Address for machine from OVH Panel
.PARAMETER  InterfaceName
	Interface that have to be changed (That have correct IPv4 set)
.PARAMETER  IPv6Prefix
	IPv6 Prefix for machine from OVH Panel if it's there (as part of IPv6 Address) or 128 (which is default) if there isn't one
.EXAMPLE
	PS \> Test-OVH-IPv6-Configuration -IPv6Address "0000:0000:0000:0000:0000:0000:0000:0000" -IPv6GatewayAddress "0000:0000:0000:0000:0000:0000:0000:0001" -InterfaceName ens0 -IPv6Prefix 128
#>

	[CmdletBinding()]
	param(
		[Parameter(Position=0, Mandatory=$true)]
		[string]
		$IPv6Address,
		[Parameter(Position=1, Mandatory=$true)]
		[string]
		$IPv6GatewayAddress,
		[Parameter(Position=2, Mandatory=$true)]
		[string]
		$InterfaceName,
		[Parameter(Position=3, Mandatory=$false)]
		[Int16]
		$IPv6Prefix
	)
    process {
		$isLinux = [System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Linux);
		if (!$isLinux) {
			Write-Host "This cmdlet is available only on Linux".
			return;
		}
		if ($IPv6Prefix -eq $null) {
			$_IPv6Prefix = 128;
		} else {
			$_IPv6Prefix = $IPv6Prefix;
		}

		ip addr add "${IPv6Address}/${_IPv6Prefix}" dev $InterfaceName
		ip -6 route add $IPv6GatewayAddress dev $InterfaceName
		ip -6 route add default via $IPv6GatewayAddress dev $InterfaceName
    }
}