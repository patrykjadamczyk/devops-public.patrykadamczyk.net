#!/usr/bin/env pwsh
function Merge-Hashtables {
    $Output = @{}
    foreach ($Hashtable in ($Input + $Args)) {
        if ($Hashtable -is [Hashtable]) {
            foreach ($Key in $Hashtable.Keys) {$Output.$Key = $Hashtable.$Key}
        }
    }
    return $Output
}