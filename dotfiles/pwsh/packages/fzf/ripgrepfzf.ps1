#!/usr/bin/env pwsh
# This function is from PSFzf module but changed to make additional features for me

class FzfDefaultCmd {
	[string]$PrevEnv

	FzfDefaultCmd([string]$overrideVal) {
		$this.PrevEnv = $env:FZF_DEFAULT_COMMAND
		$env:FZF_DEFAULT_COMMAND = $overrideVal
	}

	[void]Restore() {
		$env:FZF_DEFAULT_COMMAND = $this.PrevEnv
	}
}
function Invoke-PsFzfRg() {
    # this function is adapted from https://github.com/junegunn/fzf/blob/master/ADVANCED.md#switching-between-ripgrep-mode-and-fzf-mode
    param(
        [Parameter(Mandatory)]$SearchString,
        [Parameter(Mandatory = $false)]$Path = ".",
        [switch]$NoEditor
    )

    $RG_PREFIX = "rg --column --line-number --no-heading --color=always --smart-case "
    $INITIAL_QUERY = $SearchString

    $script:OverrideFzfDefaultCommand = [FzfDefaultCmd]::new('')
    try {
        if ($script:IsWindows) {
            $sleepCmd = ''
            $trueCmd = 'cd .'
            $env:FZF_DEFAULT_COMMAND = "$RG_PREFIX ""$INITIAL_QUERY"" $Path"
        }
        else {
            $sleepCmd = 'sleep 0.1;'
            $trueCmd = 'true'
            $env:FZF_DEFAULT_COMMAND = '{0} $(printf %q "{1}") {2}' -f $RG_PREFIX, $INITIAL_QUERY, $Path
        }
        $previewArgument = 'bat --color=always {1} --highlight-line {2}'
        if (
            [System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Windows)
        ) {
            $previewArgument = 'bat --color=always {1}:{2} --highlight-line {3}'
        }

        fzf --ansi `
            --color "hl:-1:underline,hl+:-1:underline:reverse" `
            --disabled --query "$INITIAL_QUERY" `
            --bind "change:reload:$sleepCmd $RG_PREFIX {q} $Path || $trueCmd" `
            --bind "ctrl-f:unbind(change,ctrl-f)+change-prompt(2. fzf> )+enable-search+clear-query+rebind(ctrl-r)" `
            --bind "ctrl-r:unbind(ctrl-r)+change-prompt(1. ripgrep> )+disable-search+reload($RG_PREFIX {q} $Path || $trueCmd)+rebind(change,ctrl-f)" `
            --prompt '1. Ripgrep> ' `
            --delimiter : `
            --header '╱ CTRL-R (Ripgrep mode) ╱ CTRL-F (fzf mode) ╱' `
            --preview $previewArgument `
            --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' | `
            ForEach-Object { $results += $_ }

        if (-not [string]::IsNullOrEmpty($results)) {
            $split = $results.Split(':')
            $fileList = $split[0]
            if (
                [System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Windows)
            ) {
                $fileList = [String]::Concat($split[0], ":", $split[1])
            }
            Resolve-Path $fileList
        }
    }
    catch {
        Write-Error "Error occurred: $_"
    }
    finally {
        if ($script:OverrideFzfDefaultCommand) {
            $script:OverrideFzfDefaultCommand.Restore()
            $script:OverrideFzfDefaultCommand = $null
        }
    }
}
