try
{
    Import-Module -Name CompletionPredictor -ErrorAction Stop
}
catch
{
    Install-Module -Name CompletionPredictor -Force
    Import-Module -Name CompletionPredictor
}

# Shows navigable menu of all options when hitting Tab
# Set-PSReadLineKeyHandler -Chord 'Ctrl+y' -Function MenuComplete
Set-PSReadLineKeyHandler -Key 'Ctrl+y' -ScriptBlock { Invoke-FzfTabCompletion }
Set-PSReadLineOption -ShowToolTips
# Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -BellStyle None
# Set-PSReadLineOption -PredictionViewStyle ListView
# Set-PSReadLineKeyHandler -Chord 'Alt+y' -Function ShowParameterHelp
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
