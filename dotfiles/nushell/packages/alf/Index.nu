#!/usr/bin/env nu

if ($_IsWindows == false) {
    # All groups
    def --env all-groups [] {
        cat /etc/group
            | split row "\n"
            | each { $in | split row ":" | first }
        | sort
    }
}

# Go to directory of projects
def --env cdp [] {
    cd ~/go/src
    clear
    pwd
}

# Go to directory
def --env c [$directory: string] {
    if (which z | is-not-empty) {
        z $directory
    } else {
        cd $directory
    }
    clear
    pwd
}

# Count files in directory (if not specified it uses current directory)
def --env count [$directory?: string] {
    mut dir = "."
    if ($directory | is-not-empty) {
        $dir = $directory
    }
    return (ls $dir | length)
}

# Change permissions
alias cm = chmod

# Change permissions recursively
alias cmr = chmod -R

# Change owner
alias co = chown

# Change owner recursively
alias cor = chown -R



# Docker
alias d = docker

# List docker containers with IDs, Names, Status and Ports
def --env --wrapped "d psf" [...$args] {
    docker ps --format "{{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}" ...$args
        | prepend "ID\tNames\tStatus\tPorts"
        | str join "\n"
        | from tsv
}

# List all docker containers with Names,Status,IDs
def --env --wrapped "d paf" [...$args] {
    docker ps -a --format="{{.Names}}\t{{.Status}}\t{{.ID}}" ...$args
        | prepend "Names\tStatus\tID"
        | str join "\n"
        | from tsv
}

# List all docker containers with default format but returning nu object
def --env --wrapped "d p" [...$args] {
    docker ps -a --format='{{.ID}}\t{{.Image}}\t{{.Command}}\t{{.CreatedAt}}\t{{.Status}}\t{{.Ports}}\t{{.Names}}' ...$args
        | prepend "ID\tImage\tCommand\tCreated\tStatus\tPorts\tNames"
        | str join "\n"
        | from tsv
}

# Clean docker
def --env --wrapped "d clean" [...$args] {
    docker system prune -f ...$args
}

# List images with Repository,Tag,Size
def --env --wrapped "d i" [...$args] {
    docker images --format "{{.Repository}}\t{{.Tag}}\t{{.Size}}" ...$args
        | prepend "Repository\tTag\tSize"
        | str join "\n"
        | from tsv
}

# docker network
def --env --wrapped "d n" [...$args] {
    docker network ...$args
}

# Remove images
def --env --wrapped "d rmi" [
    $pattern: string, # Pattern to remove
    ...$args # Arguments to images command
] {
    docker images --format "{{.Repository}}:{{.Tag}}" ...$args
        | split row "\n"
        | filter { $in =~ $pattern }
        | each { docker rmi -f $in }
}

# Remove volumes
def --env --wrapped "d rmv" [
    $pattern: string, # Pattern to remove
    ...$args # Arguments to volumes command
] {
    docker volume ls --format "{{.Name}}" ...$args
        | split row "\n"
        | filter { $in =~ $pattern }
        | each { docker volume rm -f $in }
}

# docker volume
def --env --wrapped "d v" [...$args] {
    docker volume ...$args
}

# docker run interactively and remove after
def --env --wrapped "d r" [...$args] {
    docker run -it --rm ...$args
}

# List replicas
def --env --wrapped "d replicas" [...$args] {
    docker service ls --format='{{.Name}}\t{{.Mode}}\t{{.Replicas}}' ...$args
        | prepend "Name\tMode\tReplicas"
        | str join "\n"
        | from tsv
}

# docker service
def --env --wrapped "d s" [...$args] {
    docker service ...$args
}

# docker stack
def --env --wrapped "d st" [...$args] {
    docker stack ...$args
}

# List all images and their size
def --env --wrapped "d size" [...$args] {
    docker images --format "{{.Size}}\t{{.Repository}}:{{.Tag}}"
        | prepend "Size\tImage"
        | str join "\n"
        | from tsv
        | each { return {Image: $in.Image, Size: ($in.Size | into filesize)}}
        | sort-by Size --reverse
}

# Get stats of containers
def --env --wrapped "d stats" [...$args] {
    docker stats --format "{{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}" --no-stream ...$args
        | prepend "Name\tCPU\tRAM"
        | str join "\n"
        | from tsv
}

