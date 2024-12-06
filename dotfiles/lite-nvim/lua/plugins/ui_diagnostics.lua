return {
  -- A pretty list for showing diagnostics, references, telescope results, quickfix and location lists to help you solve all the trouble your code is causing.
  {
    'folke/trouble.nvim',
    priority = vim.g.patconfig_highest_base_priority - 230,
    config = function ()
      require("trouble").setup({
        -- auto_open = true,
        -- auto_close = true,
      })
    end
  },
}
