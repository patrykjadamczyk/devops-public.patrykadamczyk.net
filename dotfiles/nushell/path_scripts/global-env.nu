#!/usr/bin/env nu

# Global Environment Variables Manager
def main [] {
    print $"(ansi green)Welcome to Global Environment Variables Manager v0.1(ansi reset)"
}

let $ENVDBFile = ("~/.config/env.db" | path expand)
let $ENVDBDir = ("~/.config/envdb" | path expand)

const _IsWindows = $nu.os-info.name == "windows" and $nu.os-info.family == "windows"
const _IsLinux = $nu.os-info.name == "linux" and $nu.os-info.family == "unix"
const _IsMacOS = $nu.os-info.name == "macos" and $nu.os-info.family == "unix"
let _IsWSL = $_IsLinux and ("/proc/version" | path exists) and (open "/proc/version" | into string | str contains "Microsoft")
const _os = if ($_IsWindows) {
    "Windows"
} else if ($_IsLinux) {
    "Linux"
} else if ($_IsMacOS) {
    "MacOS"
} else {
    "Other"
}
const _os_l = if ($_IsWindows) {
    "windows"
} else if ($_IsLinux) {
    "linux"
} else if ($_IsMacOS) {
    "macOS"
} else {
    "other"
}

def "main generate-envdb" [] {
    if (($ENVDBFile | path exists) == false) {
        print $"(ansi red)env.db file does not exist.(ansi reset)"
        print $"(ansi red)Creating new env.db file...(ansi reset)"

        print $"(ansi blue)Ensuring ~/.config directory exists...(ansi reset)"
        mkdir ~/.config
        print $"(ansi blue)Resetting inmemory database...(ansi reset)"
        stor reset
        print $"(ansi blue)Creating inmemory database with env table...(ansi reset)"
        stor create --table-name env --columns {name: str, value: str, shell: str}
        print $"(ansi blue)Exporting inmemory database to ~/.config/env.db...(ansi reset)"
        touch $ENVDBFile
        stor export --file-name $ENVDBFile
    }
    print $"(ansi red)Creating new env.db with up to date env data...(ansi reset)"

    print $"(ansi blue)Resetting inmemory database...(ansi reset)"
    stor reset

    print $"(ansi blue)Creating inmemory database with env table...(ansi reset)"
    stor create --table-name env --columns {name: str, value: str, shell: str}

    print $"(ansi green)Creating envs...(ansi reset)" ##########################################

    # NOTE: Fully shell-dependent envs should be in their respective configuration independently of global-envs

    # OS Envs
    stor insert --table-name env --data-record {name: "PAT_OS_IS_WINDOWS", value: $_IsWindows}
    stor insert --table-name env --data-record {name: "PAT_OS_IS_LINUX", value: $_IsLinux}
    stor insert --table-name env --data-record {name: "PAT_OS_IS_MACOS", value: $_IsMacOS}
    stor insert --table-name env --data-record {name: "PAT_OS_IS_WSL", value: $_IsWSL}
    stor insert --table-name env --data-record {name: "PAT_OS_NAME", value: $_os}
    stor insert --table-name env --data-record {name: "PAT_OS_NAME_LOWERCASE", value: $_os_l}

    # Paths
    if ($_IsWindows) {
        stor insert --table-name env --data-record {name: "PAT_APPDATA", value: ($env.APPDATA | path join "..")}
        stor insert --table-name env --data-record {name: "PAT_LocalAppData", value: $env.LOCALAPPDATA}
        stor insert --table-name env --data-record {name: "PAT_RoamingAppData", value: $env.APPDATA}
        stor insert --table-name env --data-record {name: "PAT_LocalLowAppData", value: ($env.APPDATA | path join ".." | path join "LocalLow")}
    }

    if ($_IsWindows) {
        stor insert --table-name env --data-record {name: "PAT_HOSTS_FILE", value: ($env.WINDIR | path join "System32" "drivers" "etc" "hosts")}
    } else {
        stor insert --table-name env --data-record {name: "PAT_HOSTS_FILE", value: ("/" | path join "etc" "hosts")}
    }

    # Zeit
    try {
        let ZEIT_DB = "~" | path join "go" "src" "devops.patrykadamczyk.net" "dotfiles" "zeit" "zeit.db" | path expand
        if ($ZEIT_DB | path exists) {
            stor insert --table-name env --data-record {name: "ZEIT_DB", value: ($ZEIT_DB)}
        }
    }

    # Alacritty

    if ($_IsWindows) {
        stor insert --table-name env --data-record {name: "ALACRITTY_CONFIG", value: ($env.APPDATA | path join "alacritty" "alacritty.yml")}
    } else {
        try {
            {||
                stor insert --table-name env --data-record {name: "ALACRITTY_CONFIG", value: ($env.XDG_CONFIG_HOME | path join "alacritty" "alacritty.yml")}
            }
        } catch {
            {||
                stor insert --table-name env --data-record {name: "ALACRITTY_CONFIG", value: ($env.HOME | path join ".config" "alacritty" "alacritty.yml")}
            }
        }
    }

    # Carapace
    stor insert --table-name env --data-record {name: "CARAPACE_BRIDGES", value: "zsh,fish,bash,inshellisense"}

    # Dotnet
    if ("~/.version-fox/cache/dotnet/current" | path exists) {
        stor insert --table-name env --data-record {name: "DOTNET_ROOT", value: ("~/.version-fox/cache/dotnet/current" | path expand)}
    }

    # LinuxInWindows
    stor insert --table-name env --data-record {name: "PAT_XDG_DATA_HOME", value: (if ($env.XDG_DATA_HOME? | is-not-empty) {
        $env.XDG_DATA_HOME
    } else if ($env.APPDATA? | is-not-empty) {
        $env.APPDATA
    } else {
        "~/.local/share"
    } | path expand)}
    stor insert --table-name env --data-record {name: "PAT_XDG_CONFIG_HOME", value: (if ($env.XDG_CONFIG_HOME? | is-not-empty) {
        $env.XDG_CONFIG_HOME
    } else if ($env.LOCALAPPDATA? | is-not-empty) {
        $env.LOCALAPPDATA
    } else {
        if ($_IsWindows) {
            $env.LOCALAPPDATA
        } else if ($env.XDG_CONFIG_HOME? | is-not-empty) {
            $env.XDG_CONFIG_HOME
        } else {
            ("~" | path join ".config")
        }
    } | path expand)}
    stor insert --table-name env --data-record {name: "PAT_XDG_CACHE_HOME", value: (if ($env.XDG_CACHE_HOME? | is-not-empty) {
        $env.XDG_CACHE_HOME
    } else if ($env.TEMP? | is-not-empty) {
        $env.TEMP
    } else {
        "~/.cache"
    } | path expand)}
    stor insert --table-name env --data-record {name: "PAT_XDG_STATE_HOME", value: (if ($env.XDG_STATE_HOME? | is-not-empty) {
        $env.XDG_STATE_HOME
    } else if ($env.LOCALAPPDATA? | is-not-empty) {
        $env.LOCALAPPDATA
    } else {
        if ($_IsWindows) {
            $env.LOCALAPPDATA
        } else if ($env.XDG_CONFIG_HOME? | is-not-empty) {
            $env.XDG_CONFIG_HOME
        } else {
            ("~" | path join ".config")
        }
    } | path expand)}
    # Editor
    stor insert --table-name env --data-record {name: "EDITOR", value: "nvim"}
    stor insert --table-name env --data-record {name: "GIT_EDITOR", value: "nvim"}
    # stor insert --table-name env --data-record {name: "BROWSER", value: "min"}
    # stor insert --table-name env --data-record {name: "BROWSER", value: "brave-browser"}
    # Pager
    if (which gum | is-not-empty) {
        stor insert --table-name env --data-record {name: "PAGER", value: "gum pager"}
    }

    # Neovide
    if ($_IsLinux) {
        # Force correct scaling on Linux with X11
        stor insert --table-name env --data-record {name: "WINIT_X11_SCALE_FACTOR", value: "1"}
    }

    # NeoVim
    if ($_IsWindows) {
        stor insert --table-name env --data-record {name: "NVIM_CONFIG_FILE", value: ($env.LOCALAPPDATA | path join "nvim" "init.lua")}
    } else {
        try {
            {||
                stor insert --table-name env --data-record {name: "NVIM_CONFIG_FILE", value: ($env.XDG_CONFIG_HOME | path join "nvim" "init.lua")}
            }
        } catch {
            {||
                stor insert --table-name env --data-record {name: "NVIM_CONFIG_FILE", value: ($env.HOME | path join ".config" "nvim" "init.lua")}
            }
        }
    }
    stor insert --table-name env --data-record {name: "RIPGREP_CONFIG_PATH", value: ("~" | path join "go" "src" "devops.patrykadamczyk.net" "dotfiles" "rg" ".ripgreprc" | path expand)}

    print $"(ansi green)Finished creating envs...(ansi reset)" #################################
    print $"(ansi green)Creating PATH env...(ansi reset)" ##########################################

    { ||
        if ($_IsWindows) {
            return
        }
        let pathConfigSuffix = [
            "~/.cargo/bin"
            "~/go/bin"
            "~/.nix-profile/bin"
            "~/.fzf/bin"
            "/home/linuxbrew/.linuxbrew/bin"
            "/home/linuxbrew/.linuxbrew/sbin"
        ]
        let pathConfigPrefix = [
            "~/.local/share/bob/nvim-bin"
            "~/.dotnet"
            "~/.version-fox/shims"
            "~/.cabal/bin"
            "~/.ghcup/bin"
            "~/.atuin/bin"
            "~/.config/nushell/path_scripts"
        ]

        use std "path add"

        $env.PATH = ($env.PATH | split row (char esep))

        $env.PATH = ($env.PATH
            | uniq
            | filter { $in != "/home/linuxbrew/.linuxbrew/bin" }
            | filter { $in != "/home/linuxbrew/.linuxbrew/sbin" }
            | filter { $in !~ ("~/.nix-profile" | path expand)}
            | filter { $in !~ "/nix/store"}
        )

        for $path in $pathConfigSuffix {
            if ($path | path exists) {
                path add --append ($path | path expand)
            }
        }

        for $path in $pathConfigPrefix {
            if ($path | path exists) {
                path add ($path | path expand)
            }
        }

        if (which opam | is-not-empty) {
            opam env
                | lines
                | where $it != is-empty
                | split column "=" name value
                | update value { $in | split column ";" path | get path.0 | str trim -c "'"}
                | reduce -f {} {|it acc| $acc | insert $it.name $it.value}
                | load-env
        }

        $env.PATH = ($env.PATH | uniq)

        if ($_IsMacOS == false) {
            return
        }

        let pathConfigSuffix = [
            "/usr/local/bin"
            "/opt/local/bin"
        ]
        let pathConfigPrefix = [
        ]

        for $path in $pathConfigSuffix {
            if ($path | path exists) {
                path add --append ($path | path expand)
            }
        }

        for $path in $pathConfigPrefix {
            if ($path | path exists) {
                path add ($path | path expand)
            }
        }

        $env.PATH = ($env.PATH | uniq)
    }
    stor insert --table-name env --data-record {name: "PATH", value: ($env.PATH | uniq | str join (char esep))}

    print $"(ansi green)Finished creating PATH env...(ansi reset)" #################################
    print $"(ansi green)Creating ENVDB envs...(ansi reset)" ##########################################

    stor insert --table-name env --data-record {name: "PAT_ENVDB_FILE", value: ($ENVDBFile | path expand)}
    stor insert --table-name env --data-record {name: "PAT_ENVDB_DIR", value: ($ENVDBDir | path expand)}

    print $"(ansi green)Finished creating ENVDB envs...(ansi reset)" #################################

    print $"(ansi blue)Exporting inmemory database to ~/.config/env.db...(ansi reset)"
    rm $ENVDBFile
    stor export --file-name $ENVDBFile
}

