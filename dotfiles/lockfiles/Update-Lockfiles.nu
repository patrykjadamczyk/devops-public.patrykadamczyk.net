#!/usr/bin/env nu
let path = $"($env.FILE_PWD)/"
print $"Copying cargo lock files..."
cp ~/.cargo/.crates2.json $path
cp ~/.cargo/.crates.toml $path
