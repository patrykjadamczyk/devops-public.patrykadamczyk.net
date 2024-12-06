#!/usr/bin/env pwsh
function Global:New-FileFromTemplate(
    [Parameter(Mandatory=$true, Position=0)]
    [String] $TemplateName,
    [Parameter(Position=1)]
    [String] $Path = $null,
    [Parameter(Position=2)]
    [HashTable] $TemplateVariables = @{}
) {
    $FullTemplateName = (Get-ChildItem (Join-Path $PSScriptRoot "templates" "$TemplateName")).FullName
    if ([String]::IsNullOrWhiteSpace($Path)) {
        $Path = Join-Path $PWD $TemplateName
    }
    Copy-Item $FullTemplateName -Destination $Path
    $template = Get-Content -Path $Path
    # $variables = $template | Select-String -Pattern '\$\w+\$' -AllMatches
    # $variableNames = $variables.Matches.Value | ForEach-Object { $_ -replace '\$', '' }
    $content = foreach ($line in $template) {
        foreach ($key in $TemplateVariables.Keys) {
            $value = $TemplateVariables[$key]
            $line = $line.Replace("`$$key`$", $value)
        }
        $line
    }
    return Set-Content -Path $Path -Value $content
}

function Global:New-FileFromTemplateInteractively() {
    $TemplatesPath = (Resolve-Path ( Join-Path $PSScriptRoot "templates" )).Path
    $TemplatesList = Get-ChildItem $TemplatesPath -Exclude @("*.gitkeep") -Recurse
    $TemplatesPathList = $TemplatesList | ForEach-Object {
        $_.FullName.Replace("$TemplatesPath\", "").Replace("$TemplatesPath/","")
    }
    $invokeTemplate = $TemplatesPathList | Invoke-Fzf
    if ([string]::IsNullOrWhiteSpace($invokeTemplate)) {
        return
    }
    $FullTemplateName = Join-Path $TemplatesPath $invokeTemplate
    $filePath = (gum input --prompt "Specify file to which you want copy template > ")
    if ([string]::IsNullOrWhiteSpace($filePath)) {
        $filePath = Join-Path $PWD (Get-ChildItem $FullTemplateName).Name
    }
    Copy-Item $FullTemplateName -Destination $filePath
    $template = Get-Content -Path $filePath
    $variables = $template | Select-String -Pattern '\$\w+\$' -AllMatches
    $variableNames = $variables.Matches.Value | ForEach-Object { $_ -replace '\$', '' }
    $TemplateVariables = @{}
    $variableNames | ForEach-Object {
        $TemplateVariables[$_] = (gum input --prompt "Specify value for template variable: $_ > ")
    }
    $content = foreach ($line in $template) {
        foreach ($key in $TemplateVariables.Keys) {
            $value = $TemplateVariables[$key]
            $line = $line.Replace("`$$key`$", $value)
        }
        $line
    }
    return Set-Content -Path $filePath -Value $content
}

function Global:Show-FileFromTemplateInteractively() {
    $TemplatesPath = (Resolve-Path ( Join-Path $PSScriptRoot "templates" )).Path
    $TemplatesList = Get-ChildItem $TemplatesPath -Exclude @("*.gitkeep") -Recurse
    $TemplatesPathList = $TemplatesList | ForEach-Object {
        $_.FullName.Replace("$TemplatesPath\", "").Replace("$TemplatesPath/","")
    }
    $invokeTemplate = $TemplatesPathList | Invoke-Fzf
    if ([string]::IsNullOrWhiteSpace($invokeTemplate)) {
        return
    }
    $FullTemplateName = Join-Path $TemplatesPath $invokeTemplate
    $template = Get-Content -Path $FullTemplateName
    $variables = $template | Select-String -Pattern '\$\w+\$' -AllMatches
    $variableNames = $variables.Matches.Value | ForEach-Object { $_ -replace '\$', '' }
    $TemplateVariables = @{}
    $variableNames | ForEach-Object {
        $TemplateVariables[$_] = (gum input --prompt "Specify value for template variable: $_ > ")
    }
    $content = foreach ($line in $template) {
        foreach ($key in $TemplateVariables.Keys) {
            $value = $TemplateVariables[$key]
            $line = $line.Replace("`$$key`$", $value)
        }
        $line
    }
    return $content
}
