return {
  -- Secure load local config files for neovim (CurrentDir/.vimrc)
  {
    'klen/nvim-config-local',
    priority = vim.g.patconfig_highest_base_priority - 280,
    config = function ()
      require('config-local').setup({
        -- config_files = { ".vimrc.lua", ".vimrc" },
        config_files = {
          ".nvim.lua",
          ".nvimrc",
          ".exrc",
          ".vimrc.lua",
          ".vimrc",
          ".nvim/.nvim.lua",
          ".nvim/.nvimrc",
          ".nvim/.exrc",
          ".nvim/.vimrc.lua",
          ".nvim/.vimrc",
        },
        autocommands_create = true,
        commands_create = true,
        lookup_parents = true,
      })
    end
  },
  -- NeoConf
  {
    "folke/neoconf.nvim",
    priority = vim.g.patconfig_highest_base_priority - 280,
    config = function()
      require("neoconf").setup({
        import = {
          vscode = true,
          coc = true,
          nlsp = true,
        },
        live_reload = true,
        filetype_jsonc = true,
      })
    end
  },
}
