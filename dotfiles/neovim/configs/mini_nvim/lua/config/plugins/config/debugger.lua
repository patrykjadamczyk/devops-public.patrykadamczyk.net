-- " ====================== Debugger =======================
require("mason-nvim-dap").setup({
    automatic_setup = true,
    ensure_installed = {
        "php",
        "python",
        "delve",
        "node2",
        "chrome",
        "firefox",
        "coreclr",
        "js",
        "bash",
    },
    handlers = {
        function(config)
            -- all sources with no handler get passed here
            -- Keep original functionality
            require("mason-nvim-dap").default_setup(config)
        end,
        php = function(config)
            -- Add configuration for PHP because default is only for Xdebug 2- because of change in port
            config.configurations = {
                {
                    type = "php",
                    request = "launch",
                    name = "PHP: Listen for Xdebug 2",
                    port = 9000,
                },
                {
                    type = "php",
                    request = "launch",
                    name = "PHP: Listen for Xdebug 3",
                    port = 9003,
                },
            }
            -- Add Default Configs
            require("mason-nvim-dap").default_setup(config)
        end,
    },
})
require("dapui").setup()
-- No setup call is intentional
require("dap")
local sign = PatMakeTableFunction(vim.fn.sign_define)

sign({
    "DapBreakpoint",
    { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" },
})
sign({
    "DapBreakpointCondition",
    { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" },
})
sign({
    "DapLogPoint",
    { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" },
})

-- setup dap config by VsCode launch.json file
-- require("dap.ext.vscode").load_launchjs()
local dap = require("dap")
local dapui = require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open({})
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close({})
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close({})
end
