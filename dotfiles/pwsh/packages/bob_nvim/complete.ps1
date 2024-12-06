#!/usr/bin/env pwsh

using namespace System.Management.Automation
using namespace System.Management.Automation.Language

Register-ArgumentCompleter -Native -CommandName 'bob' -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)

    $commandElements = $commandAst.CommandElements
    $command = @(
        'bob'
        for ($i = 1; $i -lt $commandElements.Count; $i++) {
            $element = $commandElements[$i]
            if ($element -isnot [StringConstantExpressionAst] -or
                $element.StringConstantType -ne [StringConstantType]::BareWord -or
                $element.Value.StartsWith('-') -or
                $element.Value -eq $wordToComplete) {
                break
        }
        $element.Value
    }) -join ';'

    $completions = @(switch ($command) {
        'bob' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('use', 'use', [CompletionResultType]::ParameterValue, 'Switch to the specified version, by default will auto-invoke install command if the version is not installed already')
            [CompletionResult]::new('install', 'install', [CompletionResultType]::ParameterValue, 'Install the specified version, can also be used to update out-of-date nightly version')
            [CompletionResult]::new('sync', 'sync', [CompletionResultType]::ParameterValue, 'If Config::version_sync_file_location is set, the version in that file will be parsed and installed')
            [CompletionResult]::new('uninstall', 'uninstall', [CompletionResultType]::ParameterValue, 'Uninstall the specified version')
            [CompletionResult]::new('rollback', 'rollback', [CompletionResultType]::ParameterValue, 'Rollback to an existing nightly rollback')
            [CompletionResult]::new('erase', 'erase', [CompletionResultType]::ParameterValue, 'Erase any change bob ever made, including neovim installation, neovim version downloads and registry changes')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List all installed and used versions')
            [CompletionResult]::new('complete', 'complete', [CompletionResultType]::ParameterValue, 'Generate shell completion')
            [CompletionResult]::new('update', 'update', [CompletionResultType]::ParameterValue, 'Update existing version')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'bob;use' {
            [CompletionResult]::new('-n', 'n', [CompletionResultType]::ParameterName, 'Whether not to auto-invoke install command')
            [CompletionResult]::new('--no-install', 'no-install', [CompletionResultType]::ParameterName, 'Whether not to auto-invoke install command')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'bob;install' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'bob;sync' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'bob;uninstall' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'bob;rollback' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'bob;erase' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'bob;list' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'bob;complete' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'bob;update' {
            [CompletionResult]::new('-a', 'a', [CompletionResultType]::ParameterName, 'Apply the update to all versions')
            [CompletionResult]::new('--all', 'all', [CompletionResultType]::ParameterName, 'Apply the update to all versions')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'bob;help' {
            [CompletionResult]::new('use', 'use', [CompletionResultType]::ParameterValue, 'Switch to the specified version, by default will auto-invoke install command if the version is not installed already')
            [CompletionResult]::new('install', 'install', [CompletionResultType]::ParameterValue, 'Install the specified version, can also be used to update out-of-date nightly version')
            [CompletionResult]::new('sync', 'sync', [CompletionResultType]::ParameterValue, 'If Config::version_sync_file_location is set, the version in that file will be parsed and installed')
            [CompletionResult]::new('uninstall', 'uninstall', [CompletionResultType]::ParameterValue, 'Uninstall the specified version')
            [CompletionResult]::new('rollback', 'rollback', [CompletionResultType]::ParameterValue, 'Rollback to an existing nightly rollback')
            [CompletionResult]::new('erase', 'erase', [CompletionResultType]::ParameterValue, 'Erase any change bob ever made, including neovim installation, neovim version downloads and registry changes')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List all installed and used versions')
            [CompletionResult]::new('complete', 'complete', [CompletionResultType]::ParameterValue, 'Generate shell completion')
            [CompletionResult]::new('update', 'update', [CompletionResultType]::ParameterValue, 'Update existing version')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'bob;help;use' {
            break
        }
        'bob;help;install' {
            break
        }
        'bob;help;sync' {
            break
        }
        'bob;help;uninstall' {
            break
        }
        'bob;help;rollback' {
            break
        }
        'bob;help;erase' {
            break
        }
        'bob;help;list' {
            break
        }
        'bob;help;complete' {
            break
        }
        'bob;help;update' {
            break
        }
        'bob;help;help' {
            break
        }
    })

    $completions.Where{ $_.CompletionText -like "$wordToComplete*" } |
        Sort-Object -Property ListItemText
}
