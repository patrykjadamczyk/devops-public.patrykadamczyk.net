#!/usr/bin/env nu

def --env "Invoke-OSC-BasicNotification" [
    $Message: string
] {
    print $"(ansi osc)9;($Message)(ansi st)"
}

def --env "Invoke-OSC-Notification" [
    $Title: string,
    $Message: string
] {
    print $"(ansi osc)777;notify;($Title);($Message)(ansi st)"
}

def --env "Invoke-OSC-Link" [
    $URL: string,
    $Text: string
] {
    print $"(ansi osc)8;;($URL)(ansi st)($Text)(ansi osc)8;;(ansi st)"
}

def --env "Invoke-OSC-UserVariable" [
    $Name: string,
    $Value: string
] {
    print $"(ansi osc)1337;SetUserVar=($Name)=($Value | encode base64)(char bel)"
}
