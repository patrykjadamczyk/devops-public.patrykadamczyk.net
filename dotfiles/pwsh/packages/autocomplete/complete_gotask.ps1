#!/usr/bin/env pwsh
if (Test-Path ~/go/pkg/mod/github.com/go-task/task/v3@v3.34.1/completion/ps/task.ps1) {
    Invoke-Expression -Command ~/go/pkg/mod/github.com/go-task/task/v3@v3.34.1/completion/ps/task.ps1
}
