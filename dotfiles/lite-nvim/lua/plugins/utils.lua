return {
  -- ===== Vim =====
  -- This is a simple plugin that helps to end certain structures automatically
  {
    'tpope/vim-endwise',
    priority = vim.g.patconfig_highest_base_priority - 530,
  },
  -- Convenience file operations for neovim, written in lua.
  {
    "chrisgrieser/nvim-genghis",
    priority = vim.g.patconfig_highest_base_priority - 530,
    dependencies = "stevearc/dressing.nvim",
  },
  -- Granular project configuration
  {
    'tpope/vim-projectionist',
    priority = vim.g.patconfig_highest_base_priority - 530,
  },
  -- enable repeating supported plugin maps with "."
  {
    'tpope/vim-repeat',
    priority = vim.g.patconfig_highest_base_priority - 530,
  },
  -- Delete/change/add parentheses/quotes/XML-tags/much more with ease
  {
    'tpope/vim-surround',
    priority = vim.g.patconfig_highest_base_priority - 530,
  },
  -- Better Comments (having option to use tresitter and stuff)
  -- - Commands:
  -- - - `gcc` - Toggles the current line using linewise comment
  -- - - `gbc` - Toggles the current line using blockwise comment
  -- - - `[count]gcc` - Toggles the number of line given as a prefix-count using linewise
  -- - - `[count]gbc` - Toggles the number of line given as a prefix-count using blockwise
  -- - - `gc[count]{motion}` - (Op-pending) Toggles the region using linewise comment
  -- - - `gb[count]{motion}` - (Op-pending) Toggles the region using blockwise comment
  -- - - VISUAL mode
  -- - - `gc` - Toggles the region using linewise comment
  -- - - `gb` - Toggles the region using blockwise comment
  {
    'numToStr/Comment.nvim',
    priority = vim.g.patconfig_highest_base_priority - 530,
    event = "VeryLazy",
    config = function()
      local config = {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
      require('Comment').setup(config)
    end,
    lazy = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
  -- use CTRL-A/CTRL-X to increment dates, times, and more
  -- - Commands:
  -- - - <C-A> - Increment
  -- - - <C-X> - Decrement
  -- - - d<C-X> - sets the timestamp under the cursor to the current time
  -- - - d<C-A> - sets the timestamp under the cursor to the current UTC time
  {
    'tpope/vim-speeddating',
    priority = vim.g.patconfig_highest_base_priority - 530,
  },
  -- ===== Other =====
  -- This plugin automatically adjusts 'shiftwidth' and 'expandtab' heuristically based on the current file
  {
    'tpope/vim-sleuth',
    priority = vim.g.patconfig_highest_base_priority - 530,
  },
  -- Harpoon
  {
    "ThePrimeagen/harpoon",
    priority = vim.g.patconfig_highest_base_priority - 530,
  },
}