# Get stats of containers and follow them
def --env --wrapped "d watch-stats" [...$args] {
    docker stats --format "{{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}" ...$args
}



# Docker Compose
alias dc = docker compose

# Run docker-compose project in detached mode
def --env --wrapped "dc ud" [...$args] {
    dc up -d ...$args
}

# Run docker-compose project in detached mode and force rebuild
def --env --wrapped "dc ub" [...$args] {
    dc up -d --build ...$args
}

# Run docker-compose project in detached mode and force recreate
def --env --wrapped "dc ur" [...$args] {
    dc up -d --force-recreate ...$args
}

# Run docker-compose project in detached mode, force recreate and rebuild
def --env --wrapped "dc ubr" [...$args] {
    dc up -d --build --force-recreate ...$args
}

# Run docker-compose project
def --env --wrapped "dc u" [...$args] {
    dc up ...$args
}

# Run command in container of docker-compose project
def --env --wrapped "dc e" [
    $container: string,
    ...$args
] {
    dc exec $container ...$args
}

# Run bash in container of docker-compose project
def --env --wrapped "dc eb" [
    $container: string,
    ...$args
] {
    dc exec $container /bin/bash ...$args
}

# Run command in container of docker-compose project
def --env --wrapped "dc r" [
    $container: string,
    ...$args
] {
    dc run --rm $container ...$args
}

# Run command in container of docker-compose project
def --env --wrapped "dc rb" [
    $container: string,
    ...$args
] {
    dc run --rm $container /bin/bash ...$args
}

# Kill docker-compose project
def --env --wrapped "dc d" [...$args] {
    dc down ...$args
}

# Open Apache 2 Error log in container of docker-compose project
def --env --wrapped "dc sael" [
    $container: string,
    ...$args
] {
    dc exec $container cat /var/log/apache2/error.log ...$args
}

# Watch Apache 2 Error log in container of docker-compose project
def --env --wrapped "dc stael" [
    $container: string,
    ...$args
] {
    dc exec $container tail -f /var/log/apache2/error.log ...$args
}

# Watch log of docker-compose project
def --env --wrapped "dc lf" [...$args] {
    dc logs -f ...$args
}



# Watch log of docker-compose project
def --env --wrapped "dclf" [...$args] {
    dc logs -f ...$args
}

# Disk usage
#def --env "df" [] {
#    return (sys | get disks)
#}

# Disk usage
def --env "dfh" [] {
    return (
        df
            | each {
                $in
                    | update 1k_blocks ($in.1k_blocks * 1024 | into filesize)
                    | update used ($in.used * 1024 | into filesize)
                    | update available ($in.available * 1024 | into filesize)
                    | rename --column { 1k_blocks: size }
            }
    )
}

# Disk usage without tmpfs, udev, /dev/loop
def --env "dfhd" [] {
    return (
        dfh
            | where filesystem !~ "tmpfs"
            | where filesystem !~ "udev"
            | where filesystem !~ "/dev/loop"
    )
}

# # Disk usage
# def --env --wrapped "dfh" [...$args] {
#     let string_args = ($args | str join " ")
#     pwsh -Command $"dfh ($string_args)"
# }
#
# # Disk usage without tmpfs, udev, /dev/loop
# def --env --wrapped "dfhd" [...$args] {
#     let string_args = ($args | str join " ")
#     pwsh -Command $"dfhd ($string_args)"
# }

# Check disk usage of current directory for total use `duh | select physical apparent | math sum`
alias duh = du -a

# Get current running containers in docker
alias dps = docker ps

# Get all containers in docker
alias dpsa = docker ps -a

# Push git repository
alias gg = git push

# Push git repository and tag
def --env --wrapped "ggt" [...$args] {
    git push
    if ($env.LAST_EXIT_CODE == 0) {
        git push --tag ...$args
    }
}

# Pull git repository
alias gpl = git pull

# Kill program that uses specified port
def --env "killport" [$port: string] {
    pwsh -Command $"killport ($port)"
}

# List all files
alias l = ls -a

# List all files using exa (eza)
alias le = exa -lah

# Pull git repository
def --env --wrapped "nv" [...$args] {
    env | fzf ...$args
}

# Find process
def --env "psf" [$pattern: string] {
    pwsh -Command $"psf ($pattern)"
}

