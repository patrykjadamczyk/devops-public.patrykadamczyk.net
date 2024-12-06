#!/usr/bin/env pwsh
. "$PSScriptRoot\..\cmdletlib\Test-Command.ps1"
function Global:repl (
    [Parameter(Position=0, Mandatory=$true)]
    [ValidateSet(
        "C#",
        "F#",
        "PowerShell",
        "PWSH",
        "js.net",
        "sql.net",
        "md.net",
        "html.net",
        "kql.net",
        "ask.net",
        "http.net",
        "python",
        "node.js",
        "golang",
        "go",
        "php",
        "rust",
        IgnoreCase
    )]
    [String] $Language,
    [Parameter(Position=1,ValueFromRemainingArguments)]
    [string[]]$AdditionalArgs
) {
    switch ($Language.ToLowerInvariant()) {
        "c#" {
            dotnet repl --default-kernel csharp $AdditionalArgs
        }
        "f#" {
            dotnet repl --default-kernel fsharp $AdditionalArgs
        }
        "powershell" {
            dotnet repl --default-kernel pwsh $AdditionalArgs
        }
        "pwsh" {
            dotnet repl --default-kernel pwsh $AdditionalArgs
        }
        "js.net" {
            dotnet repl --default-kernel javascript $AdditionalArgs
        }
        "html.net" {
            dotnet repl --default-kernel html $AdditionalArgs
        }
        "sql.net" {
            Write-Host -ForegroundColor Red "After repl starting you need to run command: '#!sql'"
            dotnet repl $AdditionalArgs
        }
        "md.net" {
            Write-Host -ForegroundColor Red "After repl starting you need to run command: '#!markdown'"
            dotnet repl $AdditionalArgs
        }
        "kql.net" {
            Write-Host -ForegroundColor Red "After repl starting you need to run command: '#!kql'"
            dotnet repl $AdditionalArgs
        }
        "ask.net" {
            Write-Host -ForegroundColor Red "After repl starting you need to run command: '#!ask'"
            dotnet repl $AdditionalArgs
        }
        "http.net" {
            Write-Host -ForegroundColor Red "After repl starting you need to run command: '#!http'"
            dotnet repl $AdditionalArgs
        }
        "python" {
            if (Test-Command ipython) {
                ipython $AdditionalArgs
            } else {
                python $AdditionalArgs
            }
        }
        "nodejs" {
            node $AdditionalArgs
        }
        "golang" {
            if (-not (Test-Command gore)) {
                go install github.com/x-motemen/gore/cmd/gore@latest
            }
            gore $AdditionalArgs
        }
        "go" {
            if (-not (Test-Command gore)) {
                go install github.com/x-motemen/gore/cmd/gore@latest
            }
            gore $AdditionalArgs
        }
        "php" {
            php -a $AdditionalArgs
        }
        "rust" {
            cargo install evcxr evcxr_repl
            evcxr $AdditionalArgs
        }
    }
}
