return {
    -- Debugging in NeoVim the print() way.
    {
        "andrewferrier/debugprint.nvim",
        priority = vim.g.patconfig_highest_base_priority - 310,
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
            filetypes = require("config.plugins.debugprint_filetypes"),
        },
        config = true,
        keys = {
            { "g?p", mode = "n", desc = "Checkpoint log below" },
            { "g?P", mode = "n", desc = "Checkpoint log above" },
            { "g?v", mode = "n", desc = "Log variable below" },
            { "g?V", mode = "n", desc = "Log variable above" },
            { "g?o", mode = "n", desc = "Log textobject below" },
            { "g?O", mode = "n", desc = "Log textobject above" },
            { "g?v", mode = "x", desc = "Log variable below" },
            { "g?V", mode = "x", desc = "Log variable above" },
            { "g?d", mode = "n", desc = "Delete logs" },
            { "g?c", mode = "n", desc = "Comment logs" },
        },
        cmd = {
            "ToggleCommentDebugPrints",
            "DeleteDebugPrints",
        },
    },
}
