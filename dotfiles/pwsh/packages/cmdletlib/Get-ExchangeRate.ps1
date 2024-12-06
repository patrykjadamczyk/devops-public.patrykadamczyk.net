#!/usr/bin/env pwsh
function Global:Get-ExchangeRate(
    [string]$currency = "PLN"
) {
    [xml]$ExchangeRates = (invoke-webRequest -uri "http://www.floatrates.com/daily/$($currency).xml" -userAgent "curl" -useBasicParsing).Content
    $ExchangeRatesList = $ExchangeRates.channel.item | ForEach-Object {
        New-Object PSObject -property @{
            'Rate' = "$($_.exchangeRate)";
            'Currency' = "$($_.targetCurrency) - $($_.targetName)";
            'Inverse' = "$($_.inverseRate)";
            'Date' = "$($_.pubDate)"
        }
    }
    Write-Host "Current Exchange Rates for 1 $currency (source: http://www.floatrates.com)"
    Write-Host "================================"
    $ExchangeRatesList | Format-Table -property Rate,Currency,Inverse,Date
}
