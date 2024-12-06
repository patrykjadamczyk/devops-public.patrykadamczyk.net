#!/usr/bin/env pwsh

######## Variables to bypass some things that PowerShell have
###### IsOS Variables first as reference to use in functions and as alternatives because Windows PowerShell (5.*) don't have them anyway [even windows one]
$_IsWindows = [System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Windows);
$_IsLinux = [System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Linux);
$_IsMacOS = [System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::OSX);
###### Run Dependencies
. (Join-Path $PSScriptRoot "alf_cmdletlib_dependencies.ps1")

######## Alf aliases Configuration

# all-groups
if (!$_IsWindows)
{
    <#
    .SYNOPSIS
    All Linux Groups
    #>
    function Global:all-groups
    {
        [CmdletBinding()]
        param ()

        process {
            #cut -d: -f1 /etc/group | sort

            $groups = Get-Content -Path /etc/group
            $_groups = @()
            ForEach ($group in $groups)
            {
                $_groups = $_groups + ($group.Split(":") | Select-Object -First 1)
            }
            $_groups = $_groups | Sort-Object
            return $_groups
        }
    }
}

# cdp & c
# function Global:cdp {
#     # cd ~/Projects; clear; pwd
#     Set-Location ~/Projects;
#     Clear-Host;
#     Get-Location;
# }

# cdp & c
function Global:cdp {
    Set-Location ~/go/src;
    Clear-Host;
    Get-Location;
}

function Global:c {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingCmdletAliases', '', Justification='cd is not an alias to Set-Location')]
    param(
        [Parameter(Mandatory=$true, Position=0)]
        [String] $Directory
    ) 
    #cd $1; clear; pwd
    # Set-Location $Directory;
    cd $Directory;
    Clear-Host;
    Get-Location;
}

# compare-dir: diff --brief -Nr
# function Global:compare-dir {
#     [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingCmdletAliases', '', Justification='diff is not an alias to Compare-Object')]
#     param()
#     diff --brief -Nr $args
# }

# count: ls -1 ${1:-.} | wc -l
function Global:count (
    [Parameter(Mandatory=$false, Position=0)]
    [String] $Directory
) {
    #ls -1 ${1:-.} | wc -l
    if([string]::IsNullOrWhiteSpace($Directory))
    {
       $Directory = "."
    }

    $ls = Get-ChildItem $Directory
    return $ls.Length
}

#cm: chmod $1 $2
#cmr: chmod $1 -R $2
function Global:cm (
    [Parameter(Mandatory=$true, Position=0)]
    [String] $NewPermission,
    [Parameter(Mandatory=$true, Position=1)]
    [String] $Directory
) {
    chmod $NewPermission $Directory
}

function Global:cmr (
    [Parameter(Mandatory=$true, Position=0)]
    [String] $NewPermission,
    [Parameter(Mandatory=$true, Position=1)]
    [String] $Directory
) {
    chmod -R $NewPermission $Directory
}

#co: chown $1 $2
#cor: chown $1 -R $2
function Global:co (
    [Parameter(Mandatory=$true, Position=0)]
    [String] $NewPermission,
    [Parameter(Mandatory=$true, Position=1)]
    [String] $Directory
) {
    chown $NewPermission $Directory
}

function Global:cor (
    [Parameter(Mandatory=$true, Position=0)]
    [String] $NewPermission,
    [Parameter(Mandatory=$true, Position=1)]
    [String] $Directory
) {
    chown -R $NewPermission $Directory
}

