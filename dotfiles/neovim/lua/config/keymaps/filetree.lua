vim.cmd([[silent! unmap <C-n>]])
PatVimKeyMapSet({
    "n",
    "<C-n>",
    function()
        if not MiniFiles.close() then
            MiniFiles.open()
        end
    end,
    { desc = "Toggle File Tree" },
})
