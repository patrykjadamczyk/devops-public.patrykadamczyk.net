#!/usr/bin/env pwsh
$max = 10000
$a = 0
1..$max | ForEach-Object {
    Write-Progress -Id 1 -Activity 'Measuring' -PercentComplete (( $_/$max ) * 100) -Status "Iteration $_"
    $a += (Measure-Script { Join-Path "test" "test2" }).ExecutionTime.TotalMilliseconds
}
Write-Progress -id 1 -activity 'Measuring' -Completed
Write-Host ($a/$max - $p)


$a = 0
1..$max | ForEach-Object {
    Write-Progress -Id 1 -Activity 'Measuring' -PercentComplete (( $_/$max ) * 100) -Status "Iteration $_"
    $a += (Measure-Script { [System.IO.Path]::Combine("test","test2") }).ExecutionTime.TotalMilliseconds
}
Write-Progress -id 1 -activity 'Measuring' -Completed
Write-Host ($a/$max - $p)