def "main generate-hooks" [] {
    print $"(ansi blue)Generating hooks...(ansi reset)"
    print $"(ansi blue)Generating hook .env...(ansi reset)"
    main generate-hook dotenv
    print $"(ansi blue)Generating hook nushell...(ansi reset)"
    main generate-hook nushell
    print $"(ansi blue)Generating hook sh...(ansi reset)"
    main generate-hook sh
    print $"(ansi blue)Generating hook bash...(ansi reset)"
    main generate-hook bash
    print $"(ansi blue)Generating hook zsh...(ansi reset)"
    main generate-hook zsh
    print $"(ansi blue)Generating hook fish...(ansi reset)"
    main generate-hook fish
    print $"(ansi blue)Generating hook Windows PowerShell...(ansi reset)"
    main generate-hook powershell
    print $"(ansi blue)Generating hook PowerShell Core...(ansi reset)"
    main generate-hook pwsh
    print $"(ansi blue)Generating hook cmd...(ansi reset)"
    main generate-hook cmd
    print $"(ansi blue)Generating hook elvish...(ansi reset)"
    main generate-hook elvish
    print $"(ansi blue)Generating hook ion...(ansi reset)"
    main generate-hook ion
    print $"(ansi blue)Generating hook xonsh...(ansi reset)"
    main generate-hook xonsh
    print $"(ansi blue)Generating hook osh\(oil\)...(ansi reset)"
    main generate-hook osh
    print $"(ansi blue)Generating hook tcsh...(ansi reset)"
    main generate-hook tcsh
    print $"(ansi blue)Generating hook hilbish...(ansi reset)"
    main generate-hook hilbish
    print $"(ansi blue)Generating hook lua...(ansi reset)"
    main generate-hook lua
}

