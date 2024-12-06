-- Go Format
vim.api.nvim_create_user_command("PatGoFormat", ":!go fmt %", {})
-- Discord Load
vim.api.nvim_create_user_command("PatDiscordStub", ":echo 'Loading Discord RPC'", {})
vim.api.nvim_create_user_command("PatDiscord", ":Lazy load presence.nvim", {})
-- Hex Edit
vim.api.nvim_create_user_command("PatHexEditor", ":%!xxd", {})
vim.api.nvim_create_user_command("PatHexEditorWrite", ":%!xxd -r", {})
-- Neorg
vim.api.nvim_create_user_command("PatFixNeorg1", ":Lazy build luarocks.nvim", {})
vim.api.nvim_create_user_command("PatFixNeorg2", ":Lazy build neorg", {})
-- Session
vim.api.nvim_create_user_command("PatSessionWrite", "lua MiniSessions.write('Session.vim', { force = false })", {})
vim.api.nvim_create_user_command("PatSessionForceWrite", "lua MiniSessions.write('Session.vim', { force = true })", {})
vim.api.nvim_create_user_command("PatSaveAndExit", function()
    vim.cmd("lua MiniSessions.write('Session.vim', { force = true })")
    vim.cmd("wqa")
end, {})
vim.api.nvim_create_user_command("FormatDisable", function(args)
    if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.enable_autoformat = false
    else
        vim.g.enable_autoformat = false
    end
end, {
    desc = "Disable autoformat-on-save",
    bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function(args)
    if args.bang then
        -- FormatEnable! will enable formatting just for this buffer
        vim.b.enable_autoformat = true
    else
        vim.b.enable_autoformat = true
        vim.g.enable_autoformat = true
    end
end, {
    desc = "Re-enable autoformat-on-save",
    bang = true,
})
