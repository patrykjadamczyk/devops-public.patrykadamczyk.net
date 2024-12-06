return {
    -- ===== LSP =====
    -- Extended LSP for C#
    {
        "Hoffs/omnisharp-extended-lsp.nvim",
        cond = function()
            return vim.g.patconfig_csharp_server__omnisharp == 1 or vim.g.patconfig_csharp_server__omnisharp_mono == 1
        end,
        priority = vim.g.patconfig_highest_base_priority - 120,
    },
    -- Extended LSP for C#
    {
        "Decodetalkers/csharpls-extended-lsp.nvim",
        cond = function()
            return vim.g.patconfig_csharp_server__csharp_ls == 1
        end,
        priority = vim.g.patconfig_highest_base_priority - 120,
    },
    -- Extended LSP for C#
    {
        "seblj/roslyn.nvim",
        ft = "cs",
        cond = function()
            return vim.g.patconfig_csharp_server__roslyn == 1
        end,
        priority = vim.g.patconfig_highest_base_priority - 120,
        opts = {
            -- Here you can pass in any options that that you would like to pass to `vim.lsp.start`.
            -- Use `:h vim.lsp.ClientConfig` to see all possible options.
            -- The only options that are overwritten and won't have any effect by setting here:
            --     - `name`
            --     - `cmd`
            --     - `root_dir`
            config = {
                settings = {
                    ["csharp|background_analysis"] = {
                        dotnet_analyzer_diagnostics_scope = "fullSolution",
                        dotnet_compiler_diagnostics_scope = "fullSolution",
                    },
                    ["csharp|code_lens"] = {
                        -- You must refresh the code lens yourself. Check :h vim.lsp.codelens.refresh() and the example autocmd.
                        dotnet_enable_references_code_lens = true,
                        dotnet_enable_tests_code_lens = true,
                    },
                    ["csharp|completion"] = {
                        dotnet_show_completion_items_from_unimported_namespaces = true,
                        dotnet_show_name_completion_suggestions = true,
                    },
                    ["csharp|inlay_hints"] = {
                        csharp_enable_inlay_hints_for_implicit_object_creation = true,
                        csharp_enable_inlay_hints_for_implicit_variable_types = true,
                        csharp_enable_inlay_hints_for_lambda_parameter_types = true,
                        csharp_enable_inlay_hints_for_types = true,
                        dotnet_enable_inlay_hints_for_indexer_parameters = true,
                        dotnet_enable_inlay_hints_for_literal_parameters = true,
                        dotnet_enable_inlay_hints_for_object_creation_parameters = true,
                        dotnet_enable_inlay_hints_for_other_parameters = true,
                        dotnet_enable_inlay_hints_for_parameters = true,
                        dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
                        dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
                        dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
                    },
                    ["navigation"] = {
                        ["dotnet_navigate_to_decompiled_sources"] = true,
                    },
                },
            },
            -- NOTE: Set `filewatching` to false if you experience performance problems.
            -- Defaults to true, since turning it off is a hack.
            -- If you notice that the server is _super_ slow, it is probably because of file watching
            -- Neovim becomes super unresponsive on some large codebases, because it schedules the file watching on the event loop.
            -- This issue goes away by disabling this capability, but roslyn will fallback to its own file watching,
            -- which can make the server super slow to initialize.
            -- Setting this option to false will indicate to the server that neovim will do the file watching.
            -- However, in `hacks.lua` I will also just don't start off any watchers, which seems to make the server
            -- a lot faster to initialize.
            filewatching = true,
        },
    },
    -- Cleanup all LSP servers that are unused for specific amount of time
    {
        "zeioth/garbage-day.nvim",
        dependencies = "neovim/nvim-lspconfig",
        event = "VeryLazy",
        config = true,
        opts = {
            grace_period = 60 * 15, -- 60 seconds * 15 = 15 minutes
            notifications = true,
        },
    },
    -- Additional lua configuration, makes nvim stuff amazing!
    -- {
    --     "folke/neodev.nvim",
    --     priority = vim.g.patconfig_highest_base_priority - 120,
    --     opts = {
    --         library = {
    --             enabled = true,
    --             runtime = true,
    --             types = true,
    --             plugins = true,
    --             -- plugins = {
    --             --   "nvim-dap-ui",
    --             --   "nvim-treesitter",
    --             --   "plenary.nvim",
    --             --   "telescope.nvim"
    --             -- },
    --         },
    --         setup_jsonls = true,
    --         lspconfig = true,
    --         pathStrict = true,
    --         -- override = function(root_dir, library)
    --         --   if string.find(root_dir, "nvim", 1, true) == 1 then
    --         --     library.enabled = true
    --         --     library.plugins = true
    --         --   end
    --         --   if string.find(root_dir, "neovim", 1, true) == 1 then
    --         --     library.enabled = true
    --         --     library.plugins = true
    --         --   end
    --         -- end,
    --     },
    -- },
    {
        "folke/lazydev.nvim",
        priority = vim.g.patconfig_highest_base_priority - 120,
        ft = "lua",
        cmd = "LazyDev",
        opts = {
            library = {
                { path = "luvit-meta/library", words = { "vim%.uv" } },
                { path = "LazyVim", words = { "LazyVim" } },
                { path = "lazy.nvim", words = { "LazyVim" } },
                { path = "wezterm-types", mods = { "wezterm" } },
                -- { path = "xmake-luals-addon/library", files = { "xmake.lua" } },
            },
        },
        dependencies = {
            {
                "Bilal2453/luvit-meta",
                lazy = true,
            },
            {
                "justinsgithub/wezterm-types",
                lazy = true,
            },
            -- {
            --     "LelouchHe/xmake-luals-addon",
            --     lazy = true,
            -- },
        },
    },
}
