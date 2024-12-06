#!/usr/bin/env nu

def --env --wrapped "Run-DockerShellImage" [
    $Distribution: string = "ubuntu",
    ...$rest
] {
    match $Distribution {
        "ubuntu" => {
            docker pull "ubuntu:latest"
            docker run -it --rm -v $"(pwd):/pwd" "ubuntu:latest" ...$rest
        },
        "debian" => {
            docker pull "debian:latest"
            docker run -it --rm -v $"(pwd):/pwd" "debian:latest" ...$rest
        },
        "arch" => {
            docker pull "archlinux:latest"
            docker run -it --rm -v $"(pwd):/pwd" "archlinux:latest" ...$rest
        },
        "brew" | "macos" => {
            docker pull "homebrew/brew:latest"
            docker run -it --rm -v $"(pwd):/pwd" "homebrew/brew:latest" ...$rest
        },
        "alpine" => {
            docker pull "alpine:latest"
            docker run -it --rm -v $"(pwd):/pwd" "alpine:latest" ...$rest
        },
        "centos" | "centos7" => {
            docker pull "centos:7"
            docker run -it --rm -v $"(pwd):/pwd" "centos:7" ...$rest
        },
        "centos8" => {
            docker pull "centos:8"
            docker run -it --rm -v $"(pwd):/pwd" "centos:8" ...$rest
        },
        "fedora" => {
            docker pull "fedora:latest"
            docker run -it --rm -v $"(pwd):/pwd" "fedora:latest" ...$rest
        },
        "superlinter" => {
            docker pull "github/super-linter:latest"
            docker run -it --rm -e RUN_LOCAL=true -v $"(pwd):/tmp/lint" "github/super-linter:latest" ...$rest
        },
        "nixos" | "nix" => {
            docker pull "ghcr.io/nixos/nix:latest"
            docker run -it --rm -v $"(pwd):/pwd" "ghcr.io/nixos/nix:latest" ...$rest
        },
        _ => {
            docker pull $Distribution
            docker run -it --rm -v $"(pwd):/pwd" $Distribution ...$rest
        }
    }
}
