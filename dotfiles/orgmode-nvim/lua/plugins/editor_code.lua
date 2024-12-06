return {
  -- Todo Comments
  {
    "folke/todo-comments.nvim",
    priority = vim.g.patconfig_highest_base_priority - 310,
    config = function()
      require("todo-comments").setup({})
    end
  },
  -- AutoPair
  {
    'windwp/nvim-autopairs',
    priority = vim.g.patconfig_highest_base_priority - 310,
    event = "InsertEnter",
    opts = {
      map_cr = false,
      -- map_cr = true,
      check_ts = true,
    },
    config = function(plugin, opts)
      local npairs = require("nvim-autopairs")
      npairs.setup(opts)
      -- Place for special rules (docs: https://github.com/windwp/nvim-autopairs)
    end,
  },
  -- Better folds
  {
    'kevinhwang91/nvim-ufo',
    priority = vim.g.patconfig_highest_base_priority - 310,
    dependencies = {
      'kevinhwang91/promise-async',
    },
  },
  -- Colors for CSS etc
  {
    'NvChad/nvim-colorizer.lua',
    priority = vim.g.patconfig_highest_base_priority - 310,
    opts = {},
  },
  -- Move code blocks
  {
    'fedepujol/move.nvim',
    priority = vim.g.patconfig_highest_base_priority - 310,
  },
}
