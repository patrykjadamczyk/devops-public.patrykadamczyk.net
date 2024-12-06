#!/usr/bin/env nu

def --env "Check-SSLCertificate" [
    $Address: string
] {
    pwsh -Command $"Check-SSLCertificate ($Address)"
}

def --env "Confirm-Xml" [
    $file: string
] {
    pwsh -Command $"Confirm-Xml ($file)"
}

def --env "Get-ExchangeRate" [
    $currency: string = "PLN"
] {
    pwsh -Command $"Get-ExchangeRate ($currency)"
}

def --env "Get-ExeInformation" [
    $Path: string
] {
    pwsh -Command $"Get-ExeInformation ($Path)"
}

def --env "Get-WhoIs" [
    $IPAddress: string
] {
    pwsh -Command $"Get-WhoIs ($IPAddress)"
}

def --env "Invoke-WakeOnLan" [
    $MACAddress: string = "",
    $IPAddress: string = "",
    $Port: int = 9,
    $NumRetries: int = 3
] {
    pwsh -Command $"Invoke-WakeOnLan ($MACAddress) ($IPAddress) ($Port) ($NumRetries)"
}

def --env "Test-Is64Bit" [] {
    return ((pwsh -NoProfile -Command "[IntPtr]::Size -eq 8") == "True")
}
