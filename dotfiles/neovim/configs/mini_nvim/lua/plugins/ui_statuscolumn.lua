return {
    {
        "luukvbaal/statuscol.nvim",
        priority = vim.g.patconfig_highest_base_priority - 241,
        -- branch = "0.10",
        config = function()
            vim.cmd("set norelativenumber")
            local builtin = require("statuscol.builtin")
            --#region Additional Click Function
            -- Remake of get_click_args from inside of statuscol
            -- https://github.com/luukvbaal/statuscol.nvim/blob/826aed35cf41f251010b3cf8e9825e57d115b289/lua/statuscol.lua#L106
            local function get_click_args(minwid, clicks, button, mods)
                local args = {
                    minwid = minwid,
                    clicks = clicks,
                    button = button,
                    mods = mods,
                    mousepos = vim.fn.getmousepos(),
                }
                -- Avoid handling cmdline click, may be removed in 0.9.1: https://github.com/neovim/neovim/pull/23163
                if args.mousepos.winid == 0 then
                    return
                end
                vim.api.nvim_set_current_win(args.mousepos.winid)
                vim.api.nvim_win_set_cursor(0, { args.mousepos.line, 0 })
                return args
            end
            -- Wrapper function arround toggle breakpoint to make it work as a click function
            function _G.ScTb(minwid, clicks, button, mods)
                local args = get_click_args(minwid, clicks, button, mods)
                require("statuscol.builtin").toggle_breakpoint(args)
            end
            --#endregion
            require("statuscol").setup({
                relculright = true,
                ft_ignore = {
                    "SidebarNvim",
                    "NvimTree",
                    "Trouble",
                    "aerial",
                    "starter",
                    "ministarter",
                },
                segments = {
                    -- Catch all signs
                    {
                        sign = {
                            name = {
                                ".*",
                            },
                            maxwidth = 2,
                            colwidth = 2,
                            auto = true,
                            wrap = true,
                            fillchar = " ",
                        },
                        click = "v:lua.ScSa",
                    },
                    -- Dap
                    {
                        sign = {
                            name = {
                                "Dap",
                            },
                            colwidth = 1,
                            fillchar = "",
                            maxwidth = 1,
                        },
                        click = "v:lua.ScTb",
                        condition = {
                            function(args)
                                local bufft = vim.api.nvim_get_option_value("filetype", { buf = args.buf })
                                return not (bufft == "NvimTree" or bufft == "Trouble" or bufft == "SidebarNvim" or bufft == "ministarter")
                            end,
                        },
                    },
                    -- Todo Comments Signs
                    {
                        sign = {
                            name = {
                                "todo-sign",
                            },
                            colwidth = 2,
                            auto = true,
                            fillchar = " ",
                        },
                        condition = {
                            function(args)
                                local bufft = vim.api.nvim_get_option_value("filetype", { buf = args.buf })
                                return not (bufft == "NvimTree" or bufft == "Trouble" or bufft == "SidebarNvim" or bufft == "ministarter")
                            end,
                        },
                    },
                    -- Diagnostic column
                    {
                        sign = {
                            name = {
                                "Diagnostic",
                            },
                            maxwidth = 2,
                            colwidth = 1,
                            fillchar = " ",
                        },
                        click = "v:lua.ScSa",
                    },
                    -- Fold column
                    {
                        text = {
                            -- builtin.foldfunc,
                            function(args)
                                args.fold = args.fold or {}
                                -- Change fold characters to better ones (instead of +- go for arrows)
                                args.fold.close = ""
                                args.fold.open = ""
                                return builtin.foldfunc(args)
                            end,
                        },
                        click = "v:lua.ScFa",
                        hl = "FoldColumn",
                    },
                    -- Default numbers column
                    -- {
                    --   text = {
                    --     builtin.lnumfunc,
                    --   },
                    --   click = "v:lua.ScLa",
                    -- },
                    -- My numbers column (absolute relative)
                    {
                        text = {
                            "%l %{v:relnum} ",
                        },
                        click = "v:lua.ScLa",
                        condition = {
                            function(args)
                                local bufft = vim.api.nvim_get_option_value("filetype", { buf = args.buf })

                                return not (bufft == "NvimTree" or bufft == "Trouble" or bufft == "SidebarNvim" or bufft == "ministarter")
                            end,
                        },
                    },
                },
            })
        end,
    },
}
