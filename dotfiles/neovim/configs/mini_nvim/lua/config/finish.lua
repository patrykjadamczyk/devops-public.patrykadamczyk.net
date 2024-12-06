-- ============= Notify about loading config =============
vim.schedule(function()
    vim.notify(
        "Loading configuration completed",
        vim.log.levels.INFO,
        { title = "NVim Configuration", timeout = 2000 }
    )
end)
-- Vim Finish
vim.cmd("silent! helptags ALL")
