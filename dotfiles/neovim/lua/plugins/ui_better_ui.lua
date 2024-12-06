return {
    -- Neovim plugin to improve the default vim.ui interfaces
    {
        "stevearc/dressing.nvim",
        priority = vim.g.patconfig_highest_base_priority - 260,
    },
    -- Better UI
    {
        "MunifTanjim/nui.nvim",
        priority = vim.g.patconfig_highest_base_priority - 260,
    },
    -- Better UI for stuff
    {
        "folke/noice.nvim",
        priority = vim.g.patconfig_highest_base_priority - 260,
        config = function()
            require("noice").setup({
                cmdline = {
                    enabled = true,
                    view = "cmdline_popup",
                },
                popupmenu = {
                    enabled = true,
                    backend = "cmp", --backend for cmdline completions
                },
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                    -- message = {
                    --   -- Messages shown by lsp servers
                    --   enabled = true,
                    --   view = "hover",
                    --   opts = {},
                    -- },
                },
                routes = {
                    {
                        filter = {
                            event = "msg_show",
                            find = "fsautocomplete: -32603 .*",
                        },
                        opts = { skip = true },
                    },
                    {
                        filter = {
                            event = "msg_show",
                            find = [[Error executing vim.schedule lua callback: UnhandledPromiseRejection with the reason:
RPC[Error] code_name = InternalError, message =.*]],
                        },
                        opts = { skip = true },
                    },
                },
            })
            require("telescope").load_extension("noice")
        end,
    },
}
