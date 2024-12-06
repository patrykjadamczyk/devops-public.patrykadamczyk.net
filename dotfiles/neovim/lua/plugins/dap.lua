return {
    -- ===== Debugger =====
    -- nvim-dap is a Debug Adapter Protocol client implementation for Neovim
    -- - Commands:
    -- - - :lua require'dap'.toggle_breakpoint()
    -- - - :lua require'dap'.continue()
    -- - - :lua require'dap'.step_over()
    -- - - :lua require'dap'.step_into()
    -- - - :lua require'dap'.repl.open()
    {
        "mfussenegger/nvim-dap",
        priority = vim.g.patconfig_highest_base_priority - 190,
    },
}
