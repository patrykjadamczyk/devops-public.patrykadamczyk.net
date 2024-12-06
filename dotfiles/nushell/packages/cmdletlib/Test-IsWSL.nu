#!/usr/bin/env nu

def --env "Test-IsWSL" [] {
    if ($_IsLinux) {
        let path = "/" | path join "proc" "version" | path expand
        if ($path | path exists) {
            let procVersion = (open $path | into string)
            if ($procVersion =~ "Microsoft") {
                return true
            }
        }
    }
    return false
}
