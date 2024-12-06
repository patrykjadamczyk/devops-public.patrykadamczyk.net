#!/usr/bin/env nu

# Add new migration
def main [
    $name: string # Name of the migration
] {
    let $BasePath = ($env.FILE_PWD | path expand)
    let $NewFileName = $"(date now | format date "%YY%mM%dD%HH%MM%SS")-($name).nu"
    let $NewFilePath = ($BasePath | path join $NewFileName)

    touch $NewFilePath
    return $NewFilePath
}
