--#region Dismiss all elements of noice (notifications included)
PatVimKeyMapSet({
    "n",
    "<leader>nn",
    "<cmd>NoiceDismiss<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Dismiss all elements of noice and notifications",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>dn",
    "<cmd>NoiceDismiss<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Dismiss all elements of noice and notifications",
    },
})
--#endregion
--#region Noice Signature Help Scroll And CMP signature scroll
PatVimKeyMapSet({
    { "n", "i", "s" },
    "<A-Down>",
    function()
        if not require("noice.lsp").scroll(4) then
            require("cmp").mapping.scroll_docs(4)(function()
                return "<A-Down>"
            end)
            -- if not require("cmp").mapping.scroll_docs(4) then
            --   return "<A-Down>"
            -- end
        end
    end,
    { silent = true, expr = true, desc = "Scroll down documentation" },
})

PatVimKeyMapSet({
    { "n", "i", "s" },
    "<A-Up>",
    function()
        if not require("noice.lsp").scroll(-4) then
            require("cmp").mapping.scroll_docs(-4)(function()
                return "<A-Up>"
            end)
            -- if not require("cmp").mapping.scroll_docs(-4) then
            --   return "<A-Up>"
            -- end
        end
    end,
    { silent = true, expr = true, desc = "Scroll up documentation" },
})
--#endregion