# Repeat specified segment
def --env repeat [$repeat_number: int, $repeat_block] {
    seq 1 $repeat_number | each $repeat_block
}

# Repeat specified segment
def --env repeat0 [$repeat_number: int, $repeat_block] {
    seq 0 ($repeat_number - 1) | each $repeat_block
}

# Clear screen
def --env r [] {
    # Before 0.98 (changing clear behaviour)
    # clear

    # After 0.98
    # Clear screen and scrollback
    clear
    # Clear screen again to remove artifacts (because of scrollback)
    clear --keep-scrollback
}

# Set title
def --env title [$title: string] {
    # echo $"\e]0;($title)\e\\"
    print $"(ansi title)($title)(ansi st)"
}

# Set title using WezTerm CLI
alias tab-title = wezterm cli set-tab-title
# def --env tab-title [$title: string] {
#     wezterm cli set-tab-title $title
# }

# Run superlinter on current directory
def --env --wrapped "superlinter" [...$args] {
    docker pull github/super-linter:latest
    docker run -e RUN_LOCAL=true -v "${PWD}:/tmp/lint" github/super-linter
}

# Check version of system
# alias ver = neofetch
alias ver = fastfetch

# Run pwbs task
alias p = pwbs

# Editor
alias ed = nvim

# NeoVim
alias n = nvim

# NeoVim GUI
alias nn = neovide

# Lite NeoVim
# NOTE: This does not work at all
# alias lln = NVIM_APPNAME="neovim/configs/lazyvim" nvim
def --env --wrapped "lln" [...$args] {
    $env.NVIM_APPNAME = "neovim/configs/lazyvim"
    $in | nvim ...$args
    $env.NVIM_APPNAME = ""
}

# Lite NeoVim GUI
def --env --wrapped "lnn" [...$args] {
    $env.NVIM_APPNAME = "neovim/configs/lazyvim"
    $in | neovide ...$args
    $env.NVIM_APPNAME = ""
}

# LazyVim
def --env --wrapped "lazyvim" [...$args] {
    $env.NVIM_APPNAME = "neovim/configs/lazyvim"
    $in | nvim ...$args
    $env.NVIM_APPNAME = ""
}

# LazyVim
def --env --wrapped "lazyneovide" [...$args] {
    $env.NVIM_APPNAME = "neovim/configs/lazyvim"
    $in | neovide ...$args
    $env.NVIM_APPNAME = ""
}

# MiniNvim
def --env --wrapped "mininvim" [...$args] {
    $env.NVIM_APPNAME = "neovim/configs/mini_nvim"
    $in | nvim ...$args
    $env.NVIM_APPNAME = ""
}

# MiniNvim
def --env --wrapped "minineovide" [...$args] {
    $env.NVIM_APPNAME = "neovim/configs/mini_nvim"
    $in | neovide ...$args
    $env.NVIM_APPNAME = ""
}

# NeoVim
alias nvc = nvim --clean

# loop_infinite -> use loop instead

if ($_IsLinux) {
    # Check from which package something is
    alias which_package = dpkg -S
}

# Run watcher that refreshes every second
# NOTE: DO NOT USE ECHO use print instead
def --env "w" [$repeat_block] {
    mut i = 1
    loop {
        # clear
        r
        seq 1 1 | each $repeat_block | each { print $in }
        print $"Rendered ($i) time"
        sleep 1sec
        $i = $i + 1
    }
}

# Run watcher for disk space
def --env --wrapped "w dfh" [...$args] {
    mut i = 1
    loop {
        # clear
        r
        if ($_IsWindows) {
            # dfh ...$args
            dfh
        } else {
            ^df -h ...$args
        }
        print $"Rendered ($i) time"
        sleep 1sec
        $i = $i + 1
    }
}

# Run watcher for docker-compose ps
def --env --wrapped "w dc-ps" [...$args] {
    mut i = 1
    loop {
        # clear
        r
        dc ps ...$args
        print $"Rendered ($i) time"
        sleep 1sec
        $i = $i + 1
    }
}

# Run watcher for ls
def --env --wrapped "w ls" [...$args] {
    mut i = 1
    loop {
        # clear
        r
        exa -lah ...$args
        print $"Rendered ($i) time"
        sleep 1sec
        $i = $i + 1
    }
}