# Generate .env file based on env.db
def "main generate-hook dotenv" [] {
    if (($ENVDBFile | path exists) == false) {
        print $"(ansi red)env.db file does not exist.(ansi reset)"
        print $"(ansi red)Creating new env.db file first using global-env generate-envdb...(ansi reset)"
        return
    }
    if (($ENVDBDir | path exists) == false) {
        mkdir $ENVDBDir
    }
    let $hookFile = ($ENVDBDir | path join ".env" | path expand)

    echo "# This file is automatically generated by Global Environment Variables Manager\n" | save -f $hookFile
    echo "# Do not edit this file manually\n" | save -f --append $hookFile

    open $ENVDBFile # Open env.db
        | query db "SELECT name, value FROM env WHERE shell IS NULL OR shell == \"env\"" # Get envs for current hook
        | each { $"($in.name)=($in.value)" } # Format
        | str join "\n" # Join into string ready to be saved
        | save -f --append $hookFile # Save into hook file
}

# Generate .nu file based on env.db
def "main generate-hook nushell" [] {
    if (($ENVDBFile | path exists) == false) {
        print $"(ansi red)env.db file does not exist.(ansi reset)"
        print $"(ansi red)Creating new env.db file first using global-env generate-envdb...(ansi reset)"
        return
    }
    if (($ENVDBDir | path exists) == false) {
        mkdir $ENVDBDir
    }
    let $hookFile = ($ENVDBDir | path join "env.nu" | path expand)

    echo "#!/usr/bin/env nu\n" | save -f $hookFile
    echo "# This file is automatically generated by Global Environment Variables Manager\n" | save -f --append $hookFile
    echo "# Do not edit this file manually\n" | save -f --append $hookFile

    open $ENVDBFile # Open env.db
        | query db "SELECT name, value FROM env WHERE shell IS NULL OR shell == \"nu\"" # Get envs for current hook
        | each { $"$env.($in.name) = \"($in.value)\"" } # Format
        | str join "\n" # Join into string ready to be saved
        | save -f --append $hookFile # Save into hook file
}