#d: docker
function Global:d {
    $possible_alf_subalias, $pas_args = $args;

    switch ($possible_alf_subalias)
    {
        "psf" {
            docker ps --format "{{.ID}} {{.Names}}\t{{.Status}}  {{.Ports}}" $pas_args
        }
        "paf" {
            docker ps -a --format="table {{.Names}}\t{{.Status}}\t{{.ID}}" $pas_args
        }
        "p" {
            docker ps -a $pas_args
        }
        "clean" {
            docker system prune -f $pas_args
        }
        "i" {
            docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.Size}}" $pas_args
        }
        "images" {
            docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.Size}}" $pas_args
        }
        "n" {
            docker network $pas_args
        }
        "rmi" {
            $1, $rest = $pas_args;
            docker images --format "{{.Repository}}:{{.Tag}}" | Select-String -Pattern $1 | ForEach-Object { docker rmi -f $_ }
        }
        "rmv" {
            $1, $rest = $pas_args;
            docker volume ls --format "{{.Name}}" | Select-String -Pattern $1 | ForEach-Object { docker volume rm -f $_ }
        }
        "v" {
            docker volume $pas_args
        }
        "r" {
            docker run -it --rm $pas_args
        }
        "replicas" {
            docker service ls --format='table {{.Name}}\t{{.Mode}}\t{{.Replicas}}' $pas_args
        }
        "s" {
            docker service $pas_args
        }
        "st" {
            docker stack $pas_args
        }
        "size" {
            #docker images --format '{{.Size}}\t{{.Repository}}:{{.Tag}}' | sort -h | column -t
            docker images --format="{{json .}}" |
                ConvertFrom-Json |
                Select-Object Size,@{Name='RealSize'; Expression={$_.Size | Convert-FromHumanReadableBytesBinary}},@{Name = 'Image'; Expression = {"{0}:{1}" -f $_.Repository,$_.Tag}} |
                Sort-Object RealSize |
                Select-Object Size,Image |
                Format-Table
        }
        "stats" {
            docker stats --format "{{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}" $pas_args
        }
        Default {
            docker $args
        }
    }
}

#dc: docker-compose
function Global:dc {
    $possible_alf_subalias, $pas_args = $args;

    switch ($possible_alf_subalias)
    {
        "ud" {
            docker-compose up -d $pas_args
        }
        "ub" {
            docker-compose up -d --build $pas_args
        }
        "ur" {
            docker-compose up -d --force-recreate $pas_args
        }
        "ubr" {
            docker-compose up -d --build --force-recreate $pas_args
        }
        "u" {
            docker-compose up $pas_args
        }
        "eb" {
            $1, $rest = $pas_args;
            docker-compose exec $1 /bin/bash
        }
        "e" {
            $1, $rest = $pas_args;
            docker-compose exec $1 $rest
        }
        "rb" {
            $1, $rest = $pas_args;
            docker-compose run --rm $1 /bin/bash $rest
        }
        "r" {
            $1, $rest = $pas_args;
            docker-compose run --rm $1 $rest
        }
        "d" {
            docker-compose down $pas_args
        }
        "sael" {
            $1, $rest = $pas_args;
            docker-compose exec $1 cat /var/log/apache2/error.log
        }
        "stael" {
            $1, $rest = $pas_args;
            docker-compose exec $1 tail -f /var/log/apache2/error.log
        }
        "lf" {
            docker-compose logs -f $pas_args
        }
        Default {
            docker-compose $args
        }
    }
}

# dclf: dc logs -f
function Global:dclf {
    docker-compose logs -f $args
}

# dfh: df -H
function Global:dfh {
    #df -H

    # This is PowerShell way made to work exactly like df -H

    return [System.IO.DriveInfo]::getdrives() |
        Select-Object @{Name='Filesystem'; Expression={$_.Name}},@{Name='Size'; Expression={Format-FileSize $_.TotalSize}},@{Name='Used'; Expression={Format-FileSize ($_.TotalSize - $_.AvailableFreeSpace)}},@{Name='Avail'; Expression={Format-FileSize $_.AvailableFreeSpace}},@{Name='Use%'; Expression={"{0:N2}%" -f ((($_.TotalSize - $_.AvailableFreeSpace)/$_.TotalSize)*100)}},@{Name='Mounted on'; Expression={$_.RootDirectory}} |
        Format-Table
}

# dfhd: df -H | grep -v -e "/dev/loop" -e "tmpfs" -e "udev"
function Global:dfhd {
    #df -H | grep -v -e "/dev/loop" -e "tmpfs" -e "udev"

    # This is PowerShell way made to work exactly like df -H | grep -v -e "/dev/loop" -e "tmpfs" -e "udev"
    return [System.IO.DriveInfo]::getdrives() |
        Where-Object { $_.DriveFormat -NotMatch "tmpfs"} |
        Where-Object { $_.DriveFormat -NotMatch "udev"} |
        Select-Object @{Name='Filesystem'; Expression={$_.Name}},@{Name='Size'; Expression={Format-FileSize $_.TotalSize}},@{Name='Used'; Expression={Format-FileSize ($_.TotalSize - $_.AvailableFreeSpace)}},@{Name='Avail'; Expression={Format-FileSize $_.AvailableFreeSpace}},@{Name='Use%'; Expression={"{0:N2}%" -f ((($_.TotalSize - $_.AvailableFreeSpace)/$_.TotalSize)*100)}},@{Name='Mounted on'; Expression={$_.RootDirectory}} |
        Where-Object { $_.Filesystem -NotMatch "/dev/loop"} |
        Format-Table
}

