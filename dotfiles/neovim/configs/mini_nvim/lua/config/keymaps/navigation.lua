--#region Window Navigation (Ctrl+[H/J/K/L])
PatVimKeyMapSet({
    "n",
    "<C-h>",
    "<C-w>h",
    {
        noremap = true,
        silent = true,
        desc = "Go to left window",
    },
})
PatVimKeyMapSet({
    "n",
    "<C-j>",
    "<C-w>j",
    {
        noremap = true,
        silent = true,
        desc = "Go to bottom window",
    },
})
PatVimKeyMapSet({
    "n",
    "<C-k>",
    "<C-w>k",
    {
        noremap = true,
        silent = true,
        desc = "Go to top window",
    },
})
PatVimKeyMapSet({
    "n",
    "<C-l>",
    "<C-w>l",
    {
        noremap = true,
        silent = true,
        desc = "Go to right window",
    },
})
--#endregion
--#region Window Navigation (Ctrl+[ArrowKeys])
PatVimKeyMapSet({
    "n",
    "<C-Left>",
    "<C-w>h",
    {
        noremap = true,
        silent = true,
        desc = "Go to left window",
    },
})
PatVimKeyMapSet({
    "n",
    "<C-Down>",
    "<C-w>j",
    {
        noremap = true,
        silent = true,
        desc = "Go to bottom window",
    },
})
PatVimKeyMapSet({
    "n",
    "<C-Up>",
    "<C-w>k",
    {
        noremap = true,
        silent = true,
        desc = "Go to top window",
    },
})
PatVimKeyMapSet({
    "n",
    "<C-Right>",
    "<C-w>l",
    {
        noremap = true,
        silent = true,
        desc = "Go to left window",
    },
})
--#endregion
--#region Window Resize (Ctrl+W [left/down/up/right])
PatVimKeyMapSet({
    "n",
    "<C-w><left>",
    '"<Cmd>vertical resize -" . v:count1 . "<CR>"',
    {
        expr = true,
        replace_keycodes = false,
        desc = "Decrease window width",
    },
})
PatVimKeyMapSet({
    "n",
    "<C-w><right>",
    '"<Cmd>vertical resize +" . v:count1 . "<CR>"',
    {
        expr = true,
        replace_keycodes = false,
        desc = "Increase window width",
    },
})
PatVimKeyMapSet({
    "n",
    "<C-w><up>",
    '"<Cmd>resize +" . v:count1 . "<CR>"',
    {
        expr = true,
        replace_keycodes = false,
        desc = "Increase window height",
    },
})
PatVimKeyMapSet({
    "n",
    "<C-w><down>",
    '"<Cmd>resize -" . v:count1 . "<CR>"',
    {
        expr = true,
        replace_keycodes = false,
        desc = "Decrease window height",
    },
})
--#endregion
--#region Tab Navigation (T + [H/J/K/L] / TN)
-- PatVimKeyMapSet({
--   "n",
--   "th",
--   "<cmd>tabfirst<CR>",
--   {
--     noremap = true,
--     silent = true,
--     desc = "Go to first tab"
--   }
-- })
-- PatVimKeyMapSet({
--   "n",
--   "tk",
--   "<cmd>tabnext<CR>",
--   {
--     noremap = true,
--     silent = true,
--     desc = "Go to next tab"
--   }
-- })
-- PatVimKeyMapSet({
--   "n",
--   "tj",
--   "<cmd>tabprev<CR>",
--   {
--     noremap = true,
--     silent = true,
--     desc = "Go to previous tab"
--   }
-- })
-- PatVimKeyMapSet({
--   "n",
--   "tl",
--   "<cmd>tablast<CR>",
--   {
--     noremap = true,
--     silent = true,
--     desc = "Go to last tab"
--   }
-- })
PatVimKeyMapSet({
    "n",
    "<leader>tn",
    "<cmd>tabnew<CR>",
    {
        noremap = true,
        silent = true,
        desc = "Open new tab",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>td",
    "<cmd>tabclose<CR>",
    {
        noremap = true,
        silent = true,
        desc = "Close current tab",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>t<right>",
    "<cmd>tabnext<CR>",
    {
        noremap = true,
        silent = true,
        desc = "Go to next tab",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>t<left>",
    "<cmd>tabprev<CR>",
    {
        noremap = true,
        silent = true,
        desc = "Go to previous tab",
    },
})
-- PatVimKeyMapSet({
--     "n",
--     "t<right>",
--     "<cmd>tabnext<CR>",
--     {
--         noremap = true,
--         silent = true,
--         desc = "Go to next tab",
--     },
-- })
-- PatVimKeyMapSet({
--     "n",
--     "t<left>",
--     "<cmd>tabprev<CR>",
--     {
--         noremap = true,
--         silent = true,
--         desc = "Go to previous tab",
--     },
-- })
--#endregion
--#region Buffer Navigation (<LEADER> + B + [H/J/K/L] / N)
PatVimKeyMapSet({
    "n",
    "<leader>bh",
    "<cmd>bfirst<CR>",
    {
        noremap = true,
        silent = true,
        desc = "Go to first buffer",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>bk",
    "<cmd>bnext<CR>",
    {
        noremap = true,
        silent = true,
        desc = "Go to next buffer",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>bj",
    "<cmd>bprev<CR>",
    {
        noremap = true,
        silent = true,
        desc = "Go to previous buffer",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>bl",
    "<cmd>blast<CR>",
    {
        noremap = true,
        silent = true,
        desc = "Go to last buffer",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>bn",
    "<cmd>new<CR>",
    {
        noremap = true,
        silent = true,
        desc = "Open new buffer",
    },
})
-- PatVimKeyMapSet({
--   "n",
--   "<leader>bd",
--   "<cmd>bdelete<CR>",
--   {
--     noremap = true,
--     silent = true,
--     desc = "Close current buffer"
--   }
-- })
PatVimKeyMapSet({
    "n",
    "<leader>bd",
    "<cmd>lua MiniBufremove.delete()<CR>",
    {
        noremap = true,
        silent = true,
        desc = "Close current buffer",
    },
})
-- PatVimKeyMapSet({
--   "n",
--   "<leader>b<right>",
--   "<cmd>bnext<CR>",
--   {
--     noremap = true,
--     silent = true,
--     desc = "Go to next buffer"
--   }
-- })
-- PatVimKeyMapSet({
--   "n",
--   "<leader>b<left>",
--   "<cmd>bprev<CR>",
--   {
--     noremap = true,
--     silent = true,
--     desc = "Go to previous buffer"
--   }
-- })
-- PatVimKeyMapSet({
--     "n",
--     "b<right>",
--     "<cmd>bnext<CR>",
--     {
--         noremap = true,
--         silent = true,
--         desc = "Go to next buffer",
--     },
-- })
-- PatVimKeyMapSet({
--     "n",
--     "b<left>",
--     "<cmd>bprev<CR>",
--     {
--         noremap = true,
--         silent = true,
--         desc = "Go to previous buffer",
--     },
-- })
PatVimKeyMapSet({
    "n",
    "<leader>bf",
    "<cmd>Telescope buffers<CR>",
    {
        noremap = true,
        silent = true,
        desc = "Open list of buffers in Telescope",
    },
})
--#endregion
--#region Automatically center cursor when going half page up down
PatVimKeyMapSet({
    "n",
    "<C-i>",
    "<C-d>zz",
    {
        noremap = true,
        silent = true,
        desc = "Go down half page and center",
    },
})
PatVimKeyMapSet({
    "n",
    "<C-u>",
    "<C-u>zz",
    {
        noremap = true,
        silent = true,
        desc = "Go up half page and center",
    },
})
--#endregion
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
PatVimKeyMapSet({
    "x",
    "gP",
    [["_dP]],
    { desc = "Replace selected text with paste" },
})
-- PatVimKeyMapSet({
--   'n',
--   'k',
--   "v:count == 0 ? 'gk' : 'k'",
--   { expr = true, silent = true }
-- })
-- PatVimKeyMapSet({
--   'n',
--   'j',
--   "v:count == 0 ? 'gj' : 'j'",
--   { expr = true, silent = true }
-- })
-- PatVimKeyMapSet({
--   'n',
--   '<Up>',
--   "v:count == 0 ? 'gk' : 'k'",
--   { expr = true, silent = true }
-- })
-- PatVimKeyMapSet({
--   'n',
--   '<Down>',
--   "v:count == 0 ? 'gj' : 'j'",
--   { expr = true, silent = true }
-- })
-- PatVimKeyMapSet({
--   'n',
--   'k',
--   "&scrolloff == 999 ? (v:count == 0 ? 'gkzz' : 'kzz') : (v:count == 0 ? 'gk' : 'k')",
--   { expr = true, silent = true }
-- })
-- PatVimKeyMapSet({
--   'n',
--   'j',
--   "&scrolloff == 999 ? (v:count == 0 ? 'gjzz' : 'jzz') : (v:count == 0 ? 'gj' : 'j')",
--   { expr = true, silent = true }
-- })
-- PatVimKeyMapSet({
--   'n',
--   '<Up>',
--   "&scrolloff == 999 ? (v:count == 0 ? 'gkzz' : 'kzz') : (v:count == 0 ? 'gk' : 'k')",
--   { expr = true, silent = true }
-- })
-- PatVimKeyMapSet({
--   'n',
--   '<Down>',
--   "&scrolloff == 999 ? (v:count == 0 ? 'gjzz' : 'jzz') : (v:count == 0 ? 'gj' : 'j')",
--   { expr = true, silent = true }
-- })
PatVimKeyMapSet({
    "n",
    "k",
    "g:scrolloff == v:true ? (v:count == 0 ? 'gkzz' : 'kzz') : (v:count == 0 ? 'gk' : 'k')",
    { expr = true, silent = true },
})
PatVimKeyMapSet({
    "n",
    "j",
    "g:scrolloff == v:true ? (v:count == 0 ? 'gjzz' : 'jzz') : (v:count == 0 ? 'gj' : 'j')",
    { expr = true, silent = true },
})
PatVimKeyMapSet({
    "n",
    "<Up>",
    "g:scrolloff == v:true ? (v:count == 0 ? 'gkzz' : 'kzz') : (v:count == 0 ? 'gk' : 'k')",
    { expr = true, silent = true },
})
PatVimKeyMapSet({
    "n",
    "<Down>",
    "g:scrolloff == v:true ? (v:count == 0 ? 'gjzz' : 'jzz') : (v:count == 0 ? 'gj' : 'j')",
    { expr = true, silent = true },
})
