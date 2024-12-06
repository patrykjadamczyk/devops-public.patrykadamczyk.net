#!/usr/bin/env pwsh
. "$PSScriptRoot\Get-OSC-EscapeSequence.ps1"

# NOTE: This function may not set up title correctly in PowerShell.

# function Set-OSC-Title(
#     [Parameter(Position = 0, Mandatory = $true)]
#     [string]$Title
# ) {
#     Get-OSC-EscapeSequence 2 $Title
# }

function Invoke-OSC-BasicNotification (
    [Parameter(Position = 0, Mandatory = $true)]
    [string]$Message
) {
    $st = Get-StringTerminator-EscapeSequence
    Write-Host (Get-OSC-EscapeSequence 9 "$Message$st")
}

function Invoke-OSC-Notification (
    [Parameter(Position = 0, Mandatory = $true)]
    [string]$Title,
    [Parameter(Position = 1, Mandatory = $true)]
    [string]$Message
) {
    $st = Get-StringTerminator-EscapeSequence
    Write-Host (Get-OSC-EscapeSequence 777 "notify;$Title;$Message$st")
}

function Get-OSC-Link (
    [Parameter(Position = 0, Mandatory = $true)]
    [string]$URL,
    [Parameter(Position = 1, Mandatory = $true)]
    [string]$Text
) {
    $st = Get-StringTerminator-EscapeSequence
    $hl = Get-OSC-EscapeSequence 8 ";"
    # printf '\e]8;;http://example.com\e\\This is a link\e]8;;\e\\\n'
    Write-Host "$hl$URL$st$Text$hl$st"
}


# __wezterm_set_user_var() {
#   if hash base64 2>/dev/null ; then
#     if [[ -z "${TMUX}" ]] ; then
#       printf "\033]1337;SetUserVar=%s=%s\007" "$1" `echo -n "$2" | base64`
#     else
#       # <https://github.com/tmux/tmux/wiki/FAQ#what-is-the-passthrough-escape-sequence-and-how-do-i-use-it>
#       # Note that you ALSO need to add "set -g allow-passthrough on" to your tmux.conf
#       printf "\033Ptmux;\033\033]1337;SetUserVar=%s=%s\007\033\\" "$1" `echo -n "$2" | base64`
#     fi
#   fi
# }

function Set-OSC-UserVariable (
    [Parameter(Position = 0, Mandatory = $true)]
    [string]$Name,
    [Parameter(Position = 1, Mandatory = $true)]
    [string]$Value
) {
    $Bytes = [System.Text.Encoding]::Unicode.GetBytes($Value)
    $EncodedValue = [Convert]::ToBase64String($Bytes)
    Write-Host (Get-OSC-EscapeSequence 1337 "SetUserVar=$Name=$EncodedValue`a")
}
