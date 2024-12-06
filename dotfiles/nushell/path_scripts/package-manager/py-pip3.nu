#!/usr/bin/env nu

source ./_vars.nu

# Status of PIP Package Manager
def --env "main status pip" [] {
    return ((which pip3 | is-not-empty) or (which pip | is-not-empty))
}

# Install package using PIP
def --env "main install pip" [$package: string] {
    if ((main status pip) == false) {
        return false
    }
    if (which pip3 | is-not-empty) {
        ^pip3 install $package
    } else {
        ^pip install $package
    }
    return true
}

# Update package using PIP
def --env "main update pip" [$package: string] {
    if ((main status pip) == false) {
        return false
    }
    if (which pip3 | is-not-empty) {
        ^pip3 install --upgrade $package
    } else {
        ^pip install --upgrade $package
    }
    return true
}

# Uninstall package using PIP
def --env "main uninstall pip" [$package: string] {
    if ((main status pip) == false) {
        return false
    }
    if (which pip3 | is-not-empty) {
        ^pip3 uninstall $package
    } else {
        ^pip uninstall $package
    }
    return true
}

# Upgrade packages using PIP
def --env "main upgrade pip" [] {
    if ((main status pip) == false) {
        return false
    }
    let temp_requirements = (mktemp -t --suffix .txt)
    if (which pip3 | is-not-empty) {
        ^pip3 freeze | str replace -a "==" ">=" | save -f $temp_requirements
        ^pip3 install --upgrade -r $temp_requirements
    } else {
        ^pip freeze | str replace -a "==" ">=" | save -f $temp_requirements
        ^pip install --upgrade -r $temp_requirements
    }
    rm $temp_requirements
    return true
}

# Update lockfile of PIP in dotfiles
def --env "main update-lockfile pip" [] {
    if ((main status pip) == false) {
        return false
    }
    const path = ($"($_PatLockfilesBasePath)pip.txt" | path expand)
    mkdir ($_PatLockfilesBasePath | path expand)
    print $"Updating lockfile at: ($path)"
    if (which pip3 | is-not-empty) {
        ^pip3 freeze | save -f $path
    } else {
        ^pip freeze | save -f $path
    }
    print "Lockfile updated"
    return true
}
