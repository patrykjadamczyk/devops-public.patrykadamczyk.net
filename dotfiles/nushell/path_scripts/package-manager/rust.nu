#!/usr/bin/env nu

source ./_vars.nu

# Status of RUST Package Manager
def --env "main status rust" [] {
    return ((which rustc | is-not-empty) and (which cargo | is-not-empty))
}

# Check if you can use rust nightly
def --env "main status rust nightly" [] {
    if ((main status rust) == false) {
        return false
    }
    if ($_PatPackageManagerRustNightly == false) {
        return false
    }
    try {
        cargo +nightly version | complete
        return true
    } catch {
        return false
    }
}

# Check if you can use scache for compiler cache
def --env "main status rust scache" [] {
    if ((main status rust) == false) {
        return false
    }
    if ($_PatPackageManagerRustSCache == false) {
        return false
    }
    return (which scache | is-not-empty)
}

# Check if you can use cargo binstall for faster installations
def --env "main status rust binstall" [] {
    if ((main status rust) == false) {
        return false
    }
    if ($_PatPackageManagerRustBinstall == false) {
        return false
    }
    return (which cargo-binstall | is-not-empty)
}

# Check if you can use cargo quickinstall for faster installations
def --env "main status rust quickinstall" [] {
    if ((main status rust) == false) {
        return false
    }
    if ($_PatPackageManagerRustQuickinstall == false) {
        return false
    }
    return (which cargo-quickinstall | is-not-empty)
}

# Check if you can use cargo install-update for faster installations and updates
def --env "main status rust cargo-update" [] {
    if ((main status rust) == false) {
        return false
    }
    if ($_PatPackageManagerRustCargoUpdate == false) {
        return false
    }
    return ((which cargo-install-update | is-not-empty) and (which cargo-install-update-config | is-not-empty))
}

# Install package using RUST
def --env "main install rust" [$package: string] {
    if ((main status rust) == false) {
        return false
    }
    # Set environment
    let IsNightly = main status rust nightly
    if ($_PatPackageManagerRustCache == true) {
        $env.CARGO_TARGET_DIR = "/tmp/cargo"
    }
    if ($IsNightly == true) {
        $env.RUSTFLAGS = $"-Z threads=($_PatPackageManagerRustThreads)"
    }
    if ((main status rust scache) == true) {
        $env.RUSTC_WRAPPER = (which sccache | first).path
    }
    # Install
    if ($IsNightly == true) {
        if ((main status rust binstall) == true) {
            ^cargo +nightly binstall $package
        } else if ((main status rust quickinstall) == true) {
            ^cargo +nightly quickinstall $package
        } else if ((main status rust cargo-update) == true) {
            ^cargo +nightly install-update -i $package
        } else {
            ^cargo +nightly install $package
        }
    } else {
        if ((main status rust binstall) == true) {
            ^cargo binstall $package
        } else if ((main status rust quickinstall) == true) {
            ^cargo quickinstall $package
        } else if ((main status rust cargo-update) == true) {
            ^cargo install-update -i $package
        } else {
            ^cargo install $package
        }
    }
    return true
}

# Update package using RUST
def --env "main update rust" [$package: string] {
    if ((main status rust) == false) {
        return false
    }
    # Set environment
    let IsNightly = main status rust nightly
    if ($_PatPackageManagerRustCache == true) {
        $env.CARGO_TARGET_DIR = "/tmp/cargo"
    }
    if ($IsNightly == true) {
        $env.RUSTFLAGS = $"-Z threads=($_PatPackageManagerRustThreads)"
    }
    if ((main status rust scache) == true) {
        $env.RUSTC_WRAPPER = (which sccache | first).path
    }
    # Update
    if ($IsNightly == true) {
        if ((main status rust cargo-update) == true) {
            ^cargo +nightly install-update -i $package
        } else if ((main status rust binstall) == true) {
            ^cargo +nightly binstall $package
        } else if ((main status rust quickinstall) == true) {
            ^cargo +nightly quickinstall $package
        } else {
            ^cargo +nightly install $package
        }
    } else {
        if ((main status rust cargo-update) == true) {
            ^cargo install-update -i $package
        } else if ((main status rust binstall) == true) {
            ^cargo binstall $package
        } else if ((main status rust quickinstall) == true) {
            ^cargo quickinstall $package
        } else {
            ^cargo install $package
        }
    }
    return true
}

# Uninstall package using RUST
def --env "main uninstall rust" [$package: string] {
    if ((main status rust) == false) {
        return false
    }
    # Set environment
    let IsNightly = main status rust nightly
    if ($IsNightly == true) {
        $env.RUSTFLAGS = $"-Z threads=($_PatPackageManagerRustThreads)"
    }
    # Uninstall
    if ($IsNightly == true) {
        ^cargo +nightly uninstall $package
    } else {
        ^cargo uninstall $package
    }
    return true
}

# Upgrade rust compiler
def --env "main upgrade-self rust" [] {
    if (((main status rust) == false) or (which rustup | is-empty)) {
        return false
    }
    if ((main status rust nightly) == true) {
        ^rustup update nightly
    }
    ^rustup update stable
    return true
}

# Upgrade packages using RUST
def --env "main upgrade rust" [] {
    if ((main status rust) == false) {
        return false
    }
    # Set environment
    let IsNightly = main status rust nightly
    if ($_PatPackageManagerRustCache == true) {
        $env.CARGO_TARGET_DIR = "/tmp/cargo"
    }
    if ($IsNightly == true) {
        $env.RUSTFLAGS = $"-Z threads=($_PatPackageManagerRustThreads)"
    }
    if ((main status rust scache) == true) {
        $env.RUSTC_WRAPPER = (which sccache | first).path
    }
    # Update
    ## Update using cargo-update (short circuit)
    if ((main status rust cargo-update) == true) {
        if ($IsNightly == true) {
            ^cargo +nightly install-update -a
        } else {
            ^cargo install-update -a
        }
        return true
    }
    ## Update using magic
    let packages = (
        open ~/.cargo/.crates2.json
            | each { $in.installs } # Get installed packages
            | columns # Get names of packages in format "pkg ver (url)"
            | each { $in | split row " " | first } # Get only name of package
    )
    if ($IsNightly == true) {
        if ((main status rust binstall) == true) {
            $packages | each { ^cargo +nightly binstall $in }
        } else if ((main status rust quickinstall) == true) {
            $packages | each { ^cargo +nightly quickinstall $in }
        } else {
            $packages | each { ^cargo +nightly install $in }
        }
    } else {
        if ((main status rust binstall) == true) {
            $packages | each { ^cargo binstall $in }
        } else if ((main status rust quickinstall) == true) {
            $packages | each { ^cargo quickinstall $in }
        } else {
            $packages | each { ^cargo install $in }
        }
    }
    return true
}

# Update lockfile of RUST in dotfiles
def --env "main update-lockfile rust" [] {
    if ((main status rust) == false) {
        return false
    }
    let base_path = ($"($_PatLockfilesBasePath)rust" | path expand)
    let json_path = $"($base_path)/.crates2.json"
    let toml_path = $"($base_path)/.crates.toml"
    mkdir $base_path
    print $"Copying cargo lock files..."
    cp ~/.cargo/.crates2.json $json_path
    cp ~/.cargo/.crates.toml $toml_path
    print "Lockfile updated"
    return true
}
