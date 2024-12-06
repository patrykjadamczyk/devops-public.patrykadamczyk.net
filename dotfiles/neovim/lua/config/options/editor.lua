-- Spacing and autoindent
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
-- vim.o.backspace = 2
vim.o.shiftround = true
-- Make indenting smart
vim.o.smartindent = true
-- Folding
vim.o.foldmethod = "indent"
vim.o.foldlevelstart = 99
-- Vim Syntax Highlighting for Lua HEREDOC
vim.g.vimsyn_embed = "l"
-- Term gui colors
-- This should be set correctly by neovim itself
-- vim.cmd([[
-- let $NVIM_TUI_ENABLE_TRUE_COLOR=1
-- ]])
-- vim.o.termguicolors = true
-- Confirm to save changes before exiting modified buffer
vim.o.confirm = true
-- Remap Next change in diff to something else
vim.cmd([[
nnoremap [g [c
nnoremap ]g ]c
]])
vim.o.laststatus = 2
vim.o.showtabline = 2
vim.o.updatetime = 250
-- Force to not fold by default
vim.o.foldlevelstart = 99
vim.o.foldlevel = 99
vim.o.foldcolumn = "1"
vim.o.title = true
