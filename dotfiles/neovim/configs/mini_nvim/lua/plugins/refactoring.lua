return {
    {
        "ThePrimeagen/refactoring.nvim",
        priority = vim.g.patconfig_highest_base_priority - 310,
        event = {
            "BufReadPre",
            "BufNewFile",
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        keys = {
            {
                "<leader>rS",
                function()
                    require("telescope").extensions.refactoring.refactors()
                end,
                mode = "v",
                desc = "Refactor",
            },
            {
                "<leader>rS",
                function()
                    require("telescope").extensions.refactoring.refactors()
                end,
                mode = "n",
                desc = "Refactor",
            },
            {
                "<leader>ri",
                function()
                    require("refactoring").refactor("Inline Variable")
                end,
                mode = { "n", "v" },
                desc = "Inline Variable",
            },
            {
                "<leader>rb",
                function()
                    require("refactoring").refactor("Extract Block")
                end,
                desc = "Extract Block",
            },
            {
                "<leader>rf",
                function()
                    require("refactoring").refactor("Extract Block To File")
                end,
                desc = "Extract Block To File",
            },
            {
                "<leader>rP",
                function()
                    require("refactoring").debug.printf({ below = false })
                end,
                desc = "Debug Print",
            },
            {
                "<leader>rp",
                function()
                    require("refactoring").debug.print_var({ normal = true })
                end,
                desc = "Debug Print Variable",
            },
            {
                "<leader>rc",
                function()
                    require("refactoring").debug.cleanup({})
                end,
                desc = "Debug Cleanup",
            },
            {
                "<leader>rf",
                function()
                    require("refactoring").refactor("Extract Function")
                end,
                mode = "v",
                desc = "Extract Function",
            },
            {
                "<leader>rF",
                function()
                    require("refactoring").refactor("Extract Function To File")
                end,
                mode = "v",
                desc = "Extract Function To File",
            },
            {
                "<leader>rx",
                function()
                    require("refactoring").refactor("Extract Variable")
                end,
                mode = "v",
                desc = "Extract Variable",
            },
            {
                "<leader>rp",
                function()
                    require("refactoring").debug.print_var()
                end,
                mode = "v",
                desc = "Debug Print Variable",
            },
        },
        opts = {
            -- This is for prompting for types if it auto determined types are bad
            prompt_func_return_type = {
                go = false,
                java = false,
                cpp = false,
                c = false,
                h = false,
                hpp = false,
                cxx = false,
            },
            prompt_func_param_type = {
                go = false,
                java = false,
                cpp = false,
                c = false,
                h = false,
                hpp = false,
                cxx = false,
            },
            -- Custom print statements
            -- printf_statements = {},
            -- print_var_statements = {},
            -- extract_var_statements = {},
            -- formatting = {},
            -- code_generation = {},
            -- visibility = {},
            -- shows a message with information about the refactor on success
            -- i.e. [Refactor] Inlined 3 variable occurrences
            show_success_message = true,
        },
        config = true,
    },
}
