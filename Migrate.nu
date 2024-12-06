#!/usr/bin/env nu
use std/dirs shells-aliases *

def main [
    --dryrun # Dry run
    --skip_until_last # Skip migrations until last migration run
] {

# Base Variables
let $BasePath = ($env.FILE_PWD | path expand)
let $BaseMigrations = ($BasePath | path join "migrations")
# Welcome Message
print $"(ansi green)Welcome to Installer of all dotfiles migrations v0.1 Nushell(ansi reset)"
print $"(ansi green)-----------------------------------------(ansi reset)"
# OS
const _IsWindows = $nu.os-info.name == "windows" and $nu.os-info.family == "windows"
const _IsLinux = $nu.os-info.name == "linux" and $nu.os-info.family == "unix"
const _IsMacOS = $nu.os-info.name == "macos" and $nu.os-info.family == "unix"
let _IsWSL = $_IsLinux and ("/proc/version" | path exists) and (open "/proc/version" | into string | str contains "Microsoft")
# Notes
if ($_IsWindows) {
    print $"(ansi blue)Note: If you want to install dotfiles migrations on WSL. Run this script under WSL.(ansi reset)"
}
if (which pm | is-empty) {
    print $"(ansi blue)Prerequisites: Install Dotfiles \(so path scripts are available\)(ansi reset)"
}

enter $BaseMigrations

mut $Migrations = (glob $"[0-9][0-9][0-9][0-9]Y[0-9][0-9]M[0-9][0-9]D[0-9][0-9]H[0-9][0-9]M[0-9][0-9]S-*.nu" | sort)

if $skip_until_last {
    let $last_migration = ($BaseMigrations | path join (open last.txt))
    print $"(ansi blue)Running newer migrations than ($last_migration)...(ansi reset)"
    $Migrations = $Migrations
        | append $last_migration
        | sort
        | reverse
        | each while {|$mig|
            if $mig != $last_migration {
                $mig
            }
        }
        | reverse
}
$Migrations
    | each {|$file|
        print $"(ansi blue)Running migration ($file)...(ansi reset)"
        if $dryrun {
            print $"(ansi red)Dry run mode enabled. Showing migration...(ansi reset)"
            print $"(ansi blue)Migration file: ($file)(ansi reset)"
            open $file | print
            print $"(ansi blue)End of migration file(ansi reset)"
        } else {
            nu $file
        }
        print $"(ansi blue)Finished migration ($file)...(ansi reset)"
    }

if $dryrun {
} else {
    echo $"(date now | format date "%YY%mM%dD%HH%MM%SS")" | save -f ./last.txt
}

dexit

}
