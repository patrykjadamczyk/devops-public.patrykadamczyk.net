return {
  -- A snazzy bufferline for Neovim
  {
    'akinsho/bufferline.nvim',
    priority = vim.g.patconfig_highest_base_priority - 240,
    version = "v3.*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function ()
      require("bufferline").setup({
        options = {
          mode = "tabs",
          always_show_bufferline = true,
        },
      })
    end
  },
  -- Scrollbar
  {
    "petertriho/nvim-scrollbar",
    priority = vim.g.patconfig_highest_base_priority - 240,
    config = function()
      require("scrollbar").setup({
        excluded_buftypes = {
          "terminal",
        },
        excluded_filetypes = {
          "prompt",
          "TelescopePrompt",
        }
      })
      -- require("gitsigns").setup()
      -- require("scrollbar.handlers.gitsigns").setup()
    end
  },
  -- A code outline window for skimming and quick navigation
  -- :AerialToggle
  {
    "stevearc/aerial.nvim",
    priority = vim.g.patconfig_highest_base_priority - 240,
    cmd = { "AerialToggle" },
    config = function()
      require("aerial").setup({
        backends = { "treesitter", "lsp", "markdown", "man" },
        default_direction = "prefer_left",
        layout = {
          default_direction = "prefer_left",
          min_width = 30,
        },
      })
    end
  },
}