# Generate .sh file based on env.db
def "main generate-hook sh" [] {
    if (($ENVDBFile | path exists) == false) {
        print $"(ansi red)env.db file does not exist.(ansi reset)"
        print $"(ansi red)Creating new env.db file first using global-env generate-envdb...(ansi reset)"
        return
    }
    if (($ENVDBDir | path exists) == false) {
        mkdir $ENVDBDir
    }
    let $hookFile = ($ENVDBDir | path join "env.sh" | path expand)

    echo "#!/usr/bin/env sh\n" | save -f $hookFile
    echo "# This file is automatically generated by Global Environment Variables Manager\n" | save -f --append $hookFile
    echo "# Do not edit this file manually\n" | save -f --append $hookFile

    open $ENVDBFile # Open env.db
        | query db "SELECT name, value FROM env WHERE shell IS NULL OR shell == \"sh\"" # Get envs for current hook
        | each { $"export ($in.name)=\"($in.value)\"" } # Format
        | str join "\n" # Join into string ready to be saved
        | save -f --append $hookFile # Save into hook file
}

# Generate .bash file based on env.db
def "main generate-hook bash" [] {
    if (($ENVDBFile | path exists) == false) {
        print $"(ansi red)env.db file does not exist.(ansi reset)"
        print $"(ansi red)Creating new env.db file first using global-env generate-envdb...(ansi reset)"
        return
    }
    if (($ENVDBDir | path exists) == false) {
        mkdir $ENVDBDir
    }
    let $hookFile = ($ENVDBDir | path join "env.bash" | path expand)

    echo "#!/usr/bin/env bash\n" | save -f $hookFile
    echo "# This file is automatically generated by Global Environment Variables Manager\n" | save -f --append $hookFile
    echo "# Do not edit this file manually\n" | save -f --append $hookFile

    open $ENVDBFile # Open env.db
        | query db "SELECT name, value FROM env WHERE shell IS NULL OR shell == \"bash\"" # Get envs for current hook
        | each { $"export ($in.name)=\"($in.value)\"" } # Format
        | str join "\n" # Join into string ready to be saved
        | save -f --append $hookFile # Save into hook file
}

