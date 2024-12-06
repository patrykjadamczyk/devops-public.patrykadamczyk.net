-- This file is only for plugin options that can't be configured via PluginSpec

-- Do not map stuff for Visual Multi
vim.g.VM_default_mappings = 0

-- Do not close the preview tab when switching to other buffers
vim.g.mkdp_auto_close = 0

-- Codeium.vim no keymaps
-- vim.g.codeium_no_map_tab = 1
-- vim.g.codeium_disable_bindings = 1

-- Show warnings for invalid c like syntax
vim.g.v_warnings = 1
-- Set Tags for Vim-fugitive
vim.cmd([[set tags^=.git/tags]])

-- OCaml
-- vim.g.opamshare = substitute(system('opam var share'),'\n$','','''')
-- vim.g.opamshare = "C:\Users\patry\AppData\Local\opam\playground\share"
-- vim.cmd([[execute "set rtp+=-- . g:opamshare . "/merlin/vim"]])
-- vim.cmd([[execute "helptags -- . g:opamshare . "/merlin/vim/doc"]])

-- vim.cmd([[
-- " Vsnip Configuration
-- let g:vsnip_filetypes = {}
-- let g:vsnip_filetypes.javascriptreact = ['javascript']
-- let g:vsnip_filetypes.typescriptreact = ['typescript']
-- let g:vsnip_filetypes.ps1 = ['ps1', 'PowerShell']
-- let g:vsnip_filetypes.PowerShell = ['ps1', 'PowerShell']
-- ]])
