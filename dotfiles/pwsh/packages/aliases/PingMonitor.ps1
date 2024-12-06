#!/usr/bin/env pwsh

function Global:Check-InternetConnection {
    gping google.com store.steampowered.com 9.9.9.9 8.8.8.8 8.8.4.4 1.1.1.1
}
