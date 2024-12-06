-- " ==================== Plugins ====================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Plugins
  { import = "plugins" }
}, {
  -- Configuration
  checker = {
    -- automatically check for plugin updates
    enabled = true,
    notify = true,
    frequency = 3600,
  },
})

-- Additional Configuration
require("config.plugins.config.autocomplete")
require("config.plugins.config.lsp")
vim.cmd('source ' .. vim.g.nvimrc .. '/lua/config/plugins/config/theme.vim')
require("config.plugins.config.telescope")
