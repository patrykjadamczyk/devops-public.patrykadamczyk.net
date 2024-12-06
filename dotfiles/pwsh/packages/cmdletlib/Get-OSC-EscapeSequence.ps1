#!/usr/bin/env pwsh

function Get-ANSI-EscapeSequence(
    [Parameter(Position = 0, Mandatory = $true)]
    [string]$text
) {
    $ansi_escape = [char]27
    return "$ansi_escape$text"
}

function Get-Bell-EscapeSequence() {
    $escape = [char]7
    return "$escape"
}

function Get-StringTerminator-EscapeSequence() {
    $escape = [char]156
    return "$escape"
}

function Get-CSI-EscapeSequence(
    [Parameter(Position = 0, Mandatory = $true)]
    [int]$CSI_Code,
    [Parameter(Position = 1, Mandatory = $true)]
    [string]$text
) {
    $escape = [char]155
    return "$escape$CSI_Code$text"
}

function Get-DCS-EscapeSequence(
    [Parameter(Position = 0, Mandatory = $true)]
    [int]$DCS_Code,
    [Parameter(Position = 1, Mandatory = $true)]
    [string]$text
) {
    $escape = [char]144
    return "$escape$DCS_Code$text"
}

function Get-OSC-EscapeSequence(
    [Parameter(Position = 0, Mandatory = $true)]
    [int]$OSC_Code,
    [Parameter(Position = 1, Mandatory = $true)]
    [string]$text
) {
    $ansi_escape = [char]27
    return "$ansi_escape]$OSC_Code;$text"
}
