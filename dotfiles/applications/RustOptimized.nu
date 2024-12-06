#!/usr/bin/env nu

#### Packages
CARGO_TARGET_DIR="/tmp/cargo" RUSTFLAGS="-Z threads=8" cargo +nightly install --git https://github.com/MordechaiHadad/bob.git
CARGO_TARGET_DIR="/tmp/cargo" RUSTFLAGS="-Z threads=8" cargo +nightly install --git https://github.com/neovide/neovide.git
CARGO_TARGET_DIR="/tmp/cargo" RUSTFLAGS="-Z threads=8" cargo +nightly install lsd
CARGO_TARGET_DIR="/tmp/cargo" RUSTFLAGS="-Z threads=8" cargo +nightly install tree-sitter-cli
CARGO_TARGET_DIR="/tmp/cargo" RUSTFLAGS="-Z threads=8" cargo +nightly install create-tauri-app
CARGO_TARGET_DIR="/tmp/cargo" RUSTFLAGS="-Z threads=8" cargo +nightly install stylua --features lua52,lua53,lua54,luau
CARGO_TARGET_DIR="/tmp/cargo" RUSTFLAGS="-Z threads=8" cargo +nightly install just
CARGO_TARGET_DIR="/tmp/cargo" RUSTFLAGS="-Z threads=8" cargo +nightly install --locked navi
CARGO_TARGET_DIR="/tmp/cargo" RUSTFLAGS="-Z threads=8" cargo +nightly install --git https://github.com/cloudhead/rx --tag v0.5.2
CARGO_TARGET_DIR="/tmp/cargo" RUSTFLAGS="-Z threads=8" cargo +nightly install coreutils

