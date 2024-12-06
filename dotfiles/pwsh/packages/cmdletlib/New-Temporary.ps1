#!/usr/bin/env pwsh

function New-TemporaryDirectory() {
    $tf = New-TemporaryFile
    $tpath = $tf.FullName
    Remove-Item $tpath
    New-Item -ItemType Directory -Path $tpath
    return $tpath
}

function Set-LocationToTemporaryDirectory() {
    $tf = New-TemporaryFile
    $tpath = $tf.FullName
    Remove-Item $tpath
    New-Item -ItemType Directory -Path $tpath
    Set-Location $tpath
}
