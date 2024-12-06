Write-Host "Delete Temp Files"
Get-ChildItem -Path "C:\Windows\Temp" *.* -Recurse | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue
Get-ChildItem -Path $env:TEMP *.* -Recurse | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue
Write-Host "======================================="
Write-Host "--- Cleaned following folders:"
Write-Host "--- C:\Windows\Temp"
Write-Host "--- "$env:TEMP
Write-Host "======================================="