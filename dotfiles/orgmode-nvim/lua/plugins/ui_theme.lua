return {
  -- ===== UI Utils =====
  -- Transparent background on demand
  {
    "xiyaowong/transparent.nvim",
    priority = vim.g.patconfig_highest_base_priority,
    opts = {
      extra_groups = {
        "NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
        "NvimTreeNormal", -- NvimTree
      },
    },
  },
  -- ===== UI Theme =====
  -- Tokyonight Theme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = vim.g.patconfig_highest_base_priority,
    opts = {
      style = "night",
      transparent = vim.g.transparent_enabled,
      styles = {
        -- sidebars = "dark",
        -- floats = "dark",
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
}
