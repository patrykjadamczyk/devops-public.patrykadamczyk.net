#!/usr/bin/env pwsh
function Read-Ask-To-Continue($message, $continueMsg = "Do you want to continue?") {
    $yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes","Yes."
    $no = New-Object System.Management.Automation.Host.ChoiceDescription "&No","No."
    $options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no)
    $result = $host.ui.PromptForChoice($message, $continueMsg, $options, 1)
    return $result
#    switch ($result) {
#        0{
#            Write-Host "Yes" -ForegroundColor Green
#        }
#        1{
#            Write-Host "No" -ForegroundColor Red
#        }
#    }
}