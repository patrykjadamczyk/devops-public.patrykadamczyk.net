$dns_to_set_to = "Google";
If ( $dns_to_set_to -eq 'Google' ) {
    Write-Host "Setting DNS to Google for all connections..."
    $DC = "8.8.8.8"
    $Internet = "8.8.4.4"
    $dns = "$DC", "$Internet"
    $Interfaces = [System.Management.ManagementClass]::new("Win32_NetworkAdapterConfiguration").GetInstances()
    $Interfaces.SetDNSServerSearchOrder($dns) | Out-Null
}
If ( $dns_to_set_to -eq 'Cloud Flare' ) {
    Write-Host "Setting DNS to Cloud Flare for all connections..."
    $DC = "1.1.1.1"
    $Internet = "1.0.0.1"
    $dns = "$DC", "$Internet"
    $Interfaces = [System.Management.ManagementClass]::new("Win32_NetworkAdapterConfiguration").GetInstances()
    $Interfaces.SetDNSServerSearchOrder($dns) | Out-Null
}
If ( $dns_to_set_to -eq 'Level3' ) {
    Write-Host "Setting DNS to Level3 for all connections..."
    $DC = "4.2.2.2"
    $Internet = "4.2.2.1"
    $dns = "$DC", "$Internet"
    $Interfaces = [System.Management.ManagementClass]::new("Win32_NetworkAdapterConfiguration").GetInstances()
    $Interfaces.SetDNSServerSearchOrder($dns) | Out-Null
}
If ( $dns_to_set_to -eq 'Open DNS' ) {
    Write-Host "Setting DNS to Open DNS for all connections..."
    $DC = "208.67.222.222"
    $Internet = "208.67.220.220"
    $dns = "$DC", "$Internet"
    $Interfaces = [System.Management.ManagementClass]::new("Win32_NetworkAdapterConfiguration").GetInstances()
    $Interfaces.SetDNSServerSearchOrder($dns) | Out-Null
}