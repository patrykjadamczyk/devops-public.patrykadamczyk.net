PatVimKeyMapSet({
    "n",
    "<leader>ua",
    function()
        vim.b.enable_autoformat = not vim.b.enable_autoformat
        if vim.b.enable_autoformat then
            print("Enabled autoformat")
        else
            print("Disabled autoformat")
        end
    end,
    {
        noremap = true,
        silent = true,
        desc = "Toggle autoformat (buffer)",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>uA",
    function()
        vim.g.enable_autoformat = not vim.g.enable_autoformat
        if vim.g.enable_autoformat then
            print("Enabled autoformat")
        else
            print("Disabled autoformat")
        end
    end,
    {
        noremap = true,
        silent = true,
        desc = "Toggle autoformat (global)",
    },
})