# Generate .zsh file based on env.db
def "main generate-hook zsh" [] {
    if (($ENVDBFile | path exists) == false) {
        print $"(ansi red)env.db file does not exist.(ansi reset)"
        print $"(ansi red)Creating new env.db file first using global-env generate-envdb...(ansi reset)"
        return
    }
    if (($ENVDBDir | path exists) == false) {
        mkdir $ENVDBDir
    }
    let $hookFile = ($ENVDBDir | path join "env.zsh" | path expand)

    echo "#!/usr/bin/env zsh\n" | save -f $hookFile
    echo "# This file is automatically generated by Global Environment Variables Manager\n" | save -f --append $hookFile
    echo "# Do not edit this file manually\n" | save -f --append $hookFile

    open $ENVDBFile # Open env.db
        | query db "SELECT name, value FROM env WHERE shell IS NULL OR shell == \"zsh\"" # Get envs for current hook
        | each { $"export ($in.name)=\"($in.value)\"" } # Format
        | str join "\n" # Join into string ready to be saved
        | save -f --append $hookFile # Save into hook file
}

# Generate .fish file based on env.db
def "main generate-hook fish" [] {
    if (($ENVDBFile | path exists) == false) {
        print $"(ansi red)env.db file does not exist.(ansi reset)"
        print $"(ansi red)Creating new env.db file first using global-env generate-envdb...(ansi reset)"
        return
    }
    if (($ENVDBDir | path exists) == false) {
        mkdir $ENVDBDir
    }
    let $hookFile = ($ENVDBDir | path join "env.fish" | path expand)

    echo "#!/usr/bin/env fish\n" | save -f $hookFile
    echo "# This file is automatically generated by Global Environment Variables Manager\n" | save -f --append $hookFile
    echo "# Do not edit this file manually\n" | save -f --append $hookFile

    open $ENVDBFile # Open env.db
        | query db "SELECT name, value FROM env WHERE shell IS NULL OR shell == \"fish\"" # Get envs for current hook
        # | each { $"set -x ($in.name) \"($in.value)\"" } # Format
        | each { $"set -Ux ($in.name) \"($in.value)\"" } # Format
        | str join "\n" # Join into string ready to be saved
        | save -f --append $hookFile # Save into hook file
}

