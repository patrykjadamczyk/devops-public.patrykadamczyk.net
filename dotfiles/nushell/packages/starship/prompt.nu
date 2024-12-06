# this file is both a valid
# - overlay which can be loaded with `overlay use starship.nu`
# - module which can be used with `use starship.nu`
# - script which can be used with `source starship.nu`
export-env { $env.STARSHIP_SHELL = "nu"; load-env {
    STARSHIP_SESSION_KEY: (random chars -l 16)
    PROMPT_MULTILINE_INDICATOR: (
        ^starship prompt --continuation
    )

    # Does not play well with default character module.
    # TODO: Also Use starship vi mode indicators?
    PROMPT_INDICATOR: ""

    PROMPT_COMMAND: {||
        # jobs are not supported
        (
            ^starship prompt
                --cmd-duration ($env.CMD_DURATION_MS)
                --status (if $env.LAST_EXIT_CODE >= 0 { $env.LAST_EXIT_CODE } else { $env.LAST_EXIT_CODE * -1 + 10000 })
                --terminal-width (term size).columns
        )
    }

    config: ($env.config? | default {} | merge {
        render_right_prompt_on_last_line: true
        # render_right_prompt_on_last_line: false
    })

    PROMPT_COMMAND_RIGHT: {||
        [
        (
            print -n $"\e]7;file://(hostname)/(pwd)\e\\"
        )
        (
            ^starship prompt
                --right
                --cmd-duration ($env.CMD_DURATION_MS)
                --status (if $env.LAST_EXIT_CODE >= 0 { $env.LAST_EXIT_CODE } else { $env.LAST_EXIT_CODE * -1 + 10000 })
                --terminal-width (term size).columns
        )
        (
            if ((shells | length) > 1) {
                $"󰨊[(ansi green)(shells | zip (seq 0 (shells | length)) | each { { active: $in.0.active, path: $in.0.path, id: $in.1 } } | where active == true | first | get id) | (shells | where active == true | first | get path | path basename)(ansi reset)] "
            } else {
                ""
            }
        )
        (
            ([
                (ansi reset)
                (ansi magenta)
                (date now | format date '%x %X') # try to respect user's locale
            ] | str join | str replace --regex --all "([/:])" $"(ansi green)${1}(ansi magenta)" | str replace --regex --all "([AP]M)" $"(ansi magenta_underline)${1}")
        )
        ] | str join ""
    }
}}
