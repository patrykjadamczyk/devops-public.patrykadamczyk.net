#!/usr/bin/env nu

# Parse tool using jc
def --env --wrapped "parse-tool" [
    ...args
] {
    return ($in | ^jc ...$args | from json)
}
