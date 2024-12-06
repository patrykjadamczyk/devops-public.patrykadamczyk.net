-- Install all updates
-- vim.schedule(function()
--     require("lazy").show()
--     -- require("lazy").sync({
--     --   show = false,
--     -- })
-- end)
-- ============= Notify about loading config =============
vim.schedule(function()
    vim.notify("Loading configuration", vim.log.levels.INFO, {
        title = "NVim Configuration",
        timeout = 2000,
    })
end)
-- vim.defer_fn(function()
--     if vim.fn.isdirectory(vim.fn.bufname(1)) == 1 then
--         vim.cmd("lua MiniBufremove.delete(1)")
--     end
--     vim.cmd("lua MiniSessions.write('Session.vim', { force = false })")
-- end, 500)
-- Vim Finish
vim.cmd("silent! helptags ALL")

-- ============= Notify about problems with current environment =============
vim.schedule(function()
    local error_options = {
        title = "NVim Configuration - Required Commands",
        timeout = 2000,
    }
    -- Check if zig is installed
    if vim.fn.executable("zig") ~= 1 then
        local zig_install = "brew install zig"
        if vim.g.is_win then
            zig_install = "scoop install zig"
        end
        vim.notify(
            "Zig is not installed\n" .. "Try to install it with:\n" .. zig_install,
            vim.log.levels.ERROR,
            error_options
        )
    end
    -- Check if ripgrep is installed
    if vim.fn.executable("rg") ~= 1 then
        local rg_install = "brew install ripgrep"
        if vim.g.is_win then
            rg_install = "scoop install ripgrep"
        end
        vim.notify(
            "Ripgrep is not installed\n" .. "Try to install it with:\n" .. rg_install,
            vim.log.levels.ERROR,
            error_options
        )
    end
end)
