return {
    {
        "tiagovla/scope.nvim",
        priority = vim.g.patconfig_highest_base_priority - 240,
        config = true,
        opts = {},
    },
    -- A snazzy bufferline for Neovim
    {
        "akinsho/bufferline.nvim",
        -- version = "*",
        -- "grappas/bufferline.nvim",
        -- branch = "10_is_array",
        priority = vim.g.patconfig_highest_base_priority - 240,
        -- dependencies = "nvim-tree/nvim-web-devicons",
        dependencies = "echasnovski/mini.nvim",
        config = function()
            local forbidden_filetypes = {
                "NvimTree",
                "SidebarNvim",
                "starter",
            }
            require("bufferline").setup({
                options = {
                    -- mode = "tabs",
                    mode = "buffers",
                    themable = true,
                    always_show_bufferline = true,
                    custom_filter = function(buf_number, _)
                        if vim.fn.isdirectory(vim.fn.bufname(buf_number)) == 1 then
                            return false
                        end
                        for _, forbidden_filetype in ipairs(forbidden_filetypes) do
                            if vim.bo[buf_number].filetype == forbidden_filetype then
                                return false
                            end
                        end
                        return true
                    end,
                },
            })
        end,
    },
    -- Scrollbar
    {
        "petertriho/nvim-scrollbar",
        priority = vim.g.patconfig_highest_base_priority - 240,
        config = function()
            require("scrollbar").setup({
                excluded_buftypes = {
                    "terminal",
                },
                excluded_filetypes = {
                    "prompt",
                    "TelescopePrompt",
                },
            })
            -- require("gitsigns").setup()
            -- require("scrollbar.handlers.gitsigns").setup()
        end,
    },
    -- A code outline window for skimming and quick navigation
    -- :AerialToggle
    {
        "stevearc/aerial.nvim",
        priority = vim.g.patconfig_highest_base_priority - 240,
        config = function()
            require("aerial").setup({
                backends = { "treesitter", "lsp", "markdown", "man" },
                default_direction = "prefer_left",
                layout = {
                    default_direction = "prefer_left",
                    min_width = 30,
                },
            })
        end,
    },
    -- Sidebar
    {
        "sidebar-nvim/sidebar.nvim",
        priority = vim.g.patconfig_highest_base_priority - 240,
        cond = function()
            return false
        end,
        config = function()
            require("sidebar-nvim").setup({
                open = true,
                -- open = false,
                -- side = "left",
                side = "right",
                section = {
                    "datetime",
                    "diagnostic",
                    "symbols",
                    "todos",
                    "git",
                },
                -- initial_width = 35,
                initial_width = 30,
                -- update_interval = 1000,
                update_interval = 500,
                section_separator = "-----",
                datetime = {
                    format = "%d/%m/%Y, %H:%M:%S",
                    clocks = { { name = "Current Time" } },
                },
            })
        end,
    },
}
