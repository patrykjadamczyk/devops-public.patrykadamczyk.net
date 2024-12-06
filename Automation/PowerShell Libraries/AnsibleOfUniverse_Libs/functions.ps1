#!/usr/bin/env pwsh
# Constants
$AnsiblePath = Join-Path $PSScriptRoot ".."
$PreScriptPath = Join-Path $AnsiblePath "bin" "_pre.ps1"
# Commands
New-PSDrive Ansible filesystem $AnsiblePath
# Functions
<#
.SYNOPSIS
Run Ansible PlayBook

.DESCRIPTION
Run Ansible Playbook

.EXAMPLE
run-ansible-playbook play-server/test.yaml
#>
function Run-Ansible-Playbook {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=0, Position=-1)]
        [string]
        $None
    )

    process {
        . $PreScriptPath
        $args_string = [System.String]::Join(" ", $args)
        ansible-playbook -vvvv -i inventory/inventory.yaml $args_string
    }
}

<#
.SYNOPSIS
Run Ansible PlayBook for server

.DESCRIPTION
Run Ansible Playbook for server

.EXAMPLE
play-server-ansible-notebook devserver.patrykadamczyk.net
#>
function Play-Server-Ansible-Notebook {
    [CmdletBinding()]
    param (
        [string]$ServerName
    )

    process {
        . $PreScriptPath
        $args_string = [System.String]::Join(" ", $args)
        ansible-playbook -vvvv -i inventory/inventory.yaml -i "inventory/$ServerName.yaml" "play-server/$ServerName.yaml"  --limit $ServerName $args_string
    }
}