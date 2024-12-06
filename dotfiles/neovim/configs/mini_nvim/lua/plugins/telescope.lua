return {
    -- ===== Telescope =====
    -- All the lua functions I don't want to write twice.
    {
        "nvim-lua/plenary.nvim",
        priority = vim.g.patconfig_highest_base_priority - 150,
    },
    -- A lua fork of vim-devicons. This plugin provides the same icons as well as colors for each icon.
    {
        "nvim-tree/nvim-web-devicons",
        config = true,
        cond = function()
            return false
        end,
        priority = vim.g.patconfig_highest_base_priority - 150,
    },
    -- Disable/Enable LSP clients for buffers.
    {
        "adoyle-h/lsp-toggle.nvim",
        config = true,
        priority = vim.g.patconfig_highest_base_priority - 170,
    },
    -- telescope.nvim is a highly extendable fuzzy finder over lists.
    {
        "nvim-telescope/telescope.nvim",
        priority = vim.g.patconfig_highest_base_priority - 150,
        -- branch = "0.1.x",
        opts = {
            defaults = {
                -- When I search for stuff in telescope, I want the path to be shown
                -- first, this helps in files that are very deep in the tree and I
                -- cannot see their name.
                -- Also notice the "reverse_directories" option which will show the
                -- closest dir right after the filename
                path_display = {
                    filename_first = {
                        reverse_directories = true,
                    },
                },
            },
            extensions = {
                frecency = {
                    db_safe_mode = false,
                    auto_validate = false,
                    show_scores = false,
                    show_filter_column = false,
                },
            },
        },
        config = function(_, opts)
            -- require("nvim-web-devicons").setup()
            require("telescope").setup(opts)
            require("telescope").load_extension("emoji")
            require("telescope").load_extension("glyph")
            require("telescope").load_extension("env")
            require("telescope").load_extension("find_pickers")
            require("telescope").load_extension("dap")
            require("telescope").load_extension("heading")
            require("telescope").load_extension("ui-select")
            require("telescope").load_extension("frecency")
            require("telescope").load_extension("scope")
            require("telescope").load_extension("lazygit")
            require("telescope").load_extension("refactoring")
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
            -- "nvim-tree/nvim-web-devicons",
            "echasnovski/mini.nvim",
            -- An extension for telescope.nvim that allows you to search emojis
            -- - Commands:
            -- - - :Telescope emoji
            {
                "xiyaowong/telescope-emoji.nvim",
            },
            -- An extension for telescope.nvim that allows you to search font glyphs
            {
                "ghassan0/telescope-glyph.nvim",
            },
            -- -- MUST HAVE PLUGIN FOR NEOVIM --
            -- A searchable cheatsheet for neovim from within the editor using Telescope
            -- - Commands:
            -- - - :Cheatsheet / <Leader>? (\?)
            {
                "sudormrfbin/cheatsheet.nvim",
                opts = {
                    bundled_cheatsheets = true,
                    bundled_plugin_cheatsheets = true,
                    include_only_installed_plugins = true,
                },
            },
            -- Watch environment variables with telescope
            {
                "LinArcX/telescope-env.nvim",
            },
            -- Find all pickers available (includes builtins and extensions)
            {
                "keyvchan/telescope-find-pickers.nvim",
            },
            -- Telescope DAP (Debug Adapter Protocol)
            {
                "nvim-telescope/telescope-dap.nvim",
            },
            -- Telescope Headings
            {
                "crispgm/telescope-heading.nvim",
            },
            -- Telescope Symbols
            {
                "nvim-telescope/telescope-symbols.nvim",
            },
            -- Telescope UI Select
            {
                "nvim-telescope/telescope-ui-select.nvim",
            },
            -- Telescope Frecency
            {
                "nvim-telescope/telescope-frecency.nvim",
            },
            -- Refactoring
            {
                "ThePrimeagen/refactoring.nvim",
            },
        },
    },
}
