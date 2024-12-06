return {
    {
        "vhyrro/luarocks.nvim",
        priority = vim.g.patconfig_highest_base_priority,
        config = true,
    },
    -- Neorg
    {
        "nvim-neorg/neorg",
        priority = vim.g.patconfig_highest_base_priority - 510,
        -- build = ":Neorg sync-parsers",
        config = true,
        opts = {
            load = {
                ["core.defaults"] = {}, -- Loads default behaviour
                ["core.syntax"] = {},
                ["core.concealer"] = { -- Adds pretty icons to your documents
                    config = {
                        -- Fixing icons (which don't work correctly by default)
                        icon_preset = "basic",
                    },
                },
                ["core.dirman"] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            notes = "~/.config/neorg/notes",
                            todo = "~/.config/neorg/todo",
                            journal = "~/.config/neorg/journal",
                            svenska = "~/.config/neorg/svenska",
                        },
                        default_workspace = "notes",
                    },
                },
                ["core.integrations.telescope"] = {},
                ["core.integrations.treesitter"] = {},
                ["core.completion"] = {
                    config = {
                        engine = "nvim-cmp",
                        name = "[Neorg]",
                    },
                },
                ["core.summary"] = {},
                ["core.journal"] = {
                    config = {
                        journal_folder = "journal",
                        workspace = "journal",
                    },
                },
                ["core.esupports.indent"] = {},
                ["core.esupports.metagen"] = {},
                ["core.pivot"] = {},
                ["core.itero"] = {},
                ["core.promo"] = {},
                ["core.export"] = {},
                -- ["core.ui.calendar"] = {},
                ["core.clipboard.code-blocks"] = {},
                ["core.keybinds"] = {
                    config = {
                        hook = function(keybinds)
                            -- Added keymap for code block magnify
                            keybinds.remap_event(
                                "norg",
                                "n",
                                "<LocalLeader>nc",
                                "core.looking-glass.magnify-code-block"
                            )
                        end,
                    },
                },
            },
        },
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-neorg/neorg-telescope" },
            { "vhyrro/luarocks.nvim" },
        },
    },
}
