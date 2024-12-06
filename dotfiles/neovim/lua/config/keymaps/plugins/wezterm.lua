--#region Wezterm
-- Switch tab by index using vim.v.count
PatVimKeyMapSet({
    "n",
    "<leader>wt",
    function()
        local count = vim.v.count or 1
        if count <= 0 then
            count = 1
        end
        require("wezterm").switch_tab.id(count)
    end,
    {
        silent = true,
        desc = "Switch to <count> wezterm tab",
    },
})
--#endregion
