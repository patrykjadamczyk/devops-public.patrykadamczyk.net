set shell := ["nu", "-c"]

# Build project and debug it using gdb
[no-cd]
[group("debug")]
[doc("Debug project using gdb")]
debug-proj-using-gdb:
    cargo build
    gdb $"(fd . ./target/debug/ --type x | fzf)"


# Build project and debug it using lldb
[no-cd]
[group("debug")]
[doc("Debug project using lldb")]
debug-proj-using-lldb:
    cargo build
    rust-lldb $"(fd . ./target/debug/ --type x | fzf)"

# Format file using rustfmt
[no-cd]
[group("format")]
[doc("Format file using rustfmt")]
format-file FILE +arguments:
    cargo fmt -- {{FILE}} {{arguments}}

# Format project using rustfmt
[no-cd]
[group("format")]
[doc("Format project using rustfmt")]
format-proj +arguments:
    cargo fmt --all {{arguments}}

# Lint project using cargo check
[no-cd]
[group("lint")]
[doc("Lint project using cargo check")]
lint-proj-using-check +arguments:
    cargo check {{arguments}}

# Lint project using clippy
[no-cd]
[group("lint")]
[doc("Lint project using clippy")]
lint-proj-using-clippy +arguments:
    cargo clippy {{arguments}}

# Run project
[no-cd]
[group("run")]
[doc("Run project using cargo run")]
run +arguments:
    cargo run {{arguments}}

# Run project with code coverage
[no-cd]
[group("run")]
[doc("Run project with code coverage using cargo tarpaulin")]
run-with-coverage +arguments:
    print "Ensuring grcov is installed"
    if (which cargo-binstall | is-not-empty) { cargo binstall grcov } else { cargo install grcov }
    print "Cleaning build data"
    RUSTFLAGS="-C instrument-coverage" LLVM_PROFILE_FILE="default.profraw" cargo clean
    print "Building project"
    RUSTFLAGS="-C instrument-coverage" LLVM_PROFILE_FILE="default.profraw" cargo build
    print "Running tests"
    RUSTFLAGS="-C instrument-coverage" LLVM_PROFILE_FILE="default.profraw" cargo test
    print "Generating coverage report"
    RUSTFLAGS="-C instrument-coverage" LLVM_PROFILE_FILE="default.profraw" grcov -t html -b $"(fd . ./target/debug/ --type x | fzf)" .

# Run REPL
[no-cd]
[group("repl")]
[doc("Run rust REPL")]
repl +arguments:
    cargo install evcxr evcxr_repl
    evcxr {{arguments}}
