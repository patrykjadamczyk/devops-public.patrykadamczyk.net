return {
    -- ===== LSP =====
    -- Portable package manager for Neovim that runs everywhere Neovim runs.
    -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
    -- - Commands:
    -- - - :Mason - Graphical status window
    -- - - :MasonUpdate - Update all Mason packages
    -- - - :MasonInstall <package> - Install a Mason package
    -- - - :MasonUninstall <package> - Uninstall a Mason package
    -- - - :MasonUninstallAll - Uninstall all Mason packages
    -- - - :MasonLog - Open log file
    {
        "williamboman/mason.nvim",
        priority = vim.g.patconfig_highest_base_priority - 100,
        build = ":MasonUpdate",
        dependencies = {
            -- mason-lspconfig bridges mason.nvim with the lspconfig plugin
            "williamboman/mason-lspconfig.nvim",
            -- mason-bridge bridges mason.nvim with conform.nvim and nvim-lint
            "frostplexx/mason-bridge.nvim",
            -- Mason lockfile
            -- Adds :MasonLock and :MasonRestore
            {
                "patrykjadamczyk/mason-lock.nvim",
                init = function()
                    require("mason-lock").setup({
                        lockfile_path = vim.fn.stdpath("config") .. "/mason-lock.json",
                    })
                end,
            },
        },
    },
}
