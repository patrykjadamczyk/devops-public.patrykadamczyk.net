-- User Interface
vim.o.background = "dark"
vim.cmd([[
highlight Comment cterm=italic gui=italic
]])
-- Open new split panes to right and bottom, which feels more natural
-- Horizontal splits will be below
vim.o.splitbelow = true
-- Vertical splits will be to the right
vim.o.splitright = true
-- Line Numbers
-- Show line numbers
vim.o.number = true
vim.o.numberwidth = 5
-- Ruler
-- This option is specifying whether to show part of statusline with your current position in buffer
-- This option only is used by default statusline (which i don't use) so it's disabled to not compute that
-- vim.o.ruler = true
-- Don't show cursor position in command line
vim.o.ruler = false
-- Relative Numbering
-- vim.o.rnu!
vim.o.number = true
vim.o.relativenumber = true
-- This is default status column if statuscolumn plugin is not loaded
vim.cmd([[
let &stc='%C%s%l %{v:relnum} '
]])
-- Fold Column
-- vim.o.statuscolumn = '%C%s%l %{v:relnum}' --default
-- vim.o.statuscolumn = '%{foldlevel(v:lnum) > foldlevel(v:lnum - 1) ? (foldclosed(v:lnum) == -1 ? "▼" : "⏵") : " " }%s%l %{v:relnum}'
-- UI
vim.o.laststatus = 2
vim.o.showcmd = true
-- Scrolling
vim.o.scrolloff = 2
vim.o.sidescrolloff = 10
--#region listchars
-- MiniBasics list and listchars

-- NOTE: Having `tab` present is needed because `^I` will be shown if
-- omitted (documented in `:h listchars`).
-- Having it equal to a default value should be less intrusive.

-- Define which helper symbols to show
vim.o.listchars = "tab:> ,extends:…,precedes:…,nbsp:␣"
-- Show some helper symbols
vim.o.list = true

-- List chars
vim.o.list = true
vim.o.listchars = "tab:»·,trail:·,nbsp:·,precedes:←,extends:→"
-- vim.o.listchars = "tab:»·,trail:·,nbsp:·,precedes:←,extends:→,eol:↲"
vim.o.listchars = "tab:»·,trail:·,nbsp:·,space:·,precedes:←,extends:→"
--#endregion
-- Text Width Guide
-- vim.o.textwidth = 120
-- vim.o.colorcolumn = vim.o.colorcolumn + 1
vim.o.textwidth = 0
vim.o.colorcolumn = ""
-- vim.o.nowrap = true
-- Indent wrapped lines to match line start
vim.o.breakindent = true
-- Highlight current line
vim.o.cursorline = true
-- Wrap long lines at 'breakat' (if 'wrap' is set)
vim.o.linebreak = true
-- Don't show mode in command line
vim.o.showmode = false
-- Display long lines as just one line
-- vim.o.wrap = false
-- Always show sign column (otherwise it will shift text)
vim.o.signcolumn = "yes"
-- Don't show `~` outside of buffer
vim.o.fillchars = "eob: "
-- Make builtin completion menus slightly transparent
-- This doesn't look good
-- vim.o.pumblend  = 10
-- Make popup menu smaller
vim.o.pumheight = 10
-- Make floating windows slightly transparent
-- This doesn't look good
-- vim.o.winblend  = 10