# duh: du -ach
function Global:duh {
    #du -ach
    $total_size=0
    Get-ChildItem $args |
        ForEach-Object {
            $filename = $_.FullName
            Get-ChildItem -File -Recurse $_.FullName |
                Measure-Object -Property length -Sum |
                ForEach-Object {
                    $total_size = $total_size + $_.Sum;
                    return $_
                } |
                Select-Object -Property @{Name="Name";Expression={$filename}},
                    @{Name="Size";Expression={Format-FileSize $_.Sum}}
        } | Format-Table
    Write-Host ("Total Size: {0}" -f (Format-FileSize $total_size))
}

# dps: d ps
function Global:dps {
    docker ps $args
}

# dpsa: d ps -a
function Global:dpsa {
    docker ps -a $args
}

# gg: g p
function Global:gg {
    git push $args
}

# ggt: gg && gg --tag
function Global:ggt {
    git push
    if ($? -eq 0)
    {
        git push --tag $args
    }
}

# gpl: g pl
function Global:gpl {
    git pull $args
}

# killport: [[ $(lsof -ti:$1) ]] && kill -9 $(lsof -ti:$1)
function Global:killport (
    [Parameter(Mandatory=$true, Position=0)]
    [String] $Port
) {
    if ($_isWindows) {
        return Get-Process -Id (Get-NetTCPConnection -LocalPort "$Port").OwningProcess | Stop-Process
    } else {
        $_Port = ":{0}" -f $Port
        return lsof "-ti$_Port" |
            ForEach-Object {
                Stop-Process -Id $_
            }
    }
}

# l: ls -lah
function Global:l {
    Get-ChildItem -Force $args
}

# le: exa -lah
function Global:le {
    exa -lah $args
}

# env: env (PowerShell exec)
function Global:env {
    return Get-ChildItem Env:
}

# nv: env |grep -i
function Global:nv (
    [Parameter(Mandatory=$true, Position=0)]
    [String] $Pattern
) {
    return Get-ChildItem Env: | Where-Object { $_.Name | Select-String -Pattern $Pattern }
}

# psf: ps -ef |grep
function Global:psf (
    [Parameter(Mandatory=$true, Position=0)]
    [String] $Pattern
) {
    return Get-Process | Where-Object { $_.ProcessName | Select-String -Pattern $Pattern }
}

# repeat: for i in `seq $1`; do ${@:2} ; done
function Global:repeat (
    [Parameter(Mandatory=$true, Position=0)]
    [Int32] $RepeatNumber,
    [Parameter(Mandatory=$true, Position=1)]
    [PSObject] $RepeatBlock
) {
    (1..$RepeatNumber) | ForEach-Object $RepeatBlock
}

# Remove default alias r = Invoke-History
Remove-Alias -Name r -ErrorAction SilentlyContinue
# Add alias in place of r. ih as Invoke-History
New-Alias -Name ih -Value Invoke-History -ErrorAction SilentlyContinue

# r: clear; ${@:1}
function Global:r (
    [Parameter(Mandatory=$false, Position=0)]
    [PSObject] $FunctionBlock
) {
    Clear-Host;
    if ($FunctionBlock)
    {
        Invoke-Command -ScriptBlock $FunctionBlock;
    }
}

# title: echo -ne "\033]0;${@:1}\007"
function Global:title (
    [Parameter(Mandatory=$true, Position=0)]
    [String] $Title
) {
    $host.ui.RawUI.WindowTitle = $Title
}

# update: sudo apt update; sudo apt upgrade -y; sudo apt autoremove; brew update; brew upgrade; sudo snap refresh
function Global:update {
    if ($_isLinux) {
        try {
            if(Get-Command nala) {
                sudo nala update;
                sudo nala upgrade -y;
                sudo nala autoremove -y;
            }
        } catch {
            sudo apt update;
            sudo apt upgrade -y;
            sudo apt autoremove -y;
        }
        brew update;
        brew upgrade;
        sudo snap refresh
    } elseif ($_IsMacOS) {
        brew update;
        brew upgrade;
    } elseif ($_IsWindows) {
        sudo choco upgrade all -y;
        scoop update -a
    } else {
        Write-Host -ForegroundColor Red "System is unsupported"
    }
}

