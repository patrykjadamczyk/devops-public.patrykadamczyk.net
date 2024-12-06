#!/usr/bin/env nu
if ($_IsWindows) {
    return
}

const HomeManagerSessionVarsPath = ("~/.nix-profile/etc/profile.d/hm-session-vars.sh" | path expand)
if ($HomeManagerSessionVarsPath | path exists) {
    (cat $HomeManagerSessionVarsPath
        | split row "\n"
        | filter { $in =~ "^export" }
        | parse "export {name}={value}"
        | each { if ($in.value =~ '^"') { return { name: $in.name, value: ($in.value | parse '"{value}"').value.0} } else { return $in } }
        | rotate
        | headers
        | reject name
    ).0 | load-env
}
