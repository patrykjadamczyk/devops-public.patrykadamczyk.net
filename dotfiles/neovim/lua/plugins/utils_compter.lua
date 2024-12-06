return {
    -- Fully better C-A C-X
    {
        -- dir = "~/go/src/github.com/patrykjadamczyk/compter.nvim",
        -- "RutaTang/compter.nvim",
        "patrykjadamczyk/compter.nvim",
        config = true,
        priority = vim.g.patconfig_highest_base_priority - 530,
        opts = {
            templates = {
                -- Number
                -- {
                --   pattern = [[-\?\d\+]],
                --   priority = 0,
                --   increase = function(content)
                --     content = tonumber(content)
                --     return content + 1, true
                --   end,
                --   decrease = function(content)
                --     content = tonumber(content)
                --     return content - 1, true
                --   end,
                -- },
                -- for lowercase alphabet
                {
                    pattern = [[\l]],
                    priority = 0,
                    increase = function(content)
                        local ansiCode = string.byte(content) + 1
                        if ansiCode > string.byte("z") then
                            ansiCode = string.byte("a")
                        end
                        local char = string.char(ansiCode)
                        return char, true
                    end,
                    decrease = function(content)
                        local ansiCode = string.byte(content) - 1
                        if ansiCode < string.byte("a") then
                            ansiCode = string.byte("z")
                        end
                        local char = string.char(ansiCode)
                        return char, true
                    end,
                },
                -- for uppercase alphabet
                {
                    pattern = [[\u]],
                    priority = 0,
                    increase = function(content)
                        local ansiCode = string.byte(content) + 1
                        if ansiCode > string.byte("Z") then
                            ansiCode = string.byte("A")
                        end
                        local char = string.char(ansiCode)
                        return char, true
                    end,
                    decrease = function(content)
                        local ansiCode = string.byte(content) - 1
                        if ansiCode < string.byte("A") then
                            ansiCode = string.byte("Z")
                        end
                        local char = string.char(ansiCode)
                        return char, true
                    end,
                },
                -- for date format: dd/mm/YYYY
                {
                    pattern = [[\d\{2}/\d\{2}/\d\{4}]],
                    priority = 100,
                    increase = function(content)
                        local ts = vim.fn.strptime("%d/%m/%Y", content)
                        if ts == 0 then
                            return content, false
                        else
                            ts = ts + 24 * 60 * 60
                            return vim.fn.strftime("%d/%m/%Y", ts), true
                        end
                    end,
                    decrease = function(content)
                        local ts = vim.fn.strptime("%d/%m/%Y", content)
                        if ts == 0 then
                            return content, false
                        else
                            ts = ts - 24 * 60 * 60
                            return vim.fn.strftime("%d/%m/%Y", ts), true
                        end
                    end,
                },
                -- for emoji ⭐
                {
                    pattern = [[⭐\{1,5}]],
                    priority = 0,
                    increase = function(content)
                        local l = #content / 3 + 1
                        if l > 5 then
                            l = 1
                        end
                        return string.rep("⭐", l), true
                    end,
                    decrease = function(content)
                        local l = #content / 3 - 1
                        if l < 1 then
                            l = 5
                        end
                        return string.rep("⭐", l), true
                    end,
                },
                -- for circle degree
                {
                    pattern = [[\d\{1,3}°\([^\s][^cfkrCFKR]\|[^cfkrCFKR]\)]],
                    priority = 0,
                    increase = function(content)
                        local l = tonumber(content:sub(1, -3)) + 1
                        if l >= 360 then
                            l = 0
                        end
                        return string.format("%d°", l), true
                    end,
                    decrease = function(content)
                        local l = tonumber(content:sub(1, -3)) - 1
                        if l < 0 then
                            l = 359
                        end
                        return string.format("%d°", l), true
                    end,
                },
                -- for boolean
                {
                    pattern = [[\<\(true\|false\|TRUE\|FALSE\|True\|False\)\>]],
                    priority = 100,
                    increase = function(content)
                        local switch = {
                            ["true"] = "false",
                            ["false"] = "true",
                            ["True"] = "False",
                            ["False"] = "True",
                            ["TRUE"] = "FALSE",
                            ["FALSE"] = "TRUE",
                        }
                        return switch[content], true
                    end,
                    decrease = function(content)
                        local switch = {
                            ["true"] = "false",
                            ["false"] = "true",
                            ["True"] = "False",
                            ["False"] = "True",
                            ["TRUE"] = "FALSE",
                            ["FALSE"] = "TRUE",
                        }
                        return switch[content], true
                    end,
                },
                -- for boolean 2
                {
                    pattern = [[\<\(yes\|no\|YES\|NO\|Yes\|No\)\>]],
                    priority = 100,
                    increase = function(content)
                        local switch = {
                            ["yes"] = "no",
                            ["no"] = "yes",
                            ["Yes"] = "No",
                            ["No"] = "Yes",
                            ["YES"] = "NO",
                            ["NO"] = "YES",
                        }
                        return switch[content], true
                    end,
                    decrease = function(content)
                        local switch = {
                            ["yes"] = "no",
                            ["no"] = "yes",
                            ["Yes"] = "No",
                            ["No"] = "Yes",
                            ["YES"] = "NO",
                            ["NO"] = "YES",
                        }
                        return switch[content], true
                    end,
                },
                -- for boolean 3
                {
                    pattern = [[\<\(on\|off\|ON\|OFF\|On\|Off\)\>]],
                    priority = 100,
                    increase = function(content)
                        local switch = {
                            ["on"] = "off",
                            ["off"] = "on",
                            ["On"] = "Off",
                            ["Off"] = "On",
                            ["ON"] = "OFF",
                            ["OFF"] = "ON",
                        }
                        return switch[content], true
                    end,
                    decrease = function(content)
                        local switch = {
                            ["on"] = "off",
                            ["off"] = "on",
                            ["On"] = "Off",
                            ["Off"] = "On",
                            ["ON"] = "OFF",
                            ["OFF"] = "ON",
                        }
                        return switch[content], true
                    end,
                },
                -- for enable
                {
                    pattern = [[\<\(enable\|disable\|ENABLE\|DISABLE\|Enable\|Disable\)\>]],
                    priority = 100,
                    increase = function(content)
                        local switch = {
                            ["enable"] = "disable",
                            ["disable"] = "enable",
                            ["Enable"] = "Disable",
                            ["Disable"] = "Enable",
                            ["ENABLE"] = "DISABLE",
                            ["DISABLE"] = "ENABLE",
                        }
                        return switch[content], true
                    end,
                    decrease = function(content)
                        local switch = {
                            ["enable"] = "disable",
                            ["disable"] = "enable",
                            ["Enable"] = "Disable",
                            ["Disable"] = "Enable",
                            ["ENABLE"] = "DISABLE",
                            ["DISABLE"] = "ENABLE",
                        }
                        return switch[content], true
                    end,
                },
                -- for enabled
                {
                    pattern = [[\<\(enabled\|disabled\|ENABLED\|DISABLED\|Enabled\|Disabled\)\>]],
                    priority = 100,
                    increase = function(content)
                        local switch = {
                            ["enabled"] = "disabled",
                            ["disabled"] = "enabled",
                            ["Enabled"] = "Disabled",
                            ["Disabled"] = "Enabled",
                            ["ENABLED"] = "DISABLED",
                            ["DISABLED"] = "ENABLED",
                        }
                        return switch[content], true
                    end,
                    decrease = function(content)
                        local switch = {
                            ["enabled"] = "disabled",
                            ["disabled"] = "enabled",
                            ["Enabled"] = "Disabled",
                            ["Disabled"] = "Enabled",
                            ["ENABLED"] = "DISABLED",
                            ["DISABLED"] = "ENABLED",
                        }
                        return switch[content], true
                    end,
                },
                -- for neorg todo
                {
                    pattern = [[-\ \%u0028\([-\ x=_!?+]\)\%u0029\ ]],
                    priority = 100,
                    increase = function(content)
                        if vim.bo.filetype ~= "norg" then
                            return content, false
                        end
                        local switch = {
                            ["- ( ) "] = "- (-) ",
                            ["- (-) "] = "- (x) ",
                            ["- (x) "] = "- (=) ",
                            ["- (=) "] = "- (_) ",
                            ["- (_) "] = "- (!) ",
                            ["- (!) "] = "- (?) ",
                            ["- (?) "] = "- (+) ",
                            ["- (+) "] = "- ( ) ",
                        }
                        return switch[content], true
                    end,
                    decrease = function(content)
                        if vim.bo.filetype ~= "norg" then
                            return content, false
                        end
                        local switch = {
                            ["- ( ) "] = "- (+) ",
                            ["- (+) "] = "- (?) ",
                            ["- (?) "] = "- (!) ",
                            ["- (!) "] = "- (_) ",
                            ["- (_) "] = "- (=) ",
                            ["- (=) "] = "- (x) ",
                            ["- (x) "] = "- (-) ",
                            ["- (-) "] = "- ( ) ",
                        }
                        return switch[content], true
                    end,
                },
                --TODO_TASK_SENTIMENT
                {
                    pattern = [[\<\(TODO_SENTIMENT_POSITIVE\|TODO_SENTIMENT_NEUTRAL\|TODO_SENTIMENT_NEGATIVE\)\>]],
                    priority = 100,
                    increase = function(content)
                        local switch = {
                            ["TODO_SENTIMENT_NEGATIVE"] = "TODO_SENTIMENT_NEUTRAL",
                            ["TODO_SENTIMENT_NEUTRAL"] = "TODO_SENTIMENT_POSITIVE",
                            ["TODO_SENTIMENT_POSITIVE"] = "TODO_SENTIMENT_NEGATIVE",
                        }
                        return switch[content], true
                    end,
                    decrease = function(content)
                        local switch = {
                            ["TODO_SENTIMENT_POSITIVE"] = "TODO_SENTIMENT_NEUTRAL",
                            ["TODO_SENTIMENT_NEUTRAL"] = "TODO_SENTIMENT_NEGATIVE",
                            ["TODO_SENTIMENT_NEGATIVE"] = "TODO_SENTIMENT_POSITIVE",
                        }
                        return switch[content], true
                    end,
                },
                -- TODO: Ideas: weekday (monday, mon), month (january, jan)
            },
            fallback = true,
            no_default_keymaps = true,
        },
        keys = {
            {
                "<leader><C-a>",
                "<cmd>lua require('compter').increase()<CR>",
                silent = true,
                desc = "Increment using compter",
                mode = { "n" },
            },
            {
                "<leader><C-x>",
                "<cmd>lua require('compter').decrease()<CR>",
                silent = true,
                desc = "Decrement using compter",
                mode = { "n" },
            },
        },
    },
}
