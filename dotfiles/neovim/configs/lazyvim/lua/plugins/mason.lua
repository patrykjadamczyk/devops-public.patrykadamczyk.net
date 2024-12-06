return {
    -- Mason lockfile
    -- Adds :MasonLock and :MasonRestore
    {
        "patrykjadamczyk/mason-lock.nvim",
        init = function()
            require("mason-lock").setup({
                lockfile_path = vim.fn.stdpath("config") .. "/mason-lock.json",
            })
        end,
    },
}
