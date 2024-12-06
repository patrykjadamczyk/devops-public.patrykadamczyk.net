-- Encoding
vim.o.encoding = "utf-8"
-- Syntax
-- Enable syntax highlighting if it wasn't already (as it is time consuming)
if vim.fn.exists("syntax_on") ~= 1 then
    vim.cmd([[syntax enable]])
end
-- Enable all filetype plugins
vim.cmd("filetype plugin indent on")
-- History
vim.o.history = 100
-- Search
-- Show search results while typing
vim.o.incsearch = true
vim.o.hlsearch = true
-- Ignore case when searching (use `\C` to force not doing that)
vim.o.ignorecase = true
-- Infer letter cases for a richer built-in keyword completion
vim.o.infercase = true
-- Don't ignore case when searching if pattern has upper case
vim.o.smartcase = true
-- Completion
vim.o.wildmenu = true
vim.o.wildmode = "list:longest,full"
-- Auto complete with dictionary words
-- vim.o.complete += kspell
vim.o.complete = ".,w,b,u,t,kspell"
-- Customize completions
vim.o.completeopt = "menuone,noinsert,noselect"
-- Spell check
-- vim.o.spell = true
vim.o.spelllang = "en,en_us,pl,eo,sv_se"
-- Editor
-- y/p -> neovim copy/paste | gy/gp -> system copy/paste
vim.o.clipboard = "unnamed"
-- y/p/gy/gp system copy/paste
-- vim.o.clipboard = "unnamed,unnamedplus"
-- Mouse
-- Enable mouse for all available modes
vim.o.mouse = "a"
-- Enable undo history
-- Enable persistent undo (see also `:h undodir`)
vim.o.undofile = true
-- Auto reload changed files
vim.o.autoread = true
-- Performance
-- vim.o.lazyredraw = true
vim.o.ttyfast = true
vim.o.timeoutlen = 1000
vim.o.ttimeoutlen = 0
-- Backup Files
-- Don't store backup while overwriting the file
vim.o.backup = false
-- Don't store backup while overwriting the file
vim.o.writebackup = false
vim.o.swapfile = false
-- Bells
vim.o.errorbells = false
vim.o.visualbell = false
-- Allow going past the end of line in visual block mode
vim.o.virtualedit = "block"
-- Don't autoformat comments
vim.o.formatoptions = "qjl1"
-- Reduce command line messages
vim.opt.shortmess:append("WcC")
-- Reduce scroll during window split
vim.o.splitkeep = "screen"
