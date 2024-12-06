return {
  -- ===== Telescope =====
  -- All the lua functions I don't want to write twice.
  {
    'nvim-lua/plenary.nvim',
    priority = vim.g.patconfig_highest_base_priority - 150,
  },
  -- telescope.nvim is a highly extendable fuzzy finder over lists.
  {
    'nvim-telescope/telescope.nvim',
    priority = vim.g.patconfig_highest_base_priority - 150,
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
  -- A lua fork of vim-devicons. This plugin provides the same icons as well as colors for each icon.
  {
    'nvim-tree/nvim-web-devicons',
    priority = vim.g.patconfig_highest_base_priority - 150,
  },
}
