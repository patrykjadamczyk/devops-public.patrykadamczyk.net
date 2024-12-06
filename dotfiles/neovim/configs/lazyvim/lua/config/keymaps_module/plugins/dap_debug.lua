--#region Breakpoints
vim.keymap.set("n", "<leader>tb", "<cmd>lua require('dap').toggle_breakpoint()<cr>", {
    noremap = true,
    silent = true,
    desc = "Toggle breakpoint for current line",
})
vim.keymap.set("n", "<leader>df", "<cmd>lua require('telescope').extensions.dap.list_breakpoints({})<cr>", {
    noremap = true,
    silent = true,
    desc = "Search through list of breakpoints using Telescope",
})
vim.keymap.set("n", "<leader>dr", "<cmd>lua require('dap').repl.open()<cr>", {
    noremap = true,
    silent = true,
    desc = "Open Debugger REPL",
})
vim.keymap.set("n", "<leader>du", "<cmd>lua require('dapui').toggle()<cr>", {
    noremap = true,
    silent = true,
    desc = "Open Debugger UI",
})
--#endregion
