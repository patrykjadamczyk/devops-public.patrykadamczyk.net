# PowerShell Random Snippets

## PowerShell Shebang

```Console
#!/usr/bin/env pwsh
```

## Get Network Interfaces

```Console

[Net.NetworkInformation.NetworkInterface]::GetAllNetworkInterfaces() |
    Where-Object { $_.OperationalStatus -eq 'Up' -and $_.NetworkInterfaceType -ne 'Loopback' } |
    ForEach-Object { $_.GetIPProperties() } |
    Select-Object -ExpandProperty UnicastAddresses  |
    Select-Object -ExpandProperty Address |
    Where-Object {
        if( $PSCmdlet.ParameterSetName -eq 'NonFiltered' )
        {
            return ($_.AddressFamily -eq 'InterNetwork' -or $_.AddressFamily -eq 'InterNetworkV6')
        }

        if( $_.AddressFamily -eq 'InterNetwork' -or $_.AddressFamily -eq 'InterNetworkV6' )
        {
            return $true
        }

        return $false
    }
```