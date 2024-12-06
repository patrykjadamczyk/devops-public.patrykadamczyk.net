#!/usr/bin/env nu

# Special Menu
# This is a menu for tools, projects and other things from wezterm config
def main [] {
    print "Welcome to Special Menu nushell script"
}

const _IsWindows = $nu.os-info.name == "windows" and $nu.os-info.family == "windows"
const _IsLinux = $nu.os-info.name == "linux" and $nu.os-info.family == "unix"
const _IsMacOS = $nu.os-info.name == "macos" and $nu.os-info.family == "unix"
const _LauncherItemType_Shell = -1
const _LauncherItemType_CommandToShell = 0
const _LauncherItemType_OneShot = 1

# Special Menu Launcher
def "main launch" [] {
    # Shells and base apps
    mut special_menu = [
        [label args type];
        [
            "Tools - LazyGit"
            "go install github.com/jesseduffield/lazygit@latest; ~/go/bin/lazygit"
            $_LauncherItemType_OneShot
        ]
        [
            "PowerShell Core"
            "pwsh"
            $_LauncherItemType_Shell
        ]
        [
            "Nushell"
            "nu"
            $_LauncherItemType_Shell
        ]
        [
            "Hilbish"
            "hilbish"
            $_LauncherItemType_Shell
        ]
        [
            "Murex"
            "murex"
            $_LauncherItemType_Shell
        ]
    ]

    # Platform dependent shells
    if ($_IsWindows) {
        $special_menu = $special_menu ++ [
            [label args type];
            [
                "Windows PowerShell"
                "powershell"
                $_LauncherItemType_Shell
            ]
            [
                "Command Prompt"
                "cmd"
                $_LauncherItemType_Shell
            ]
            [
                "Bash"
                "bash"
                $_LauncherItemType_Shell
            ]
        ]
    }
    if ($_IsMacOS or $_IsLinux) {
        $special_menu = $special_menu ++ [
            [label args type];
            [
                "Bash"
                "bash"
                $_LauncherItemType_Shell
            ]
            [
                "Zsh"
                "zsh"
                $_LauncherItemType_Shell
            ]
            [
                "Fish"
                "fish"
                $_LauncherItemType_Shell
            ]
        ]
    }

    # Special Apps
    $special_menu = $special_menu ++ [
        [label args type];
        [
            "Nu Special - Checking Internet Connection"
            'tab-title "Checking Network Connection"; gping google.com store.steampowered.com 9.9.9.9 8.8.8.8 8.8.4.4 1.1.1.1'
            $_LauncherItemType_CommandToShell
        ]
        [
            "Nu Special - Checking Internet Connection - Buffer 5 minutes"
            'tab-title "Checking Network Connection - Buffer 5 min"; gping -b (60 * 5) google.com store.steampowered.com 9.9.9.9 8.8.8.8 8.8.4.4 1.1.1.1'
            $_LauncherItemType_CommandToShell
        ]
        [
            "Nu Special - Checking Internet Connection - Ping every 50ms"
            'tab-title "Checking Network Connection - Buffer 2 min"; gping -n 0.05 -b 60 google.com store.steampowered.com 9.9.9.9 8.8.8.8 8.8.4.4 1.1.1.1'
            $_LauncherItemType_CommandToShell
        ]
        [
            "Nu Special - Go into temporary directory"
            'tab-title "TMP"; Set-LocationToTemporaryDirectory'
            $_LauncherItemType_CommandToShell
        ]
        [
            "Nu Special - File Manager"
            'tab-title "FM"; fm'
            $_LauncherItemType_CommandToShell
        ]
    ]
    if ($_IsMacOS or $_IsLinux) {
        $special_menu = $special_menu ++ [
            [label args type];
            [
                "Nu Special - HTOP"
                'tab-title "HTOP"; sudo htop'
                $_LauncherItemType_CommandToShell
            ]
            [
                "Nu Special - BTM"
                'tab-title "BTM"; btm'
                $_LauncherItemType_CommandToShell
            ]
        ]
    }
    if ($_IsLinux) {
        $special_menu = $special_menu ++ [
            [label args type];
            [
                "Nu Special - Start GitAutoSync Deamon pwsh in TMUX (Use C-b d to detach)"
                'tab-title "GitAutoSync"; sudo systemctl stop GitAutoSyncPwshService;tmux new -s "GitAutoSync" ~/go/src/devops.patrykadamczyk.net/utility_scripts/git-auto-sync/deamon.ps1'
                $_LauncherItemType_CommandToShell
            ]
            [
                "Nu Special - Start GitAutoSync Deamon v2 task in TMUX (Use C-b d to detach)"
                'tab-title "GitAutoSync"; cd ~/go/src/devops.patrykadamczyk.net/utility_scripts/git-auto-sync-task; task tmux'
                $_LauncherItemType_CommandToShell
            ]
        ]
    }
    # Projects
    $special_menu = $special_menu ++ [
        [label args type];
        [
            "Nu Special Projects - Neovim"
            'tab-title "NeoVim"; c neovim'
            $_LauncherItemType_CommandToShell
        ]
        [
            "Nu Special Projects - Neorg"
            'tab-title "Neorg"; c neorg'
            $_LauncherItemType_CommandToShell
        ]
        [
            "Nu Special Projects - DevOps"
            'tab-title "DevOps"; c devops.patrykadamczyk.net'
            $_LauncherItemType_CommandToShell
        ]
        [
            "Nu Special Projects - DevOps LazyGit"
            'tab-title "DevOps LG"; c devops.patrykadamczyk.net; lazygit'
            $_LauncherItemType_CommandToShell
        ]
        [
            "Nu Special Projects - DevOps Go"
            'tab-title "DevOps Go"; c devops-go.patrykadamczyk.net'
            $_LauncherItemType_CommandToShell
        ]
        [
            "Nu Special Projects - DevOps Go LazyGit"
            'tab-title "DevOps Go LG"; c devops-go.patrykadamczyk.net; lazygit'
            $_LauncherItemType_CommandToShell
        ]
    ]

    # Choose
    let res = ($special_menu | input list -d label --fuzzy)

    if ($res | is-empty) {
        print "No selection found"
        return
    }

    # Run selected command

    # Type: 1 - One shot -c, -1 - Shell, 0 - Command to shell
    if ($res.type == 1) { # One shot -c
        # wezterm start --new-tab --cwd $env.PWD -- pwsh -Command $"($res.args)"
        wezterm start --new-tab --cwd $env.PWD -- nu -c $"($res.args)"
        # wezterm start --new-tab --cwd $env.PWD -- fish -c $"($res.args)"
    } else if ($res.type == -1) { # Shell
        wezterm start --new-tab --cwd $env.PWD -- $"($res.args)"
    } else { # Command to shell
        # wezterm start --new-tab --cwd $env.PWD -- pwsh -Command $"($res.args)"
        wezterm start --new-tab --cwd $env.PWD -- nu -e $"($res.args)"
        # wezterm start --new-tab --cwd $env.PWD -- fish -c $"($res.args)"
    }
}

# Projects Launcher
def "main projects" [
    --before (-b)
] {
    if ($before) {
        let title = (input "Choose title: ")
        let dir = (fd . --type d --max-depth 2 ~/go/src | fzf --prompt "Choose a directory: " --preview "tree -C -L 2 {}")
        wezterm start --new-tab --cwd $dir -- nu -e $"wezterm cli set-tab-title '($title)'"
    } else {
        wezterm start --new-tab --cwd $env.PWD -- nu -e "tab-title (input \"Choose title: \"); z (fd . --type d --max-depth 2 ~/go/src | fzf --prompt \"Choose a directory: \" --preview \"tree -C -L 2 {}\")"
    }
}

# Notes Launcher
def "main notes" [] {
    yazi ~/.config/neorg
}

