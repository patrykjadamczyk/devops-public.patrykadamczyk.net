return {
  -- Project management
  {
    "ahmedkhalf/project.nvim",
    priority = vim.g.patconfig_highest_base_priority - 320,
    config = function()
      require("project_nvim").setup({
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
          enable = true,
          update_root = true
        },
      })
    end
  },
  -- Scratch files
  {
    "Sonicfury/scretch.nvim",
    priority = vim.g.patconfig_highest_base_priority - 320,
    config = function()
      require("scretch").setup({
        default_name = 'scratch_',
        default_type = "txt",
        split_cmd = "vsplit",
      })
    end
  },
}
