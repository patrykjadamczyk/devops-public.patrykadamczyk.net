return {
  -- Lualine
  {
    "nvim-lualine/lualine.nvim",
    -- event = "VeryLazy",
    priority = vim.g.patconfig_highest_base_priority - 1000,
    dependencies = {
      "folke/noice.nvim",
      "stevearc/aerial.nvim",
      "tpope/vim-fugitive",
      "junegunn/fzf.vim",
      "akinsho/toggleterm.nvim",
      "folke/trouble.nvim",
    },
    opts = function()
      -- Function Util.fg from LazyVim
      local function util_fg(name)
        local hl = vim.api.nvim_get_hl and vim.api.nvim_get_hl(0, { name = name }) or vim.api.nvim_get_hl_by_name(name, true)
        local fg = hl and hl.fg or hl.foreground
        return fg and { fg = string.format("#%06x", fg) }
      end
      -- LuaLine Config
      return {
        options = {
          -- theme = "auto",
          -- theme = "catppuccin",
          theme = "tokyonight",
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
                unix = '',
                dos = '',
                mac = '',
              },
            },
            {
              -- function()
              --   return "Codeium:" .. vim.fn["codeium#GetStatusString"]()
              -- end,
             function ()
                local started = false
                local function status()
                  if not package.loaded["cmp"] then
                    return
                  end
                  for _, s in ipairs(require("cmp").core.sources) do
                    if s.name == "codeium" then
                      if s.source:is_available() then
                        started = true
                      else
                        return started and "error" or nil
                      end
                      if s.status == s.SourceStatus.FETCHING then
                        return "pending"
                      end
                      return "ok"
                    end
                  end
                end
                local status_text = status()
                if status_text == "ok" then
                  return "Codeium: OK"
                elseif status_text == "pending" then
                  return "Codeium: Pending"
                elseif status_text == "error" then
                  return "Codeium: Error 1"
                elseif status_text == nil then
                  return "Codeium: Error 0"
                elseif not package.loaded["cmp"] then
                  return "Codeium: Error 3"
                else
                  return "Codeium: Error 2"
                end
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
          "lazy",
          "aerial",
          "fugitive",
          "fzf",
          "quickfix",
          "toggleterm",
          "trouble",
        },
      }
    end,
  }
}
