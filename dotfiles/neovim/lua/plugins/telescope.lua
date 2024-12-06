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
                tele_tabby = {
                    use_highlighter = true,
                },
                command_palette = {},
                frecency = {
                    db_safe_mode = false,
                    auto_validate = false,
                    show_scores = false,
                    show_filter_column = false,
                },
                file_browser = {
                    hidden = {
                        file_browser = true,
                        folder_browser = true,
                    },
                    respect_gitignore = false,
                },
                -- undo = {
                --     use_delta = false,
                --     -- This goes arround using PowerShell as shell for delta (WTF is it not using vim shell option WTH)
                --     -- Normal
                --     -- use_custom_command = { "nu", "-c", "echo '$DIFF' | delta" },
                --     -- Side by side
                --     use_custom_command = { "nu", "-c", "echo '$DIFF' | delta -s" },
                --     -- side_by_side = true,
                --     -- diff_context_lines = vim.o.scrolloff,
                --     -- entry_format = "state #$ID, $STAT, $TIME",
                --     entry_format = "state $ID diff $STAT time $TIME",
                --     -- time_format = "",
                --     -- saved_only = false,
                --     -- mappings = {
                --     --     i = {
                --     --         ["<cr>"] = require("telescope-undo.actions").yank_additions,
                --     --         ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
                --     --         ["<C-cr>"] = require("telescope-undo.actions").restore,
                --     --         -- alternative defaults, for users whose terminals do questionable things with modified <cr>
                --     --         ["<C-y>"] = require("telescope-undo.actions").yank_deletions,
                --     --         ["<C-r>"] = require("telescope-undo.actions").restore,
                --     --     },
                --     --     n = {
                --     --         ["y"] = require("telescope-undo.actions").yank_additions,
                --     --         ["Y"] = require("telescope-undo.actions").yank_deletions,
                --     --         ["u"] = require("telescope-undo.actions").restore,
                --     --     },
                --     -- },
                -- },
            },
        },
        config = function(_, opts)
            -- require("nvim-web-devicons").setup()
            require("telescope").setup(opts)
            require("telescope").load_extension("tele_tabby")
            require("telescope").load_extension("emoji")
            require("telescope").load_extension("glyph")
            require("telescope").load_extension("command_palette")
            require("telescope").load_extension("env")
            require("telescope").load_extension("file_browser")
            require("telescope").load_extension("find_pickers")
            -- require("telescope").load_extension("undo")
            require("telescope").load_extension("notify")
            require("telescope").load_extension("projects")
            require("telescope").load_extension("package_info")
            require("telescope").load_extension("dap")
            require("telescope").load_extension("heading")
            require("telescope").load_extension("ui-select")
            require("telescope").load_extension("frecency")
            require("telescope").load_extension("find_template")
            require("telescope").load_extension("scope")
            require("telescope").load_extension("lazygit")
            require("telescope").load_extension("refactoring")
            -- require("telescope").load_extension("macroni")
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
            -- "nvim-tree/nvim-web-devicons",
            "echasnovski/mini.nvim",
            -- A tab switcher extension for Telescope with information about each tab's working directory.
            -- - Commands:
            -- - - :Telescope tele_tabby list
            {
                "TC72/telescope-tele-tabby.nvim",
            },
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
            -- telescope-command-palette.nvim is a neovim plugin written entirely in lua that will help you to access your custom commands/function/key-bindings.
            {
                "patrykjadamczyk/telescope-command-palette.nvim",
            },
            -- Watch environment variables with telescope
            {
                "LinArcX/telescope-env.nvim",
            },
            -- telescope-file-browser.nvim is a file browser extension for telescope.nvim.
            {
                "nvim-telescope/telescope-file-browser.nvim",
            },
            -- Find all pickers available (includes builtins and extensions)
            {
                "keyvchan/telescope-find-pickers.nvim",
            },
            -- Visualize your undo tree and fuzzy-search changes in it. For those days where committing early and often doesn't work out.
            -- - Commands:
            -- - - :Telescope undo
            -- {
            --     "debugloop/telescope-undo.nvim",
            -- },
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
