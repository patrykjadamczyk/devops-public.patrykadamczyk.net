#!/usr/bin/env nu

if (which atuin | is-empty) {
    return
}

# if (("~/.config/nushell/packages/_atuin/hook.nu" | path expand | path exists) != true) {
#     atuin init nu | save ~/.config/nushell/packages/_atuin/hook.nu
#     print "Restart shell to load atuin"
#     return
# }
#
# if (("~/.config/nushell/packages/_atuin/completion.nu" | path expand | path exists) != true) {
#     atuin gen-completions --shell nushell | save ~/.config/nushell/packages/_atuin/completion.nu
#     print "Restart shell to load atuin completions"
#     return
# }

# Notes on atuin
# Ctrl-R in atuin switches filter mode
# Ctrl-S in atuin switches search mode
# Ctrl-C/Ctrl-D/Ctrl-G/Esc return original
# Ctrl-o in atuin opens inspector

source ./hook.nu

use ./completion.nu *
