return {
  -- Peek when entering :line_nr
  {
    "nacro90/numb.nvim",
    priority = vim.g.patconfig_highest_base_priority - 270,
    config = function()
      require("numb").setup({
        show_numbers = true,
        show_cursorline = true,
        hide_relativenumbers = false,
      })
    end
  },
  -- Highlight arguments' definitions and usages, using Treesitter
  {
    "m-demare/hlargs.nvim",
    priority = vim.g.patconfig_highest_base_priority - 270,
    config = function ()
      require("hlargs").setup({
      })
    end
  },
  -- Highlight chunk under cursor
  {
    "shellRaining/hlchunk.nvim",
    priority = vim.g.patconfig_highest_base_priority - 270,
    event = { "UIEnter" },
    config = function()
      require("hlchunk").setup({})
    end
  }
}