# Generate powershell.ps1 file based on env.db
def "main generate-hook powershell" [] {
    if (($ENVDBFile | path exists) == false) {
        print $"(ansi red)env.db file does not exist.(ansi reset)"
        print $"(ansi red)Creating new env.db file first using global-env generate-envdb...(ansi reset)"
        return
    }
    if (($ENVDBDir | path exists) == false) {
        mkdir $ENVDBDir
    }
    let $hookFile = ($ENVDBDir | path join "env.powershell.ps1" | path expand)

    echo "#!/usr/bin/env powershell\n" | save -f $hookFile
    echo "# This file is automatically generated by Global Environment Variables Manager\n" | save -f --append $hookFile
    echo "# Do not edit this file manually\n" | save -f --append $hookFile

    open $ENVDBFile # Open env.db
        | query db "SELECT name, value FROM env WHERE shell IS NULL OR shell == \"powershell\"" # Get envs for current hook
        | each { $"$env:($in.name)=\"($in.value)\"" } # Format
        | str join "\n" # Join into string ready to be saved
        | save -f --append $hookFile # Save into hook file
}

# Generate pwsh.ps1 file based on env.db
def "main generate-hook pwsh" [] {
    if (($ENVDBFile | path exists) == false) {
        print $"(ansi red)env.db file does not exist.(ansi reset)"
        print $"(ansi red)Creating new env.db file first using global-env generate-envdb...(ansi reset)"
        return
    }
    if (($ENVDBDir | path exists) == false) {
        mkdir $ENVDBDir
    }
    let $hookFile = ($ENVDBDir | path join "env.pwsh.ps1" | path expand)

    echo "#!/usr/bin/env pwsh\n" | save -f $hookFile
    echo "# This file is automatically generated by Global Environment Variables Manager\n" | save -f --append $hookFile
    echo "# Do not edit this file manually\n" | save -f --append $hookFile

    open $ENVDBFile # Open env.db
        | query db "SELECT name, value FROM env WHERE shell IS NULL OR shell == \"pwsh\"" # Get envs for current hook
        | each { $"$env:($in.name)=\"($in.value)\"" } # Format
        | str join "\n" # Join into string ready to be saved
        | save -f --append $hookFile # Save into hook file
}

# Generate cmd.bat file based on env.db
def "main generate-hook cmd" [] {
    if (($ENVDBFile | path exists) == false) {
        print $"(ansi red)env.db file does not exist.(ansi reset)"
        print $"(ansi red)Creating new env.db file first using global-env generate-envdb...(ansi reset)"
        return
    }
    if (($ENVDBDir | path exists) == false) {
        mkdir $ENVDBDir
    }
    let $hookFile = ($ENVDBDir | path join "env.bat" | path expand)

    echo "REM This file is automatically generated by Global Environment Variables Manager\n" | save -f $hookFile
    echo "REM Do not edit this file manually\n" | save -f --append $hookFile

    open $ENVDBFile # Open env.db
        | query db "SELECT name, value FROM env WHERE shell IS NULL OR shell == \"cmd\"" # Get envs for current hook
        | each { $"set ($in.name)=\"($in.value)\"" } # Format
        | str join "\n" # Join into string ready to be saved
        | save -f --append $hookFile # Save into hook file
}

