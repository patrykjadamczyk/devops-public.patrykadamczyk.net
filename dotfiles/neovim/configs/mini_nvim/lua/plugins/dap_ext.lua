return {
    -- ===== Debugger =====
    -- A UI for nvim-dap which provides a good out of the box configuration.
    -- - Commands:
    -- - - :lua require("dapui").open()
    -- - - :lua require("dapui").close()
    -- - - :lua require("dapui").toggle()
    -- - - :lua require("dapui").eval(<expression>)
    {
        "rcarriga/nvim-dap-ui",
        priority = vim.g.patconfig_highest_base_priority - 200,
        dependencies = {
            "nvim-neotest/nvim-nio",
        },
    },
    -- virtual text for the debugger
    {
        "theHamsta/nvim-dap-virtual-text",
        priority = vim.g.patconfig_highest_base_priority - 200,
        opts = {},
    },
    -- mason-nvim-dap.nvim closes some gaps that exist between mason.nvim and nvim-dap
    {
        "jay-babu/mason-nvim-dap.nvim",
        priority = vim.g.patconfig_highest_base_priority - 200,
    },
}
