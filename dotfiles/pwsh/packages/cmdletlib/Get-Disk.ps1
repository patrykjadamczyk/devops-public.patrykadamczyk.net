#!/bin/env pwsh

function Global:Get-Disk {
    return [System.IO.DriveInfo]::getdrives()
}