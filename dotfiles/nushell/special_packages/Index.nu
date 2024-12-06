#!/usr/bin/env nu

source (
    if $_IsWindows { "./windows_packages/Index.nu" }
    else if $_IsLinux { "./linux_packages/Index.nu" }
    else if $_IsMacOS { "./macos_packages/Index.nu" }
    else { "./other_packages/Index.nu"}
)
source "./env_packages/Index.nu"
# source "./pscript/Index.nu"
