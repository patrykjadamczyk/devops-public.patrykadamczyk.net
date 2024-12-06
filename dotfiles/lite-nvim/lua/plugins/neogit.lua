return {
  -- ===== Git =====
  -- NeoGit
  {
    "NeogitOrg/neogit",
    cmd = { "Neogit" },
    priority = vim.g.patconfig_highest_base_priority - 170,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "sindrets/diffview.nvim",
    },
    config = true
  },
}
