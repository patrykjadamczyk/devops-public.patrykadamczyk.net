return {
    -- ===== UI Utils =====
    -- Transparent background on demand
    {
        "xiyaowong/transparent.nvim",
        priority = vim.g.patconfig_highest_base_priority,
        opts = {
            extra_groups = {
                "NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
                "NvimTreeNormal", -- NvimTree
                -- Trouble
                "TroubleNormal",
                "TroubleNormalNC",
            },
        },
    },
    -- ===== UI Theme =====
    -- -- Material Monokai Color Scheme for Vim
    -- {
    --     "skielbasa/vim-material-monokai",
    --     priority = vim.g.patconfig_highest_base_priority,
    -- },
    -- Tokyonight Theme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = vim.g.patconfig_highest_base_priority,
        opts = {
            style = "night",
            transparent = vim.g.transparent_enabled,
            styles = {
                -- sidebars = "dark",
                -- floats = "dark",
                sidebars = "transparent",
                floats = "transparent",
            },
        },
    },
    -- Catpuccin Theme
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = vim.g.patconfig_highest_base_priority,
        opts = {
            transparent_background = vim.g.transparent_enabled,
            integrations = {
                aerial = true,
                mini = {
                    enabled = true,
                },
                cmp = true,
                dap = {
                    enabled = true,
                    enable_ui = true,
                },
                -- gitsigns = true,
                harpoon = true,
                lsp_saga = true,
                mason = true,
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = { "italic" },
                        hints = { "italic" },
                        warnings = { "italic" },
                        information = { "italic" },
                    },
                    underlines = {
                        errors = { "underline" },
                        hints = { "underline" },
                        warnings = { "underline" },
                        information = { "underline" },
                    },
                    inlay_hints = {
                        background = true,
                    },
                },
                neogit = true,
                noice = true,
                notify = true,
                nvimtree = true,
                treesitter = true,
                treesitter_context = true,
                ufo = true,
                overseer = true,
                telescope = {
                    enabled = true,
                },
                lsp_trouble = true,
            },
        },
    },
}
