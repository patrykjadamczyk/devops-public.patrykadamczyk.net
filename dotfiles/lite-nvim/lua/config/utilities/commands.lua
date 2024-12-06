-- Go Format
vim.api.nvim_create_user_command("PatGoFormat", ":!go fmt %", {})
-- Discord Load
vim.api.nvim_create_user_command("PatDiscordStub", ":echo 'Loading Discord RPC'", {})
vim.api.nvim_create_user_command("PatDiscord", ":Lazy load presence.nvim", {})