# superlinter: sudo docker pull github/super-linter:latest; sudo docker run -e RUN_LOCAL=true -v $PWD:/tmp/lint github/super-linter
function Global:superlinter {
    docker pull github/super-linter:latest;
    docker run -e RUN_LOCAL=true -v "${PWD}:/tmp/lint" github/super-linter
}

# ver: lsb_release -drc
function Global:ver {
    neofetch $args
}

# p: pwbs
function Global:p {
    pwbs $args
}

# n: nvim
function Global:n (
    [Parameter(Position=0, ValueFromRemainingArguments)]
    [string[]] $AdditionalArgs,
    [Parameter(ValueFromPipeline)]
    [string]$InputObject
) {
    if ($InputObject) {
        return $InputObject | nvim $AdditionalArgs
    }
    return nvim $AdditionalArgs
}

# nn: neovide
function Global:nn (
    [Parameter(Position=0, ValueFromRemainingArguments)]
    [string[]] $AdditionalArgs,
    [Parameter(ValueFromPipeline)]
    [string]$InputObject
) {
    if ($InputObject) {
        return $InputObject | neovide $AdditionalArgs
    }
    return neovide $AdditionalArgs
}

# lln: lite-nvim
function Global:lln (
    [Parameter(Position=0, ValueFromRemainingArguments)]
    [string[]] $AdditionalArgs,
    [Parameter(ValueFromPipeline)]
    [string]$InputObject
) {
    if ($InputObject) {
        return $InputObject | nvim $AdditionalArgs
    }
    $env:NVIM_APPNAME="lite-nvim"
    nvim $AdditionalArgs
    $env:NVIM_APPNAME=""
}

# lnn: lite-neovide
function Global:lnn (
    [Parameter(Position=0, ValueFromRemainingArguments)]
    [string[]] $AdditionalArgs,
    [Parameter(ValueFromPipeline)]
    [string]$InputObject
) {
    if ($InputObject) {
        return $InputObject | neovide $AdditionalArgs
    }
    $env:NVIM_APPNAME="lite-nvim"
    neovide $AdditionalArgs
    $env:NVIM_APPNAME=""
}


# loop_infinite: while true; do ${@:1}; sleep 1; done
function Global:loop_infinite (
    [Parameter(Mandatory=$true, Position=0)]
    [PSObject] $RepeatBlock
) {
    while ($true)
    {
        Invoke-Command -ScriptBlock $RepeatBlock;
    }
}

# which_package: dpkg -S ${@:1}
if ($_IsLinux) {
    function Global:which_package {
        dpkg -S $args
    }
}

# w: echo "starting watcher";
#   dfh: for ((i=1; i>0; i+=1)); do r dfh; echo "Rendered $i time"; sleep 1; done
#   odc-ps: for ((i=1; i>0; i+=1)); do r odc ps; echo "Rendered $i time"; sleep 1;done
#   dc-ps: for ((i=1; i>0; i+=1)); do r dc ps; echo "Rendered $i time"; sleep 1; done
#   ls: for((i=1; i>0; i+=1)); do r ls -lah; echo "Rendered $i time"; sleep 1; done
function Global:w {
    $possible_alf_subalias, $pas_args = $args;

    Write-Host "Starting Watcher";
    switch ($possible_alf_subalias)
    {
        "dfh" {
            for ($i = 1; $i -gt 0; $i++) {
                Clear-Host;
                dfh $pas_args;
                Write-Host "Rendered $i time";
                Start-Sleep 1;
            }
        }
        "odc-ps" {
            # Might not work
            for ($i = 1; $i -gt 0; $i++) {
                Clear-Host;
                op dc ps $pas_args;
                Write-Host "Rendered $i time";
                Start-Sleep 1;
            }
        }
        "dc-ps" {
            for ($i = 1; $i -gt 0; $i++) {
                Clear-Host;
                dc ps $pas_args;
                Write-Host "Rendered $i time";
                Start-Sleep 1;
            }
        }
        "ls" {
            for ($i = 1; $i -gt 0; $i++) {
                Clear-Host;
                l $pas_args;
                Write-Host "Rendered $i time";
                Start-Sleep 1;
            }
        }
        Default {
            for ($i = 1; $i -gt 0; $i++) {
                Clear-Host;
                Invoke-Command -ScriptBlock $args;
                Write-Host "Rendered $i time";
                Start-Sleep 1;
            }
        }
    }
}
