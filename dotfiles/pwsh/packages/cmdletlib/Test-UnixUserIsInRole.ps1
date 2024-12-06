#!/bin/env pwsh

function Global:Test-UnixUserIsInRole() {
    Param(
        [String] $Identity = $null,
        
        [String] $Group = "root"
    )

   

    if($null -eq $Identity) {
        $uid = id -u
        $gid = id -g 
    } else {
        $uid = id -u -n $Identity
        $gid = id -g -n $Identity
    }

    if($Group -eq "root") {
        return $uid -eq 0 -or $gid -eq 0;
    } else {
        # My Edit
        $groupId = getent group $Group | cut -d: -f3
        $userGroups = (id -G $uid) -split " "
        return $userGroups -contains $groupId
    }

    throw "Not Currently Supported"
}