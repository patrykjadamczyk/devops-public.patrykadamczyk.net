#!/usr/bin/env nu

# Run REPL of specified language
def --env --wrapped "repl" [
    $language: string,
    ...$rest
] {
    match ($language | str downcase) {
        "c#" => {
            dotnet repl --default-kernel csharp ...$rest
        },
        "f#" => {
            dotnet repl --default-kernel fsharp ...$rest
        },
        "powershell" => {
            dotnet repl --default-kernel pwsh ...$rest
        },
        "pwsh" => {
            dotnet repl --default-kernel pwsh ...$rest
        },
        "js.net" => {
            dotnet repl --default-kernel javascript ...$rest
        },
        "html.net" => {
            dotnet repl --default-kernel html ...$rest
        },
        "sql.net" => {
            print $"(ansi red)After repl starting you need to run command: '#!sql'(ansi reset)"
            dotnet repl ...$rest
        },
        "md.net" => {
            print $"(ansi red)After repl starting you need to run command: '#!markdown'(ansi reset)"
            dotnet repl ...$rest
        },
        "kql.net" => {
            print $"(ansi red)After repl starting you need to run command: '#!kql'(ansi reset)"
            dotnet repl ...$rest
        },
        "ask.net" => {
            print $"(ansi red)After repl starting you need to run command: '#!ask'(ansi reset)"
            dotnet repl ...$rest
        },
        "http.net" => {
            print $"(ansi red)After repl starting you need to run command: '#!http'(ansi reset)"
            dotnet repl ...$rest
        },
        "python" => {
            if (which ipython | is-not-empty) {
                ipython ...$rest
            } else {
                python ...$rest
            }
        },
        "python3" => {
            if (which ipython | is-not-empty) {
                ipython ...$rest
            } else {
                python3 ...$rest
            }
        },
        "golang" => {
            if (which gore | is-empty) {
                go install github.com/x-motemen/gore/cmd/gore@latest
            }
            gore ...$rest
        },
        "node" => {
            node ...$rest
        },
        "nodejs" => {
            node ...$rest
        },
        "php" => {
            php -a ...$rest
        },
        "rust" => {
            if (which cargo-binstall | is-not-empty) {
                cargo binstall evcxr evcxr_repl
            } else if (which cargo-quickinstall | is-not-empty) {
                cargo quickinstall evcxr evcxr_repl
            } else {
                cargo install evcxr evcxr_repl
            }
            evcxr ...$rest
        },
        "irust" => {
            if (which cargo-binstall | is-not-empty) {
                cargo binstall irust
            } else if (which cargo-quickinstall | is-not-empty) {
                cargo quickinstall irust
            } else {
                cargo install irust
            }
            irust ...$rest
        },
        "lua" => {
            lua ...$rest
        },
        "luajit" => {
            luajit ...$rest
        },
        _ => {
            print $"(ansi red)Unknown language: ($language)(ansi reset)"
        }
    }
}
