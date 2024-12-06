--#region Neovim Snippets
PatVimKeyMapSet({
    { "i", "s" },
    "<Tab>",
    function()
        if vim.snippet.active({ direction = 1 }) then
            vim.schedule(function()
                vim.snippet.jump(1)
            end)
            return
        end
        return "<Tab>"
    end,
    {
        expr = true,
        silent = true,
    },
})
PatVimKeyMapSet({
    { "i", "s" },
    "<S-Tab>",
    function()
        if vim.snippet.active({ direction = -1 }) then
            vim.schedule(function()
                vim.snippet.jump(-1)
            end)
            return
        end
        return "<S-Tab>"
    end,
    {
        expr = true,
        silent = true,
    },
})
--#endregion
