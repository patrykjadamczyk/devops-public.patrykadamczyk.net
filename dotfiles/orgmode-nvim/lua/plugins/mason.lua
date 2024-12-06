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
  },
  -- mason-lspconfig bridges mason.nvim with the lspconfig plugin
  {
    'williamboman/mason-lspconfig.nvim',
    priority = vim.g.patconfig_highest_base_priority - 100,
  },
}