# Generate .elv file based on env.db
def "main generate-hook elvish" [] {
    if (($ENVDBFile | path exists) == false) {
        print $"(ansi red)env.db file does not exist.(ansi reset)"
        print $"(ansi red)Creating new env.db file first using global-env generate-envdb...(ansi reset)"
        return
    }
    if (($ENVDBDir | path exists) == false) {
        mkdir $ENVDBDir
    }
    let $hookFile = ($ENVDBDir | path join "env.elv" | path expand)

    echo "#!/usr/bin/env elvish\n" | save -f $hookFile
    echo "# This file is automatically generated by Global Environment Variables Manager\n" | save -f --append $hookFile
    echo "# Do not edit this file manually\n" | save -f --append $hookFile

    open $ENVDBFile # Open env.db
        | query db "SELECT name, value FROM env WHERE shell IS NULL OR shell == \"elvish\"" # Get envs for current hook
        | each { $"set-env ($in.name) \"($in.value)\"" } # Format
        | str join "\n" # Join into string ready to be saved
        | save -f --append $hookFile # Save into hook file
}

# Generate .ion file based on env.db
def "main generate-hook ion" [] {
    if (($ENVDBFile | path exists) == false) {
        print $"(ansi red)env.db file does not exist.(ansi reset)"
        print $"(ansi red)Creating new env.db file first using global-env generate-envdb...(ansi reset)"
        return
    }
    if (($ENVDBDir | path exists) == false) {
        mkdir $ENVDBDir
    }
    let $hookFile = ($ENVDBDir | path join "env.ion" | path expand)

    echo "#!/usr/bin/env ion\n" | save -f $hookFile
    echo "# This file is automatically generated by Global Environment Variables Manager\n" | save -f --append $hookFile
    echo "# Do not edit this file manually\n" | save -f --append $hookFile

    open $ENVDBFile # Open env.db
        | query db "SELECT name, value FROM env WHERE shell IS NULL OR shell == \"ion\"" # Get envs for current hook
        | each { $"export ($in.name)=\"($in.value)\"" } # Format
        | str join "\n" # Join into string ready to be saved
        | save -f --append $hookFile # Save into hook file
}

# Generate .xsh file based on env.db
def "main generate-hook xonsh" [] {
    if (($ENVDBFile | path exists) == false) {
        print $"(ansi red)env.db file does not exist.(ansi reset)"
        print $"(ansi red)Creating new env.db file first using global-env generate-envdb...(ansi reset)"
        return
    }
    if (($ENVDBDir | path exists) == false) {
        mkdir $ENVDBDir
    }
    let $hookFile = ($ENVDBDir | path join "env.xsh" | path expand)

    echo "#!/usr/bin/env xonsh\n" | save -f $hookFile
    echo "# This file is automatically generated by Global Environment Variables Manager\n" | save -f --append $hookFile
    echo "# Do not edit this file manually\n" | save -f --append $hookFile

    open $ENVDBFile # Open env.db
        | query db "SELECT name, value FROM env WHERE shell IS NULL OR shell == \"xonsh\"" # Get envs for current hook
        | each { $"$($in.name)=\"($in.value)\"" } # Format
        | str join "\n" # Join into string ready to be saved
        | save -f --append $hookFile # Save into hook file
}

