#!/usr/bin/env nu

# Registers
# If called without arguments lists all registers that currently are saved
# If called with argument it executes best match register
def --env q [
    register?: string
] {
    if ($register | is-empty) {
        return (^navi --tag-rules='register' --path "~/.config/navi/registers")
    }
    return (^navi --path "~/.config/navi/registers" --query $"($register)" --best-match)
}

# Add command to registers without description
def --env "q a" [
    register: string, # Register name
    command: string # Command to save in the register
] {
    let path = "~/.config/navi/registers" | path expand
echo $"
% register

# Reg ($register)
($command)
" | save -f ($path | path join $"($register).cheat")
}

# Add registers
def --env "q add" [
    register: string, # Register name
    description: string, # Description of code in the register
    command: string # Command to save in the register
] {
    let path = "~/.config/navi/registers" | path expand
echo $"
% register

# Reg ($register): ($description)
($command)
" | save -f ($path | path join $"($register).cheat")
}
