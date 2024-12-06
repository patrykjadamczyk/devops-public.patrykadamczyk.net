--#region Breakpoints
PatVimKeyMapSet({
    "n",
    "<leader>tb",
    "<cmd>lua require('dap').toggle_breakpoint()<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Toggle breakpoint for current line",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>df",
    "<cmd>lua require('telescope').extensions.dap.list_breakpoints({})<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Search through list of breakpoints using Telescope",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>dr",
    "<cmd>lua require('dap').repl.toggle()<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Open Debugger REPL",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>du",
    "<cmd>lua require('dapui').toggle()<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Open Debugger UI",
    },
})
--#endregion
--#region DAP and LazyVim
for _, mapping in ipairs({
    {
        "<leader>dB",
        function()
            require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end,
        desc = "Breakpoint Condition",
    },
    {
        "<leader>db",
        function()
            require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
    },
    {
        "<leader>dc",
        function()
            require("dap").continue()
        end,
        desc = "Continue",
    },
    {
        "<leader>dC",
        function()
            require("dap").run_to_cursor()
        end,
        desc = "Run to Cursor",
    },
    {
        "<leader>dg",
        function()
            require("dap").goto_()
        end,
        desc = "Go to Line (No Execute)",
    },
    {
        "<leader>di",
        function()
            require("dap").step_into()
        end,
        desc = "Step Into",
    },
    {
        "<leader>dj",
        function()
            require("dap").down()
        end,
        desc = "Down",
    },
    {
        "<leader>dk",
        function()
            require("dap").up()
        end,
        desc = "Up",
    },
    {
        "<leader>dl",
        function()
            require("dap").run_last()
        end,
        desc = "Run Last",
    },
    {
        "<leader>do",
        function()
            require("dap").step_out()
        end,
        desc = "Step Out",
    },
    {
        "<leader>dO",
        function()
            require("dap").step_over()
        end,
        desc = "Step Over",
    },
    {
        "<leader>dp",
        function()
            require("dap").pause()
        end,
        desc = "Pause",
    },
    {
        "<leader>ds",
        function()
            require("dap").session()
        end,
        desc = "Session",
    },
    {
        "<leader>dt",
        function()
            require("dap").terminate()
        end,
        desc = "Terminate",
    },
    {
        "<leader>dw",
        function()
            require("dap.ui.widgets").hover()
        end,
        desc = "Widgets",
    },
}) do
    PatVimKeyMapSet({
        "n",
        mapping[1],
        mapping[2],
        {
            noremap = true,
            silent = true,
            desc = "Debugger " .. mapping["desc"],
        },
    })
end
--#endregion
