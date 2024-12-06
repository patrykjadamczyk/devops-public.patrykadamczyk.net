return {
    -- Debugging in NeoVim the print() way.
    {
        "andrewferrier/debugprint.nvim",
        dependencies = {
            "echasnovski/mini.nvim",
        },
        opts = {
            keymaps = {
                normal = {
                    plain_below = "g?p",
                    plain_above = "g?P",
                    variable_below = "g?v",
                    variable_above = "g?V",
                    variable_below_alwaysprompt = nil,
                    variable_above_alwaysprompt = nil,
                    textobj_below = "g?o",
                    textobj_above = "g?O",
                },
                visual = {
                    variable_below = "g?v",
                    variable_above = "g?V",
                },
            },
            commands = {
                toggle_comment_debug_prints = "ToggleCommentDebugPrints",
                delete_debug_prints = "DeleteDebugPrints",
            },
            -- Defaults
            display_counter = true,
            display_snippet = true,
            move_to_debugline = false,
            print_tag = "DEBUGPRINT",
            -- My overriden filetypes
            -- filetypes = require("config.plugins.debugprint_filetypes"),
        },
        config = true,
        keys = {
            { "g?p", mode = "n" },
            { "g?P", mode = "n" },
            { "g?v", mode = "n" },
            { "g?V", mode = "n" },
            { "g?o", mode = "n" },
            { "g?O", mode = "n" },
            { "g?v", mode = "x" },
            { "g?V", mode = "x" },
            { "g?d", mode = "n" },
            { "g?c", mode = "n" },
        },
        cmd = {
            "ToggleCommentDebugPrints",
            "DeleteDebugPrints",
        },
    },
}