# Generate .osh file based on env.db
def "main generate-hook osh" [] {
    if (($ENVDBFile | path exists) == false) {
        print $"(ansi red)env.db file does not exist.(ansi reset)"
        print $"(ansi red)Creating new env.db file first using global-env generate-envdb...(ansi reset)"
        return
    }
    if (($ENVDBDir | path exists) == false) {
        mkdir $ENVDBDir
    }
    let $hookFile = ($ENVDBDir | path join "env.osh" | path expand)

    echo "#!/usr/bin/env osh\n" | save -f $hookFile
    echo "# This file is automatically generated by Global Environment Variables Manager\n" | save -f --append $hookFile
    echo "# Do not edit this file manually\n" | save -f --append $hookFile

    open $ENVDBFile # Open env.db
        | query db "SELECT name, value FROM env WHERE shell IS NULL OR shell == \"osh\"" # Get envs for current hook
        | each { $"export ($in.name)=\"($in.value)\"" } # Format
        | str join "\n" # Join into string ready to be saved
        | save -f --append $hookFile # Save into hook file
}

# Generate .tcsh file based on env.db
def "main generate-hook tcsh" [] {
    if (($ENVDBFile | path exists) == false) {
        print $"(ansi red)env.db file does not exist.(ansi reset)"
        print $"(ansi red)Creating new env.db file first using global-env generate-envdb...(ansi reset)"
        return
    }
    if (($ENVDBDir | path exists) == false) {
        mkdir $ENVDBDir
    }
    let $hookFile = ($ENVDBDir | path join "env.tcsh" | path expand)

    echo "#!/usr/bin/env tcsh\n" | save -f $hookFile
    echo "# This file is automatically generated by Global Environment Variables Manager\n" | save -f --append $hookFile
    echo "# Do not edit this file manually\n" | save -f --append $hookFile

    open $ENVDBFile # Open env.db
        | query db "SELECT name, value FROM env WHERE shell IS NULL OR shell == \"tcsh\"" # Get envs for current hook
        | each { $"export ($in.name)=\"($in.value)\"" } # Format
        | str join "\n" # Join into string ready to be saved
        | save -f --append $hookFile # Save into hook file
}

# Generate .hilbish.lua file based on env.db
def "main generate-hook hilbish" [] {
    if (($ENVDBFile | path exists) == false) {
        print $"(ansi red)env.db file does not exist.(ansi reset)"
        print $"(ansi red)Creating new env.db file first using global-env generate-envdb...(ansi reset)"
        return
    }
    if (($ENVDBDir | path exists) == false) {
        mkdir $ENVDBDir
    }
    let $hookFile = ($ENVDBDir | path join "env.hilbish.lua" | path expand)

    echo "-- This file is automatically generated by Global Environment Variables Manager\n" | save -f $hookFile
    echo "-- Do not edit this file manually\n" | save -f --append $hookFile

    open $ENVDBFile # Open env.db
        | query db "SELECT name, value FROM env WHERE shell IS NULL OR shell == \"hilbish\"" # Get envs for current hook
        | each { $"export ($in.name)=\"($in.value)\"" } # Format
        | str join "\n" # Join into string ready to be saved
        | save -f --append $hookFile # Save into hook file
}

# Generate .lua file based on env.db
def "main generate-hook lua" [] {
    if (($ENVDBFile | path exists) == false) {
        print $"(ansi red)env.db file does not exist.(ansi reset)"
        print $"(ansi red)Creating new env.db file first using global-env generate-envdb...(ansi reset)"
        return
    }
    if (($ENVDBDir | path exists) == false) {
        mkdir $ENVDBDir
    }
    let $hookFile = ($ENVDBDir | path join "env.lua" | path expand)

    echo "-- This file is automatically generated by Global Environment Variables Manager\n" | save -f $hookFile
    echo "-- Do not edit this file manually\n" | save -f --append $hookFile

    open $ENVDBFile # Open env.db
        | query db "SELECT name, value FROM env WHERE shell IS NULL OR shell == \"lua\"" # Get envs for current hook
        | each { $"os.setenv\(\"($in.name)\",\"($in.value)\"\)" } # Format
        | str join "\n" # Join into string ready to be saved
        | save -f --append $hookFile # Save into hook file
}
