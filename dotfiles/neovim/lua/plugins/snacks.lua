return {
    {
        "folke/snacks.nvim",
        priority = vim.g.patconfig_highest_base_priority,
        lazy = false,
        opts = {
            notifier = {
                enabled = true,
                timeout = 3000,
            },
            styles = {
                notification = {
                    wo = {
                        wrap = true,
                    },
                },
            },
        },
        keys = {
            {
                "<leader>fn",
                function()
                    Snacks.notifier.show_history()
                end,
                desc = "Notification History"
            },
            {
                "<leader>dn",
                function()
                    Snacks.notifier.hide()
                end,
                desc = "Dismiss All Notifications"
            },
            {
                "<leader>tA",
                function()
                    Snacks.terminal.colorize()
                end,
                desc = "Change ANSI Seqs into Colors"
            },
            {
                "<leader>Lr",
                function()
                    Snacks.scratch.open({
                        name = "LUA",
                        ft = function()
                            return "lua"
                        end,
                        -- root = vim.fn.stdpath("data") .. "/scratch",
                        autowrite = true, -- automatically write when the buffer is hidden
                        -- unique key for the scratch file is based on:
                        -- * name
                        -- * ft
                        -- * vim.v.count1 (useful for keymaps)
                        -- * cwd (optional)
                        -- * branch (optional)
                        filekey = {
                            cwd = true, -- use current working directory
                            branch = true, -- use current branch name
                            count = true, -- use vim.v.count1
                        },
                        win = { style = "scratch" },
                        ---@type table<string, snacks.win.Config>
                        win_by_ft = {
                            lua = {
                                keys = {
                                    ["source"] = {
                                        "<cr>",
                                        function(self)
                                            local name = "scratch." .. vim.fn.fnamemodify(vim.api.nvim_buf_get_name(self.buf), ":e")
                                            Snacks.debug.run({ buf = self.buf, name = name })
                                        end,
                                        desc = "Source buffer",
                                        mode = { "n", "x" },
                                    },
                                },
                            },
                        },
                    })
                end,
                desc = "LUA REPL"
            },
        },
        init = function()
            vim.api.nvim_create_autocmd("User", {
                pattern = "VeryLazy",
                callback = function()
                    -- Snacks-rename
                    vim.api.nvim_create_autocmd("User", {
                        pattern = "MiniFilesActionRename",
                        callback = function(event)
                            Snacks.rename.on_rename_file(event.data.from, event.data.to)
                        end,
                    })
                    -- Setup some globals for debugging (lazy-loaded)
                    _G.dd = function(...)
                        Snacks.debug.inspect(...)
                    end
                    _G.bt = function()
                        Snacks.debug.backtrace()
                    end
                    vim.print = _G.dd -- Override print to use snacks for `:=` command

                    -- Create some toggle mappings
                    -- Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
                    -- Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
                    -- Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
                    -- Snacks.toggle.diagnostics():map("<leader>ud")
                    -- Snacks.toggle.line_number():map("<leader>ul")
                    -- Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
                    -- Snacks.toggle.treesitter():map("<leader>uT")
                    -- Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
                    -- Snacks.toggle.inlay_hints():map("<leader>uh")
                end,
            })
        end,
    }
}
