#!/usr/bin/env nu

source ./got.nu
source ./go-mod-update.nu
source ./Neovim.nu
source ./notify.nu
source ./sttr.nu
source ./timer.nu
source ./timezone.nu
source ./wlf.nu
source ./lazydocker.nu
source ./dog.nu
source ./flamegraph.nu
source ./fopen.nu
source ./registers.nu
source ./spotify.nu

# Aliases
alias ZZ = exit
alias ZQ = exit
# alias nu-cd = cd
# alias cd = z

alias J = just
alias JG = just -g
# Run tasks using just but with env support
def --env --wrapped "j" [-j, ...$args] {
    if ($j) {
        just ...$args
        return
    }
    try {
        if ($args | is-empty) {
            just env default
            return
        } else {
            just ...($args
                | each { # add env prefix to every task argument
                    if ($in | str starts-with "-") {
                        echo $in
                    } else {
                        echo $"env ($in)"
                    }
                }
                | each { split row " " } # split into separate arguments (just doesnt understand task if you dont do that)
                | flatten # flatten table so its single array of arguments
            )
            return
        }
    } catch {
        just ...$args
        return
    }
}
