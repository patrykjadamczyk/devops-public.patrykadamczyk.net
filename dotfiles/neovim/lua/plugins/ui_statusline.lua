return {
    -- Lualine
    {
        "nvim-lualine/lualine.nvim",
        -- event = "VeryLazy",
        priority = vim.g.patconfig_highest_base_priority - 1000,
        dependencies = {
            "folke/noice.nvim",
            "mfussenegger/nvim-dap",
            -- "nvim-tree/nvim-tree.lua",
            "stevearc/aerial.nvim",
            "tpope/vim-fugitive",
            "junegunn/fzf.vim",
            "rcarriga/nvim-dap-ui",
            "akinsho/toggleterm.nvim",
            "folke/trouble.nvim",
            "stevearc/overseer.nvim",
        },
        opts = function()
            -- Function Util.fg from LazyVim
            local function util_fg(name)
                local hl = vim.api.nvim_get_hl(0, { name = name })
                local fg = hl and hl.fg or hl.foreground
                return fg and { fg = string.format("#%06x", fg) }
            end
            -- Disable not needed option
            vim.opt.showmode = false
            -- LuaLine Config
            return {
                options = {
                    -- theme = "auto",
                    theme = "catppuccin",
                    -- theme = "tokyonight",
                    globalstatus = true,
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch" },
                    lualine_c = {
                        {
                            "diagnostics",
                            sources = {
                                "nvim_lsp",
                                "nvim_diagnostic",
                                "nvim_workspace_diagnostic",
                            },
                            symbols = {
                                error = " ",
                                warn = " ",
                                hint = " ",
                                info = " ",
                            },
                        },
                        {
                            "searchcount",
                            maxcount = 999,
                            timeout = 500,
                        },
                        {
                            "filetype",
                            icon_only = true,
                            separator = "",
                            padding = {
                                left = 1,
                                right = 0,
                            },
                        },
                        {
                            "filename",
                            file_status = true,
                            newfile_status = true,
                            path = 1,
                            symbols = {
                                modified = "  ",
                                readonly = "  ",
                                newfile = "  ",
                                unnamed = "  ",
                            },
                        },
                    },
                    lualine_x = {
                        {
                            function()
                                local tmp_parts = {}
                                for k, v in string.gmatch(vim.g.roslyn_nvim_selected_solution, "(%w+)/(%w+)") do
                                    tmp_parts[k] = v
                                end
                                if #tmp_parts == 0 then
                                    for k, v in string.gmatch(vim.g.roslyn_nvim_selected_solution, "(%w+)\\(%w+)") do
                                        tmp_parts[k] = v
                                    end
                                end
                                return tmp_parts[#tmp_parts]
                                -- return vim.g.roslyn_nvim_selected_solution
                            end,
                            cond = function()
                                if (vim.g.patconfig_csharp_server__roslyn ~= 1) then
                                    return false
                                end
                                return vim.g.roslyn_nvim_selected_solution ~= nil
                            end,
                            color = util_fg("Statement"),
                        },
                        {
                            "overseer",
                        },
                        {
                            function()
                                return require("noice").api.status.command.get()
                            end,
                            cond = function()
                                return package.loaded["noice"] and require("noice").api.status.command.has()
                            end,
                            color = util_fg("Statement"),
                        },
                        {
                            function()
                                return require("noice").api.status.mode.get()
                            end,
                            cond = function()
                                return package.loaded["noice"] and require("noice").api.status.mode.has()
                            end,
                            color = util_fg("Constant"),
                        },
                        {
                            function()
                                return "  " .. require("dap").status()
                            end,
                            cond = function()
                                return package.loaded["dap"] and require("dap").status() ~= ""
                            end,
                            color = util_fg("Debug"),
                        },
                        {
                            require("lazy.status").updates,
                            cond = require("lazy.status").has_updates,
                            color = util_fg("Special"),
                        },
                        {
                            "diff",
                            symbols = {
                                added = " ",
                                modified = " ",
                                removed = " ",
                            },
                        },
                    },
                    lualine_y = {
                        {
                            "fileformat",
                            symbols = {
                                unix = "",
                                dos = "",
                                mac = "",
                            },
                        },
                        {
                            function()
                                local total_marks = require("harpoon"):list():length()
                                local current_mark_id = harpoon_current_id_on_list()
                                local current_mark = "-"
                                if current_mark_id ~= nil then
                                    current_mark = tostring(current_mark_id)
                                end
                                return string.format("󱡅 %s/%s", current_mark, total_marks)
                            end,
                            color = util_fg("Special"),
                        },
                        -- {
                        --     -- function()
                        --     --   return "Codeium:" .. vim.fn["codeium#GetStatusString"]()
                        --     -- end,
                        --     function()
                        --         local started = false
                        --         local function status()
                        --             if not package.loaded["cmp"] then
                        --                 return
                        --             end
                        --             for _, s in ipairs(require("cmp").core.sources) do
                        --                 if s.name == "codeium" then
                        --                     if s.source:is_available() then
                        --                         started = true
                        --                     else
                        --                         return started and "error" or nil
                        --                     end
                        --                     if s.status == s.SourceStatus.FETCHING then
                        --                         return "pending"
                        --                     end
                        --                     return "ok"
                        --                 end
                        --             end
                        --         end
                        --         local status_text = status()
                        --         if status_text == "ok" then
                        --             return "Codeium: OK"
                        --         elseif status_text == "pending" then
                        --             return "Codeium: Pending"
                        --         elseif status_text == "error" then
                        --             return "Codeium: Error 1"
                        --         elseif status_text == nil then
                        --             return "Codeium: Error 0"
                        --         elseif not package.loaded["cmp"] then
                        --             return "Codeium: Error 3"
                        --         else
                        --             return "Codeium: Error 2"
                        --         end
                        --     end,
                        --     color = util_fg("Special"),
                        -- },
                        {
                            -- function()
                            --     return "" .. vim.fn["CodeStatsXp"]()
                            -- end,
                            function()
                                return "C::S " .. require("codestats-nvim").get_xp_count()
                            end,
                            color = util_fg("Special"),
                        },
                        {
                            "progress",
                            separator = " ",
                            padding = {
                                left = 1,
                                right = 0,
                            },
                        },
                        {
                            "location",
                            padding = {
                                left = 0,
                                right = 1,
                            },
                        },
                    },
                    lualine_z = {
                        -- function()
                        --   return " " .. os.date("%R")
                        -- end,
                        {
                            "datetime",
                            style = " %R",
                        },
                    },
                },
                extensions = {
                    -- "nvim-tree",
                    "lazy",
                    "aerial",
                    "fugitive",
                    "fzf",
                    "nvim-dap-ui",
                    "quickfix",
                    "toggleterm",
                    "trouble",
                },
            }
        end,
    },
}
