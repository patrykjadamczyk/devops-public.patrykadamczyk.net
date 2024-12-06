#!/usr/bin/env nu

# Lazygit
# TODO: Change to alias if I'll find a way to notify myself on updates
# alias lg = lazygit
def --env lg [
    ...$args
] {
    go install github.com/jesseduffield/lazygit@latest
    $in | lazygit ...$args
}
