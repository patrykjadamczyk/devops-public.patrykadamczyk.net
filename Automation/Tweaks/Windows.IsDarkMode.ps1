function Get-AppsUseLightTheme{
    return (Get-ItemProperty -path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize').AppsUseLightTheme
}

function Get-SystemUsesLightTheme{
    return (Get-ItemProperty -path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize').SystemUsesLightTheme
}

$IsDarkMode = $(If ($(Get-AppsUseLightTheme) -eq 0 -And $(Get-SystemUsesLightTheme) -eq 0) {$true} Else {$false})

$EnableDarkMode = $IsDarkMode
$DarkMoveValue = $(If ( $EnableDarkMode ) {0} Else {1})
Write-Host $(If ( $EnableDarkMode ) {"Enabling Dark Mode"} Else {"Disabling Dark Mode"})
$Theme = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"
If ($DarkMoveValue -ne $(Get-AppsUseLightTheme))
{
    Set-ItemProperty $Theme AppsUseLightTheme -Value $DarkMoveValue
}
If ($DarkMoveValue -ne $(Get-SystemUsesLightTheme))
{
    Set-ItemProperty $Theme SystemUsesLightTheme -Value $DarkMoveValue
}
Write-Host $(If ( $EnableDarkMode ) {"Enabled"} Else {"Disabled"})