return {
  -- WhichKey is a lua plugin for Neovim 0.5 that displays a popup with possible key bindings of the command you started typing.
  {
    'folke/which-key.nvim',
    priority = vim.g.patconfig_highest_base_priority - 220,
    config = function ()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({})
    end
  },
}
