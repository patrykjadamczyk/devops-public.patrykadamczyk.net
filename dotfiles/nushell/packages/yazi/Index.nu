#!/usr/bin/env nu
alias yazifm = ^yazi
alias fm = ^yazi

if ($_IsWindows == true) {
    def --env fm [...args] {
        let oldPath = $env.PATH

        use std "path add"

        $env.PATH = ($env.PATH | split row (char esep))
        path add --append "C:\\Program Files\\Git\\usr\\bin"
        $env.PATH = ($env.PATH | uniq)

        $in | yazi ...$args

        $env.PATH = $oldPath
    }
}

def --env yy [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXX")
	yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}
	rm -fp $tmp
}
