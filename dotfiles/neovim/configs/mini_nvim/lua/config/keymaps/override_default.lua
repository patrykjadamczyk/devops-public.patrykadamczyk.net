--#region Overriding defaults of VIM
-- Do not yank with x
vim.keymap.set("n", "x", '"_x')
-- Remove highlight search on escape
PatVimKeyMapSet({
    { "i", "n" },
    "<esc>",
    "<cmd>noh<cr><esc>",
    {
        desc = "Escape and clear hlsearch",
    },
})
--#endregion
vim.cmd([[
" Restore default <CR> functionality
" Change <CR> back to new line in insert mode (cmp workaround)
imap <CR> <CR>
]])
