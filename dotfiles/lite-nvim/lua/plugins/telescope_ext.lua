return {
  -- ===== Telescope =====
  -- A tab switcher extension for Telescope with information about each tab's working directory.
  -- - Commands:
  -- - - :Telescope tele_tabby list
  {
    'TC72/telescope-tele-tabby.nvim',
    priority = vim.g.patconfig_highest_base_priority - 160,
  },
  -- An extension for telescope.nvim that allows you to search emojis
  -- - Commands:
  -- - - :Telescope emoji
  {
    'xiyaowong/telescope-emoji.nvim',
    priority = vim.g.patconfig_highest_base_priority - 160,
  },
  -- An extension for telescope.nvim that allows you to search font glyphs
  {
    'ghassan0/telescope-glyph.nvim',
    priority = vim.g.patconfig_highest_base_priority - 160,
  },
  -- -- MUST HAVE PLUGIN FOR NEOVIM --
  -- A searchable cheatsheet for neovim from within the editor using Telescope
  -- - Commands:
  -- - - :Cheatsheet / <Leader>? (\?)
  {
    'sudormrfbin/cheatsheet.nvim',
    priority = vim.g.patconfig_highest_base_priority - 160,
    opts = {
      bundled_cheatsheets = true,
      bundled_plugin_cheatsheets = true,
      include_only_installed_plugins = true,
    },
  },
  -- telescope-command-palette.nvim is a neovim plugin written entirely in lua that will help you to access your custom commands/function/key-bindings.
  {
    'patrykjadamczyk/telescope-command-palette.nvim',
    priority = vim.g.patconfig_highest_base_priority - 160,
  },
  -- Watch environment variables with telescope
  {
    'LinArcX/telescope-env.nvim',
    priority = vim.g.patconfig_highest_base_priority - 160,
  },
  -- telescope-file-browser.nvim is a file browser extension for telescope.nvim.
  {
    'nvim-telescope/telescope-file-browser.nvim',
    priority = vim.g.patconfig_highest_base_priority - 160,
  },
  -- Find all pickers available (includes builtins and extensions)
  {
    'keyvchan/telescope-find-pickers.nvim',
    priority = vim.g.patconfig_highest_base_priority - 160,
  },
  -- Visualize your undo tree and fuzzy-search changes in it. For those days where committing early and often doesn't work out.
  -- - Commands:
  -- - - :Telescope undo
  {
    'debugloop/telescope-undo.nvim',
    priority = vim.g.patconfig_highest_base_priority - 160,
  },
  -- Telescope Headings
  {
    'crispgm/telescope-heading.nvim',
    priority = vim.g.patconfig_highest_base_priority - 160,
  },
  -- Telescope Symbols
  {
    'nvim-telescope/telescope-symbols.nvim',
    priority = vim.g.patconfig_highest_base_priority - 160,
  },
  -- Telescope UI Select
  {
    'nvim-telescope/telescope-ui-select.nvim',
    priority = vim.g.patconfig_highest_base_priority - 160,
  },
  -- Telescope Frecency
  {
    'nvim-telescope/telescope-frecency.nvim',
    priority = vim.g.patconfig_highest_base_priority - 160,
  },
}
