#!/usr/bin/env nu

# cargo install nu --locked --features=dataframe
CARGO_TARGET_DIR="/tmp/cargo" RUSTFLAGS="-Z threads=8" cargo +nightly install nu --locked
# cargo install --git https://github.com/nushell/nushell.git nu --locked --features=dataframe

# cargo install nu_plugin_gstat
CARGO_TARGET_DIR="/tmp/cargo" RUSTFLAGS="-Z threads=8" cargo +nightly install nu_plugin_gstat

# cargo install nu_plugin_periodic_table
CARGO_TARGET_DIR="/tmp/cargo" RUSTFLAGS="-Z threads=8" cargo +nightly install nu_plugin_periodic_table

# cargo install nu_plugin_net
CARGO_TARGET_DIR="/tmp/cargo" RUSTFLAGS="-Z threads=8" cargo +nightly install nu_plugin_net

# cargo install nu_plugin_polars
CARGO_TARGET_DIR="/tmp/cargo" RUSTFLAGS="-Z threads=8" cargo +nightly install nu_plugin_polars --locked

# cargo install nu_plugin_query
CARGO_TARGET_DIR="/tmp/cargo" RUSTFLAGS="-Z threads=8" cargo +nightly install nu_plugin_query

# cargo install nu_plugin_explore_ir
CARGO_TARGET_DIR="/tmp/cargo" RUSTFLAGS="-Z threads=8" cargo +nightly install nu_plugin_explore_ir


nu -c "plugin add ~/.cargo/bin/nu_plugin_gstat"
nu -c "plugin add ~/.cargo/bin/nu_plugin_periodic_table"
nu -c "plugin add ~/.cargo/bin/nu_plugin_net"
nu -c "plugin add ~/.cargo/bin/nu_plugin_polars"
nu -c "plugin add ~/.cargo/bin/nu_plugin_query"
nu -c "plugin add ~/.cargo/bin/nu_plugin_explore_ir"
