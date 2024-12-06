return {
  -- ===== Autocompletion Engine =====
  -- Ctrl+Y to autocomplete
  -- NeoVim Completion Engine
  {
    'hrsh7th/nvim-cmp',
    priority = vim.g.patconfig_highest_base_priority - 30,
  },
  -- LSP Source for nvim-cmp
  {
    'hrsh7th/cmp-nvim-lsp',
    priority = vim.g.patconfig_highest_base_priority - 30,
  },
  -- Buffer Source for nvim-cmp
  {
    'hrsh7th/cmp-buffer',
    priority = vim.g.patconfig_highest_base_priority - 30,
  },
  -- Paths Source for nvim-cmp
  {
    'FelipeLema/cmp-async-path',
    priority = vim.g.patconfig_highest_base_priority - 30,
  },
  -- Lua Source for nvim-cmp
  {
    'hrsh7th/cmp-nvim-lua',
    priority = vim.g.patconfig_highest_base_priority - 30,
  },
  -- VSnip -> VSCode Snippet Syntax for Snippets in Vim
  {
    'hrsh7th/vim-vsnip',
    priority = vim.g.patconfig_highest_base_priority - 30,
  },
  {
    'hrsh7th/cmp-vsnip',
    priority = vim.g.patconfig_highest_base_priority - 30,
  },
  -- Snippets
  {
    'rafamadriz/friendly-snippets',
    priority = vim.g.patconfig_highest_base_priority - 30,
  },
  -- Spell Check for nvim-cmp
  {
    'f3fora/cmp-spell',
    priority = vim.g.patconfig_highest_base_priority - 30,
  },
  -- Cmdline Source for nvim-cmp
  {
    'hrsh7th/cmp-cmdline',
    priority = vim.g.patconfig_highest_base_priority - 30,
  },
  -- Fonts Source for nvim-cmp
  {
    'amarakon/nvim-cmp-fonts',
    priority = vim.g.patconfig_highest_base_priority - 30,
  },
  -- Omni Func Source for nvim-cmp
  {
    'hrsh7th/cmp-omni',
    priority = vim.g.patconfig_highest_base_priority - 30,
  },
}
