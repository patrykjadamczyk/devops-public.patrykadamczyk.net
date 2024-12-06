return {
  -- ===== LSP =====
  -- Configs for the Nvim LSP client
  {
    'neovim/nvim-lspconfig',
    priority = vim.g.patconfig_highest_base_priority - 90,
  },
}
