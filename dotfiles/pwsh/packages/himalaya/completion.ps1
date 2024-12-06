
using namespace System.Management.Automation
using namespace System.Management.Automation.Language

Register-ArgumentCompleter -Native -CommandName 'himalaya' -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)

    $commandElements = $commandAst.CommandElements
    $command = @(
        'himalaya'
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
        'himalaya' {
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('-C', 'C ', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('account', 'account', [CompletionResultType]::ParameterValue, 'Manage accounts')
            [CompletionResult]::new('folder', 'folder', [CompletionResultType]::ParameterValue, 'Manage folders')
            [CompletionResult]::new('envelope', 'envelope', [CompletionResultType]::ParameterValue, 'Manage envelopes')
            [CompletionResult]::new('flag', 'flag', [CompletionResultType]::ParameterValue, 'Manage flags')
            [CompletionResult]::new('message', 'message', [CompletionResultType]::ParameterValue, 'Manage messages')
            [CompletionResult]::new('attachment', 'attachment', [CompletionResultType]::ParameterValue, 'Manage attachments')
            [CompletionResult]::new('template', 'template', [CompletionResultType]::ParameterValue, 'Manage templates')
            [CompletionResult]::new('manual', 'manual', [CompletionResultType]::ParameterValue, 'Generate manual pages to a directory')
            [CompletionResult]::new('completion', 'completion', [CompletionResultType]::ParameterValue, 'Print completion script for a shell to stdout')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'himalaya;account' {
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('-C', 'C ', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('configure', 'configure', [CompletionResultType]::ParameterValue, 'Configure an account')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List all accounts')
            [CompletionResult]::new('sync', 'sync', [CompletionResultType]::ParameterValue, 'Synchronize an account')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'himalaya;account;configure' {
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('-C', 'C ', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('-r', 'r', [CompletionResultType]::ParameterName, 'Reset keyring passwords')
            [CompletionResult]::new('--reset', 'reset', [CompletionResultType]::ParameterName, 'Reset keyring passwords')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'himalaya;account;list' {
            [CompletionResult]::new('-w', 'w', [CompletionResultType]::ParameterName, 'The maximum width the table should not exceed')
            [CompletionResult]::new('--max-width', 'max-width', [CompletionResultType]::ParameterName, 'The maximum width the table should not exceed')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('-C', 'C ', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'himalaya;account;sync' {
            [CompletionResult]::new('-f', 'f', [CompletionResultType]::ParameterName, 'Synchronize only specific folders')
            [CompletionResult]::new('--include-folder', 'include-folder', [CompletionResultType]::ParameterName, 'Synchronize only specific folders')
            [CompletionResult]::new('-x', 'x', [CompletionResultType]::ParameterName, 'Omit specific folders from the synchronization')
            [CompletionResult]::new('--exclude-folder', 'exclude-folder', [CompletionResultType]::ParameterName, 'Omit specific folders from the synchronization')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('-C', 'C ', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('-d', 'd', [CompletionResultType]::ParameterName, 'Run the synchronization without applying any changes')
            [CompletionResult]::new('--dry-run', 'dry-run', [CompletionResultType]::ParameterName, 'Run the synchronization without applying any changes')
            [CompletionResult]::new('-A', 'A ', [CompletionResultType]::ParameterName, 'Synchronize all exsting folders')
            [CompletionResult]::new('--all-folders', 'all-folders', [CompletionResultType]::ParameterName, 'Synchronize all exsting folders')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'himalaya;account;help' {
            [CompletionResult]::new('configure', 'configure', [CompletionResultType]::ParameterValue, 'Configure an account')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List all accounts')
            [CompletionResult]::new('sync', 'sync', [CompletionResultType]::ParameterValue, 'Synchronize an account')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'himalaya;account;help;configure' {
            break
        }
        'himalaya;account;help;list' {
            break
        }
        'himalaya;account;help;sync' {
            break
        }
        'himalaya;account;help;help' {
            break
        }
        'himalaya;folder' {
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('-C', 'C ', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Create a new folder')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List all folders')
            [CompletionResult]::new('expunge', 'expunge', [CompletionResultType]::ParameterValue, 'Expunge a folder')
            [CompletionResult]::new('purge', 'purge', [CompletionResultType]::ParameterValue, 'Purge a folder')
            [CompletionResult]::new('delete', 'delete', [CompletionResultType]::ParameterValue, 'Delete a folder')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'himalaya;folder;add' {
            [CompletionResult]::new('-a', 'a', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('--account', 'account', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('-C', 'C ', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--disable-cache', 'disable-cache', [CompletionResultType]::ParameterName, 'Disable any sort of cache')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'himalaya;folder;list' {
            [CompletionResult]::new('-w', 'w', [CompletionResultType]::ParameterName, 'The maximum width the table should not exceed')
            [CompletionResult]::new('--max-width', 'max-width', [CompletionResultType]::ParameterName, 'The maximum width the table should not exceed')
            [CompletionResult]::new('-a', 'a', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('--account', 'account', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('-C', 'C ', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--disable-cache', 'disable-cache', [CompletionResultType]::ParameterName, 'Disable any sort of cache')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'himalaya;folder;expunge' {
            [CompletionResult]::new('-a', 'a', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('--account', 'account', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('-C', 'C ', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--disable-cache', 'disable-cache', [CompletionResultType]::ParameterName, 'Disable any sort of cache')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'himalaya;folder;purge' {
            [CompletionResult]::new('-a', 'a', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('--account', 'account', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('-C', 'C ', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--disable-cache', 'disable-cache', [CompletionResultType]::ParameterName, 'Disable any sort of cache')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'himalaya;folder;delete' {
            [CompletionResult]::new('-a', 'a', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('--account', 'account', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('-C', 'C ', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--disable-cache', 'disable-cache', [CompletionResultType]::ParameterName, 'Disable any sort of cache')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'himalaya;folder;help' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Create a new folder')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List all folders')
            [CompletionResult]::new('expunge', 'expunge', [CompletionResultType]::ParameterValue, 'Expunge a folder')
            [CompletionResult]::new('purge', 'purge', [CompletionResultType]::ParameterValue, 'Purge a folder')
            [CompletionResult]::new('delete', 'delete', [CompletionResultType]::ParameterValue, 'Delete a folder')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'himalaya;folder;help;add' {
            break
        }
        'himalaya;folder;help;list' {
            break
        }
        'himalaya;folder;help;expunge' {
            break
        }
        'himalaya;folder;help;purge' {
            break
        }
        'himalaya;folder;help;delete' {
            break
        }
        'himalaya;folder;help;help' {
            break
        }
        'himalaya;envelope' {
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('-C', 'C ', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List all envelopes')
            [CompletionResult]::new('watch', 'watch', [CompletionResultType]::ParameterValue, 'Watch envelopes for changes')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'himalaya;envelope;list' {
            [CompletionResult]::new('-p', 'p', [CompletionResultType]::ParameterName, 'The page number')
            [CompletionResult]::new('--page', 'page', [CompletionResultType]::ParameterName, 'The page number')
            [CompletionResult]::new('-s', 's', [CompletionResultType]::ParameterName, 'The page size')
            [CompletionResult]::new('--page-size', 'page-size', [CompletionResultType]::ParameterName, 'The page size')
            [CompletionResult]::new('-w', 'w', [CompletionResultType]::ParameterName, 'The maximum width the table should not exceed')
            [CompletionResult]::new('--max-width', 'max-width', [CompletionResultType]::ParameterName, 'The maximum width the table should not exceed')
            [CompletionResult]::new('-a', 'a', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('--account', 'account', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('-C', 'C ', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--disable-cache', 'disable-cache', [CompletionResultType]::ParameterName, 'Disable any sort of cache')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'himalaya;envelope;watch' {
            [CompletionResult]::new('-f', 'f', [CompletionResultType]::ParameterName, 'The name of the folder')
            [CompletionResult]::new('--folder', 'folder', [CompletionResultType]::ParameterName, 'The name of the folder')
            [CompletionResult]::new('-a', 'a', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('--account', 'account', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('-C', 'C ', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--disable-cache', 'disable-cache', [CompletionResultType]::ParameterName, 'Disable any sort of cache')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'himalaya;envelope;help' {
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List all envelopes')
            [CompletionResult]::new('watch', 'watch', [CompletionResultType]::ParameterValue, 'Watch envelopes for changes')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'himalaya;envelope;help;list' {
            break
        }
        'himalaya;envelope;help;watch' {
            break
        }
        'himalaya;envelope;help;help' {
            break
        }
        'himalaya;flag' {
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('-C', 'C ', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add flag(s) to an envelope')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Replace flag(s) of an envelope')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove flag(s) from an envelope')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'himalaya;flag;add' {
            [CompletionResult]::new('-f', 'f', [CompletionResultType]::ParameterName, 'The name of the folder')
            [CompletionResult]::new('--folder', 'folder', [CompletionResultType]::ParameterName, 'The name of the folder')
            [CompletionResult]::new('-a', 'a', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('--account', 'account', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('-C', 'C ', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--disable-cache', 'disable-cache', [CompletionResultType]::ParameterName, 'Disable any sort of cache')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'himalaya;flag;set' {
            [CompletionResult]::new('-f', 'f', [CompletionResultType]::ParameterName, 'The name of the folder')
            [CompletionResult]::new('--folder', 'folder', [CompletionResultType]::ParameterName, 'The name of the folder')
            [CompletionResult]::new('-a', 'a', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('--account', 'account', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('-C', 'C ', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--disable-cache', 'disable-cache', [CompletionResultType]::ParameterName, 'Disable any sort of cache')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'himalaya;flag;remove' {
            [CompletionResult]::new('-f', 'f', [CompletionResultType]::ParameterName, 'The name of the folder')
            [CompletionResult]::new('--folder', 'folder', [CompletionResultType]::ParameterName, 'The name of the folder')
            [CompletionResult]::new('-a', 'a', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('--account', 'account', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('-C', 'C ', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--disable-cache', 'disable-cache', [CompletionResultType]::ParameterName, 'Disable any sort of cache')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'himalaya;flag;help' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add flag(s) to an envelope')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Replace flag(s) of an envelope')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove flag(s) from an envelope')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'himalaya;flag;help;add' {
            break
        }
        'himalaya;flag;help;set' {
            break
        }
        'himalaya;flag;help;remove' {
            break
        }
        'himalaya;flag;help;help' {
            break
        }
        'himalaya;message' {
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('-C', 'C ', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('read', 'read', [CompletionResultType]::ParameterValue, 'Read a message')
            [CompletionResult]::new('write', 'write', [CompletionResultType]::ParameterValue, 'Write a new message')
            [CompletionResult]::new('reply', 'reply', [CompletionResultType]::ParameterValue, 'Reply to a message')
            [CompletionResult]::new('forward', 'forward', [CompletionResultType]::ParameterValue, 'Forward a message')
            [CompletionResult]::new('mailto', 'mailto', [CompletionResultType]::ParameterValue, 'Parse and edit a message from a mailto URL string')
            [CompletionResult]::new('save', 'save', [CompletionResultType]::ParameterValue, 'Save a message to a folder')
            [CompletionResult]::new('send', 'send', [CompletionResultType]::ParameterValue, 'Send a message')
            [CompletionResult]::new('copy', 'copy', [CompletionResultType]::ParameterValue, 'Copy a message from a source folder to a target folder')
            [CompletionResult]::new('move', 'move', [CompletionResultType]::ParameterValue, 'Move a message from a source folder to a target folder')
            [CompletionResult]::new('delete', 'delete', [CompletionResultType]::ParameterValue, 'Mark as deleted a message from a folder')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'himalaya;message;read' {
            [CompletionResult]::new('-f', 'f', [CompletionResultType]::ParameterName, 'The name of the folder')
            [CompletionResult]::new('--folder', 'folder', [CompletionResultType]::ParameterName, 'The name of the folder')
            [CompletionResult]::new('-H', 'H ', [CompletionResultType]::ParameterName, 'List of headers that should be visible at the top of the message')
            [CompletionResult]::new('--header', 'header', [CompletionResultType]::ParameterName, 'List of headers that should be visible at the top of the message')
            [CompletionResult]::new('-a', 'a', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('--account', 'account', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('-C', 'C ', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('-p', 'p', [CompletionResultType]::ParameterName, 'Read the message without applying the "seen" flag to its corresponding envelope')
            [CompletionResult]::new('--preview', 'preview', [CompletionResultType]::ParameterName, 'Read the message without applying the "seen" flag to its corresponding envelope')
            [CompletionResult]::new('-r', 'r', [CompletionResultType]::ParameterName, 'Read the raw version of the given message')
            [CompletionResult]::new('--raw', 'raw', [CompletionResultType]::ParameterName, 'Read the raw version of the given message')
            [CompletionResult]::new('--html', 'html', [CompletionResultType]::ParameterName, 'Read only body of text/html parts')
            [CompletionResult]::new('--no-headers', 'no-headers', [CompletionResultType]::ParameterName, 'Read only the body of the message')
            [CompletionResult]::new('--disable-cache', 'disable-cache', [CompletionResultType]::ParameterName, 'Disable any sort of cache')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'himalaya;message;write' {
            [CompletionResult]::new('-H', 'H ', [CompletionResultType]::ParameterName, 'Prefill the template with custom headers')
            [CompletionResult]::new('--header', 'header', [CompletionResultType]::ParameterName, 'Prefill the template with custom headers')
            [CompletionResult]::new('-a', 'a', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('--account', 'account', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('-C', 'C ', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--disable-cache', 'disable-cache', [CompletionResultType]::ParameterName, 'Disable any sort of cache')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'himalaya;message;reply' {
            [CompletionResult]::new('-f', 'f', [CompletionResultType]::ParameterName, 'The name of the folder')
            [CompletionResult]::new('--folder', 'folder', [CompletionResultType]::ParameterName, 'The name of the folder')
            [CompletionResult]::new('-H', 'H ', [CompletionResultType]::ParameterName, 'Prefill the template with custom headers')
            [CompletionResult]::new('--header', 'header', [CompletionResultType]::ParameterName, 'Prefill the template with custom headers')
            [CompletionResult]::new('-a', 'a', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('--account', 'account', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('-C', 'C ', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('-A', 'A ', [CompletionResultType]::ParameterName, 'Reply to all recipients')
            [CompletionResult]::new('--all', 'all', [CompletionResultType]::ParameterName, 'Reply to all recipients')
            [CompletionResult]::new('--disable-cache', 'disable-cache', [CompletionResultType]::ParameterName, 'Disable any sort of cache')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'himalaya;message;forward' {
            [CompletionResult]::new('-f', 'f', [CompletionResultType]::ParameterName, 'The name of the folder')
            [CompletionResult]::new('--folder', 'folder', [CompletionResultType]::ParameterName, 'The name of the folder')
            [CompletionResult]::new('-H', 'H ', [CompletionResultType]::ParameterName, 'Prefill the template with custom headers')
            [CompletionResult]::new('--header', 'header', [CompletionResultType]::ParameterName, 'Prefill the template with custom headers')
            [CompletionResult]::new('-a', 'a', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('--account', 'account', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('-C', 'C ', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--disable-cache', 'disable-cache', [CompletionResultType]::ParameterName, 'Disable any sort of cache')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'himalaya;message;mailto' {
            [CompletionResult]::new('-a', 'a', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('--account', 'account', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('-C', 'C ', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--disable-cache', 'disable-cache', [CompletionResultType]::ParameterName, 'Disable any sort of cache')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'himalaya;message;save' {
            [CompletionResult]::new('-f', 'f', [CompletionResultType]::ParameterName, 'The name of the folder')
            [CompletionResult]::new('--folder', 'folder', [CompletionResultType]::ParameterName, 'The name of the folder')
            [CompletionResult]::new('-a', 'a', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('--account', 'account', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('-C', 'C ', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--disable-cache', 'disable-cache', [CompletionResultType]::ParameterName, 'Disable any sort of cache')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'himalaya;message;send' {
            [CompletionResult]::new('-a', 'a', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('--account', 'account', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('-C', 'C ', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--disable-cache', 'disable-cache', [CompletionResultType]::ParameterName, 'Disable any sort of cache')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'himalaya;message;copy' {
            [CompletionResult]::new('-f', 'f', [CompletionResultType]::ParameterName, 'The name of the source folder')
            [CompletionResult]::new('--folder', 'folder', [CompletionResultType]::ParameterName, 'The name of the source folder')
            [CompletionResult]::new('-a', 'a', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('--account', 'account', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('-C', 'C ', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--disable-cache', 'disable-cache', [CompletionResultType]::ParameterName, 'Disable any sort of cache')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'himalaya;message;move' {
            [CompletionResult]::new('-f', 'f', [CompletionResultType]::ParameterName, 'The name of the source folder')
            [CompletionResult]::new('--folder', 'folder', [CompletionResultType]::ParameterName, 'The name of the source folder')
            [CompletionResult]::new('-a', 'a', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('--account', 'account', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('-C', 'C ', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--disable-cache', 'disable-cache', [CompletionResultType]::ParameterName, 'Disable any sort of cache')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'himalaya;message;delete' {
            [CompletionResult]::new('-f', 'f', [CompletionResultType]::ParameterName, 'The name of the folder')
            [CompletionResult]::new('--folder', 'folder', [CompletionResultType]::ParameterName, 'The name of the folder')
            [CompletionResult]::new('-a', 'a', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('--account', 'account', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('-C', 'C ', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--disable-cache', 'disable-cache', [CompletionResultType]::ParameterName, 'Disable any sort of cache')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'himalaya;message;help' {
            [CompletionResult]::new('read', 'read', [CompletionResultType]::ParameterValue, 'Read a message')
            [CompletionResult]::new('write', 'write', [CompletionResultType]::ParameterValue, 'Write a new message')
            [CompletionResult]::new('reply', 'reply', [CompletionResultType]::ParameterValue, 'Reply to a message')
            [CompletionResult]::new('forward', 'forward', [CompletionResultType]::ParameterValue, 'Forward a message')
            [CompletionResult]::new('mailto', 'mailto', [CompletionResultType]::ParameterValue, 'Parse and edit a message from a mailto URL string')
            [CompletionResult]::new('save', 'save', [CompletionResultType]::ParameterValue, 'Save a message to a folder')
            [CompletionResult]::new('send', 'send', [CompletionResultType]::ParameterValue, 'Send a message')
            [CompletionResult]::new('copy', 'copy', [CompletionResultType]::ParameterValue, 'Copy a message from a source folder to a target folder')
            [CompletionResult]::new('move', 'move', [CompletionResultType]::ParameterValue, 'Move a message from a source folder to a target folder')
            [CompletionResult]::new('delete', 'delete', [CompletionResultType]::ParameterValue, 'Mark as deleted a message from a folder')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'himalaya;message;help;read' {
            break
        }
        'himalaya;message;help;write' {
            break
        }
        'himalaya;message;help;reply' {
            break
        }
        'himalaya;message;help;forward' {
            break
        }
        'himalaya;message;help;mailto' {
            break
        }
        'himalaya;message;help;save' {
            break
        }
        'himalaya;message;help;send' {
            break
        }
        'himalaya;message;help;copy' {
            break
        }
        'himalaya;message;help;move' {
            break
        }
        'himalaya;message;help;delete' {
            break
        }
        'himalaya;message;help;help' {
            break
        }
        'himalaya;attachment' {
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('-C', 'C ', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('download', 'download', [CompletionResultType]::ParameterValue, 'Download all attachments for the given message')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'himalaya;attachment;download' {
            [CompletionResult]::new('-f', 'f', [CompletionResultType]::ParameterName, 'The name of the folder')
            [CompletionResult]::new('--folder', 'folder', [CompletionResultType]::ParameterName, 'The name of the folder')
            [CompletionResult]::new('-a', 'a', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('--account', 'account', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('-C', 'C ', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--disable-cache', 'disable-cache', [CompletionResultType]::ParameterName, 'Disable any sort of cache')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'himalaya;attachment;help' {
            [CompletionResult]::new('download', 'download', [CompletionResultType]::ParameterValue, 'Download all attachments for the given message')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'himalaya;attachment;help;download' {
            break
        }
        'himalaya;attachment;help;help' {
            break
        }
        'himalaya;template' {
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('-C', 'C ', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('write', 'write', [CompletionResultType]::ParameterValue, 'Generate a template for writing a new message from scratch')
            [CompletionResult]::new('reply', 'reply', [CompletionResultType]::ParameterValue, 'Generate a template for replying to a message')
            [CompletionResult]::new('forward', 'forward', [CompletionResultType]::ParameterValue, 'Generate a template for forwarding a message')
            [CompletionResult]::new('save', 'save', [CompletionResultType]::ParameterValue, 'Save a template to a folder')
            [CompletionResult]::new('send', 'send', [CompletionResultType]::ParameterValue, 'Send a template')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'himalaya;template;write' {
            [CompletionResult]::new('-H', 'H ', [CompletionResultType]::ParameterName, 'Prefill the template with custom headers')
            [CompletionResult]::new('--header', 'header', [CompletionResultType]::ParameterName, 'Prefill the template with custom headers')
            [CompletionResult]::new('-a', 'a', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('--account', 'account', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('-C', 'C ', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--disable-cache', 'disable-cache', [CompletionResultType]::ParameterName, 'Disable any sort of cache')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'himalaya;template;reply' {
            [CompletionResult]::new('-f', 'f', [CompletionResultType]::ParameterName, 'The name of the folder')
            [CompletionResult]::new('--folder', 'folder', [CompletionResultType]::ParameterName, 'The name of the folder')
            [CompletionResult]::new('-H', 'H ', [CompletionResultType]::ParameterName, 'Prefill the template with custom headers')
            [CompletionResult]::new('--header', 'header', [CompletionResultType]::ParameterName, 'Prefill the template with custom headers')
            [CompletionResult]::new('-a', 'a', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('--account', 'account', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('-C', 'C ', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('-A', 'A ', [CompletionResultType]::ParameterName, 'Reply to all recipients')
            [CompletionResult]::new('--all', 'all', [CompletionResultType]::ParameterName, 'Reply to all recipients')
            [CompletionResult]::new('--disable-cache', 'disable-cache', [CompletionResultType]::ParameterName, 'Disable any sort of cache')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'himalaya;template;forward' {
            [CompletionResult]::new('-f', 'f', [CompletionResultType]::ParameterName, 'The name of the folder')
            [CompletionResult]::new('--folder', 'folder', [CompletionResultType]::ParameterName, 'The name of the folder')
            [CompletionResult]::new('-H', 'H ', [CompletionResultType]::ParameterName, 'Prefill the template with custom headers')
            [CompletionResult]::new('--header', 'header', [CompletionResultType]::ParameterName, 'Prefill the template with custom headers')
            [CompletionResult]::new('-a', 'a', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('--account', 'account', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('-C', 'C ', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--disable-cache', 'disable-cache', [CompletionResultType]::ParameterName, 'Disable any sort of cache')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'himalaya;template;save' {
            [CompletionResult]::new('-f', 'f', [CompletionResultType]::ParameterName, 'The name of the folder')
            [CompletionResult]::new('--folder', 'folder', [CompletionResultType]::ParameterName, 'The name of the folder')
            [CompletionResult]::new('-a', 'a', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('--account', 'account', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('-C', 'C ', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--disable-cache', 'disable-cache', [CompletionResultType]::ParameterName, 'Disable any sort of cache')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'himalaya;template;send' {
            [CompletionResult]::new('-a', 'a', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('--account', 'account', [CompletionResultType]::ParameterName, 'Override the default account')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('-C', 'C ', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--disable-cache', 'disable-cache', [CompletionResultType]::ParameterName, 'Disable any sort of cache')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'himalaya;template;help' {
            [CompletionResult]::new('write', 'write', [CompletionResultType]::ParameterValue, 'Generate a template for writing a new message from scratch')
            [CompletionResult]::new('reply', 'reply', [CompletionResultType]::ParameterValue, 'Generate a template for replying to a message')
            [CompletionResult]::new('forward', 'forward', [CompletionResultType]::ParameterValue, 'Generate a template for forwarding a message')
            [CompletionResult]::new('save', 'save', [CompletionResultType]::ParameterValue, 'Save a template to a folder')
            [CompletionResult]::new('send', 'send', [CompletionResultType]::ParameterValue, 'Send a template')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'himalaya;template;help;write' {
            break
        }
        'himalaya;template;help;reply' {
            break
        }
        'himalaya;template;help;forward' {
            break
        }
        'himalaya;template;help;save' {
            break
        }
        'himalaya;template;help;send' {
            break
        }
        'himalaya;template;help;help' {
            break
        }
        'himalaya;manual' {
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('-C', 'C ', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'himalaya;completion' {
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Override the default configuration file path')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Customize the output format')
            [CompletionResult]::new('-C', 'C ', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'Control when to use colors')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'himalaya;help' {
            [CompletionResult]::new('account', 'account', [CompletionResultType]::ParameterValue, 'Manage accounts')
            [CompletionResult]::new('folder', 'folder', [CompletionResultType]::ParameterValue, 'Manage folders')
            [CompletionResult]::new('envelope', 'envelope', [CompletionResultType]::ParameterValue, 'Manage envelopes')
            [CompletionResult]::new('flag', 'flag', [CompletionResultType]::ParameterValue, 'Manage flags')
            [CompletionResult]::new('message', 'message', [CompletionResultType]::ParameterValue, 'Manage messages')
            [CompletionResult]::new('attachment', 'attachment', [CompletionResultType]::ParameterValue, 'Manage attachments')
            [CompletionResult]::new('template', 'template', [CompletionResultType]::ParameterValue, 'Manage templates')
            [CompletionResult]::new('manual', 'manual', [CompletionResultType]::ParameterValue, 'Generate manual pages to a directory')
            [CompletionResult]::new('completion', 'completion', [CompletionResultType]::ParameterValue, 'Print completion script for a shell to stdout')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'himalaya;help;account' {
            [CompletionResult]::new('configure', 'configure', [CompletionResultType]::ParameterValue, 'Configure an account')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List all accounts')
            [CompletionResult]::new('sync', 'sync', [CompletionResultType]::ParameterValue, 'Synchronize an account')
            break
        }
        'himalaya;help;account;configure' {
            break
        }
        'himalaya;help;account;list' {
            break
        }
        'himalaya;help;account;sync' {
            break
        }
        'himalaya;help;folder' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Create a new folder')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List all folders')
            [CompletionResult]::new('expunge', 'expunge', [CompletionResultType]::ParameterValue, 'Expunge a folder')
            [CompletionResult]::new('purge', 'purge', [CompletionResultType]::ParameterValue, 'Purge a folder')
            [CompletionResult]::new('delete', 'delete', [CompletionResultType]::ParameterValue, 'Delete a folder')
            break
        }
        'himalaya;help;folder;add' {
            break
        }
        'himalaya;help;folder;list' {
            break
        }
        'himalaya;help;folder;expunge' {
            break
        }
        'himalaya;help;folder;purge' {
            break
        }
        'himalaya;help;folder;delete' {
            break
        }
        'himalaya;help;envelope' {
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List all envelopes')
            [CompletionResult]::new('watch', 'watch', [CompletionResultType]::ParameterValue, 'Watch envelopes for changes')
            break
        }
        'himalaya;help;envelope;list' {
            break
        }
        'himalaya;help;envelope;watch' {
            break
        }
        'himalaya;help;flag' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add flag(s) to an envelope')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Replace flag(s) of an envelope')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove flag(s) from an envelope')
            break
        }
        'himalaya;help;flag;add' {
            break
        }
        'himalaya;help;flag;set' {
            break
        }
        'himalaya;help;flag;remove' {
            break
        }
        'himalaya;help;message' {
            [CompletionResult]::new('read', 'read', [CompletionResultType]::ParameterValue, 'Read a message')
            [CompletionResult]::new('write', 'write', [CompletionResultType]::ParameterValue, 'Write a new message')
            [CompletionResult]::new('reply', 'reply', [CompletionResultType]::ParameterValue, 'Reply to a message')
            [CompletionResult]::new('forward', 'forward', [CompletionResultType]::ParameterValue, 'Forward a message')
            [CompletionResult]::new('mailto', 'mailto', [CompletionResultType]::ParameterValue, 'Parse and edit a message from a mailto URL string')
            [CompletionResult]::new('save', 'save', [CompletionResultType]::ParameterValue, 'Save a message to a folder')
            [CompletionResult]::new('send', 'send', [CompletionResultType]::ParameterValue, 'Send a message')
            [CompletionResult]::new('copy', 'copy', [CompletionResultType]::ParameterValue, 'Copy a message from a source folder to a target folder')
            [CompletionResult]::new('move', 'move', [CompletionResultType]::ParameterValue, 'Move a message from a source folder to a target folder')
            [CompletionResult]::new('delete', 'delete', [CompletionResultType]::ParameterValue, 'Mark as deleted a message from a folder')
            break
        }
        'himalaya;help;message;read' {
            break
        }
        'himalaya;help;message;write' {
            break
        }
        'himalaya;help;message;reply' {
            break
        }
        'himalaya;help;message;forward' {
            break
        }
        'himalaya;help;message;mailto' {
            break
        }
        'himalaya;help;message;save' {
            break
        }
        'himalaya;help;message;send' {
            break
        }
        'himalaya;help;message;copy' {
            break
        }
        'himalaya;help;message;move' {
            break
        }
        'himalaya;help;message;delete' {
            break
        }
        'himalaya;help;attachment' {
            [CompletionResult]::new('download', 'download', [CompletionResultType]::ParameterValue, 'Download all attachments for the given message')
            break
        }
        'himalaya;help;attachment;download' {
            break
        }
        'himalaya;help;template' {
            [CompletionResult]::new('write', 'write', [CompletionResultType]::ParameterValue, 'Generate a template for writing a new message from scratch')
            [CompletionResult]::new('reply', 'reply', [CompletionResultType]::ParameterValue, 'Generate a template for replying to a message')
            [CompletionResult]::new('forward', 'forward', [CompletionResultType]::ParameterValue, 'Generate a template for forwarding a message')
            [CompletionResult]::new('save', 'save', [CompletionResultType]::ParameterValue, 'Save a template to a folder')
            [CompletionResult]::new('send', 'send', [CompletionResultType]::ParameterValue, 'Send a template')
            break
        }
        'himalaya;help;template;write' {
            break
        }
        'himalaya;help;template;reply' {
            break
        }
        'himalaya;help;template;forward' {
            break
        }
        'himalaya;help;template;save' {
            break
        }
        'himalaya;help;template;send' {
            break
        }
        'himalaya;help;manual' {
            break
        }
        'himalaya;help;completion' {
            break
        }
        'himalaya;help;help' {
            break
        }
    })

    $completions.Where{ $_.CompletionText -like "$wordToComplete*" } |
        Sort-Object -Property ListItemText
}
