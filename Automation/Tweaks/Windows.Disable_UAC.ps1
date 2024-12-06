Write-Host "Disabling UAC..."
# This below is the pussy mode which can break some apps. Please. Leave this on 1.
# below i will show a way to do it without breaking some Apps that check UAC. U need to be admin tho.
# Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Type DWord -Value 0
Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name ConsentPromptBehaviorAdmin -Type DWord -Value 0 # Default is 5
# This will set the GPO Entry in Security so that Admin users elevate without any prompt while normal users still elevate and u can even leave it ennabled.
# It will just not bother u anymore