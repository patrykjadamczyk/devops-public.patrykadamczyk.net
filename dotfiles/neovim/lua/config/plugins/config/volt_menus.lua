local M = {}

M.lsp_menu = {
    {
        name = "Go to Definition",
        cmd = vim.lsp.buf.definition,
        rtxt = "gd",
    },
    {
        name = "Peek Definition",
        cmd = "Lspsaga peek_definition",
        rtxt = "<leader>pd",
    },
    {
        name = "Go to Declaration",
        cmd = vim.lsp.buf.declaration,
        rtxt = "gD",
    },
    {
        name = "Go to Implementation",
        cmd = vim.lsp.buf.implementation,
        rtxt = "gi",
    },
    { name = "separator" },
    {
        name = "Show signature help",
        cmd = vim.lsp.buf.signature_help,
        rtxt = "gs",
    },
    {
        name = "Show References",
        cmd = "Telescope lsp_references",
        rtxt = "grr",
    },
    {
        name = "Show LSP finder",
        cmd = "Lspsaga finder tyd+ref+imp+def",
        rtxt = "<leader>ls",
    },
    { name = "separator" },
    {
        name = "Format Buffer",
        cmd = function()
            local ok, conform = pcall(require, "conform")

            if ok then
                conform.format({ lsp_fallback = true })
            else
                vim.lsp.buf.format()
            end
        end,
    },
    {
        name = "Code Actions",
        cmd = "Lspsaga code_action",
        rtxt = "gra",
    },
}

M.debug_menu = {
    {
        name = "Toggle breakpoint for current line",
        cmd = require("dap").toggle_breakpoint,
        rtxt = "<leader>tb",
    },
    {
        name = "Search through list of breakpoints using Telescope",
        cmd = "lua require('telescope').extensions.dap.list_breakpoints({})",
        rtxt = "<leader>df",
    },
    {
        name = "Open Debugger REPL",
        cmd = require("dap").repl.toggle,
        rtxt = "<leader>dr",
    },
    {
        name = "Open Debugger UI",
        cmd = require("dapui").toggle,
        rtxt = "<leader>du",
    },
    {
        name = "Breakpoint Condition",
        cmd = function()
            require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end,
        rtxt = "<leader>dB",
    },
}

M.menus_menu = {
    {
        name = "Lazy",
        cmd = "Lazy",
        rtxt = "<leader>LL",
    },
    {
        name = "Mason",
        cmd = "Mason",
        rtxt = "<leader>LM",
    },
}

M.options_menu = {
    {
        name = "Toggle autoformat (buffer)",
        cmd = function()
            vim.b.enable_autoformat = not vim.b.enable_autoformat
            if vim.b.enable_autoformat then
                print("Enabled autoformat")
            else
                print("Disabled autoformat")
            end
        end,
        rtxt = "<leader>ua",
    },
    {
        name = "Toggle autoformat (global)",
        cmd = function()
            vim.g.enable_autoformat = not vim.g.enable_autoformat
            if vim.g.enable_autoformat then
                print("Enabled autoformat")
            else
                print("Disabled autoformat")
            end
        end,
        rtxt = "<leader>uA",
    },
}

M.inspect_menu = {
    {
        name = "Treesitter Inspect Pos",
        cmd = vim.show_pos,
        rtxt = "<leader>oT",
    },
    {
        name = "Treesitter Inspect Tree",
        cmd = "InspectTree",
        rtxt = "<leader>oT",
    },
}

M.main_menu = {
    {
        name = "Copy Content",
        cmd = "%y+",
    },
    {
        name = "Delete Content",
        cmd = "%d",
    },
    { name = "separator" },
    {
        name = "  Lsp Actions",
        hl = "Exblue",
        items = M.lsp_menu,
    },
    {
        name = "  Debug Actions",
        hl = "Exblue",
        items = M.debug_menu,
    },
    {
        name = "  Menus",
        hl = "Exblue",
        items = M.menus_menu,
    },
    {
        name = "  Options",
        hl = "Exblue",
        items = M.options_menu,
    },
    {
        name = "  Inspect",
        hl = "Exblue",
        items = M.inspect_menu,
    },
    { name = "separator" },
    {
        name = "  Color Picker",
        cmd = function()
            require("minty.huefy").open()
        end,
    },
    {
        name = "  Shades Picker",
        cmd = function()
            require("minty.shades").open()
        end,
    },
}

return M
