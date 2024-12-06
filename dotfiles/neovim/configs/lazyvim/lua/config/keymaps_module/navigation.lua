--#region Window Navigation (Ctrl+[H/J/K/L])
vim.keymap.set("n", "<C-h>", "<C-w>h", {
    noremap = true,
    silent = true,
    desc = "Go to left window",
})
vim.keymap.set("n", "<C-j>", "<C-w>j", {
    noremap = true,
    silent = true,
    desc = "Go to bottom window",
})
vim.keymap.set("n", "<C-k>", "<C-w>k", {
    noremap = true,
    silent = true,
    desc = "Go to top window",
})
vim.keymap.set("n", "<C-l>", "<C-w>l", {
    noremap = true,
    silent = true,
    desc = "Go to right window",
})
--#endregion
--#region Window Navigation (Ctrl+[ArrowKeys])
vim.keymap.set("n", "<C-Left>", "<C-w>h", {
    noremap = true,
    silent = true,
    desc = "Go to left window",
})
vim.keymap.set("n", "<C-Down>", "<C-w>j", {
    noremap = true,
    silent = true,
    desc = "Go to bottom window",
})
vim.keymap.set("n", "<C-Up>", "<C-w>k", {
    noremap = true,
    silent = true,
    desc = "Go to top window",
})
vim.keymap.set("n", "<C-Right>", "<C-w>l", {
    noremap = true,
    silent = true,
    desc = "Go to left window",
})
--#endregion
--#region Window Resize (Ctrl+W [left/down/up/right])
vim.keymap.set("n", "<C-w><left>", '"<Cmd>vertical resize -" . v:count1 . "<CR>"', {
    expr = true,
    replace_keycodes = false,
    desc = "Decrease window width",
})
vim.keymap.set("n", "<C-w><right>", '"<Cmd>vertical resize +" . v:count1 . "<CR>"', {
    expr = true,
    replace_keycodes = false,
    desc = "Increase window width",
})
vim.keymap.set("n", "<C-w><up>", '"<Cmd>resize +" . v:count1 . "<CR>"', {
    expr = true,
    replace_keycodes = false,
    desc = "Increase window height",
})
vim.keymap.set("n", "<C-w><down>", '"<Cmd>resize -" . v:count1 . "<CR>"', {
    expr = true,
    replace_keycodes = false,
    desc = "Decrease window height",
})
--#endregion
--#region Buffer Navigation (<LEADER> + B + [H/J/K/L] / N)
vim.keymap.set("n", "<leader>bh", "<cmd>bfirst<CR>", {
    noremap = true,
    silent = true,
    desc = "Go to first buffer",
})
vim.keymap.set("n", "<leader>bk", "<cmd>bnext<CR>", {
    noremap = true,
    silent = true,
    desc = "Go to next buffer",
})
vim.keymap.set("n", "<leader>bj", "<cmd>bprev<CR>", {
    noremap = true,
    silent = true,
    desc = "Go to previous buffer",
})
vim.keymap.set("n", "<leader>bl", "<cmd>blast<CR>", {
    noremap = true,
    silent = true,
    desc = "Go to last buffer",
})
vim.keymap.set("n", "<leader>bn", "<cmd>new<CR>", {
    noremap = true,
    silent = true,
    desc = "Open new buffer",
})
-- vim.keymap.set(
--   "n",
--   "<leader>bd",
--   "<cmd>bdelete<CR>",
--   {
--     noremap = true,
--     silent = true,
--     desc = "Close current buffer"
--   }
-- )
vim.keymap.set("n", "<leader>b<right>", "<cmd>bnext<CR>", {
    noremap = true,
    silent = true,
    desc = "Go to next buffer",
})
vim.keymap.set("n", "<leader>b<left>", "<cmd>bprev<CR>", {
    noremap = true,
    silent = true,
    desc = "Go to previous buffer",
})
vim.keymap.set("n", "<leader>bf", "<cmd>Telescope buffers<CR>", {
    noremap = true,
    silent = true,
    desc = "Open list of buffers in Telescope",
})
--#endregion
--#region Automatically center cursor when going half page up down
vim.keymap.set("n", "<C-i>", "<C-d>zz", {
    noremap = true,
    silent = true,
    desc = "Go down half page and center",
})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {
    noremap = true,
    silent = true,
    desc = "Go up half page and center",
})
--#endregion
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("x", "gP", [["_dP]], { desc = "Replace selected text with paste" })
