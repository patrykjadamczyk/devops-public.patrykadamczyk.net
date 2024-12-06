local M = {}
---@type table<string, table<string, string[]>>
M.dials_by_ft = {}

---@param increment boolean
---@param g? boolean
function M.dial(increment, g)
    local mode = vim.fn.mode(true)
    -- Use visual commands for VISUAL 'v', VISUAL LINE 'V' and VISUAL BLOCK '\22'
    local is_visual = mode == "v" or mode == "V" or mode == "\22"
    local func = (increment and "inc" or "dec") .. (g and "_g" or "_") .. (is_visual and "visual" or "normal")
    local group = M.dials_by_ft[vim.bo.filetype] or "default"
    return require("dial.map")[func](group)
end

M.compter_templates = {
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
}

M.compter_to_user = function()
    local templates = {}
    for _, template in ipairs(M.compter_templates) do
        templates[#templates + 1] = require("dial.augend").user.new({
            find = require("dial.augend.common").find_pattern(template.pattern),
            ---@param text string
            ---@param addend integer
            ---@param cursor? integer
            ---@return { text?: string, cursor?: integer }
            add = function(text, addend, cursor)
                local newText = text
                if addend > 0 then
                    local nt, ok = template.increase(text)
                    if ok then
                        newText = nt
                    end
                else
                    local nt, ok = template.decrease(text)
                    if ok then
                        newText = nt
                    end
                end
                return { text = newText, cursor = cursor }
            end,
        })
    end
    return templates
end

return {
    -- Fully better C-A C-X
    {
        "monaqa/dial.nvim",
        desc = "Increment and decrement numbers, dates, and more",
        priority = vim.g.patconfig_highest_base_priority - 530,
        keys = {
            {
                "<C-a>",
                function()
                    return M.dial(true)
                end,
                expr = true,
                desc = "Increment",
                mode = { "n", "v" },
            },
            {
                "<C-x>",
                function()
                    return M.dial(false)
                end,
                expr = true,
                desc = "Decrement",
                mode = { "n", "v" },
            },
            {
                "g<C-a>",
                function()
                    return M.dial(true, true)
                end,
                expr = true,
                desc = "Increment",
                mode = { "n", "v" },
            },
            {
                "g<C-x>",
                function()
                    return M.dial(false, true)
                end,
                expr = true,
                desc = "Decrement",
                mode = { "n", "v" },
            },
        },
        opts = function()
            local augend = require("dial.augend")

            local logical_alias = augend.constant.new({
                elements = { "&&", "||" },
                word = false,
                cyclic = true,
            })

            local ordinal_numbers = augend.constant.new({
                -- elements through which we cycle. When we increment, we go down
                -- On decrement we go up
                elements = {
                    "first",
                    "second",
                    "third",
                    "fourth",
                    "fifth",
                    "sixth",
                    "seventh",
                    "eighth",
                    "ninth",
                    "tenth",
                },
                -- if true, it only matches strings with word boundary. firstDate wouldn't work for example
                word = false,
                -- do we cycle back and forth (tenth to first on increment, first to tenth on decrement).
                -- Otherwise nothing will happen when there are no further values
                cyclic = true,
            })

            local weekdays = augend.constant.new({
                elements = {
                    "Monday",
                    "Tuesday",
                    "Wednesday",
                    "Thursday",
                    "Friday",
                    "Saturday",
                    "Sunday",
                },
                word = true,
                cyclic = true,
            })

            local months = augend.constant.new({
                elements = {
                    "January",
                    "February",
                    "March",
                    "April",
                    "May",
                    "June",
                    "July",
                    "August",
                    "September",
                    "October",
                    "November",
                    "December",
                },
                word = true,
                cyclic = true,
            })

            local default_dials = {
                augend.constant.alias.bool, -- boolean value (true <-> false)
                -- augend.integer.alias.decimal, -- nonnegative decimal number (0, 1, 2, 3, ...)
                augend.integer.alias.decimal_int, -- signed  decimal number (0, 1, 2, 3, ...)
                augend.integer.alias.hex, -- nonnegative hex number  (0x01, 0x1a1f, etc.)
                augend.integer.alias.octal, -- nonnegative octal number  (0o01, 0o1612, etc.)
                augend.integer.alias.binary, -- nonnegative binary number  (0b01, 0b1010, etc.)
                augend.date.alias["%Y/%m/%d"], -- date (2022/02/19, etc.)
                augend.date.alias["%d/%m/%Y"], -- date EU
                augend.date.alias["%d.%m.%Y"], -- date EU
                augend.date.alias["%H:%M"], -- time
                augend.date.alias["%H:%M:%S"], -- time
                augend.constant.alias.alpha, -- characters
                augend.constant.alias.Alpha, -- characters
                augend.semver.alias.semver, -- characters
                augend.hexcolor.new({
                    case = "lower",
                }),
                augend.hexcolor.new({
                    case = "upper",
                }),
                augend.constant.new({
                    elements = {
                        "True",
                        "False",
                    },
                    word = true,
                    cyclic = true,
                }),
                augend.constant.new({
                    elements = {
                        "TRUE",
                        "FALSE",
                    },
                    word = true,
                    cyclic = true,
                }),
                augend.constant.new({
                    elements = {
                        "yes",
                        "no",
                    },
                    word = true,
                    cyclic = true,
                }),
                augend.constant.new({
                    elements = {
                        "Yes",
                        "No",
                    },
                    word = true,
                    cyclic = true,
                }),
                augend.constant.new({
                    elements = {
                        "YES",
                        "NO",
                    },
                    word = true,
                    cyclic = true,
                }),
                augend.constant.new({
                    elements = {
                        "enable",
                        "disable",
                    },
                    word = true,
                    cyclic = true,
                }),
                augend.constant.new({
                    elements = {
                        "enabled",
                        "disabled",
                    },
                    word = true,
                    cyclic = true,
                }),
                augend.constant.new({
                    elements = {
                        "Enable",
                        "Disable",
                    },
                    word = true,
                    cyclic = true,
                }),
                augend.constant.new({
                    elements = {
                        "Enabled",
                        "Disabled",
                    },
                    word = true,
                    cyclic = true,
                }),
                augend.constant.new({
                    elements = {
                        "ENABLE",
                        "DISABLE",
                    },
                    word = true,
                    cyclic = true,
                }),
                augend.constant.new({
                    elements = {
                        "ENABLED",
                        "DISABLED",
                    },
                    word = true,
                    cyclic = true,
                }),
                augend.constant.new({
                    elements = {
                        "TODO_SENTIMENT_POSITIVE",
                        "TODO_SENTIMENT_NEUTRAL",
                        "TODO_SENTIMENT_NEGATIVE",
                    },
                    word = false,
                    cyclic = true,
                }),
            }
            -- This doesnt work at all because it can't find methods inside of this objects
            -- default_dials = vim.tbl_deep_extend(
            --     "force",
            --     default_dials,
            --     M.compter_to_user()
            -- )

            ---@param dials table
            ---@return table
            local function extend(dials)
                local ret = {}
                for _, val in ipairs(default_dials) do
                    ret[#ret + 1] = val
                end
                for _, val in ipairs(M.compter_to_user()) do
                    ret[#ret + 1] = val
                end
                for _, val in ipairs(dials) do
                    ret[#ret + 1] = val
                end
                return ret
                -- return vim.tbl_deep_extend("force", default_dials, dials)
            end
            return {
                dials_by_ft = {
                    css = "css",
                    javascript = "typescript",
                    javascriptreact = "typescript",
                    json = "json",
                    lua = "lua",
                    markdown = "markdown",
                    python = "python",
                    sass = "css",
                    scss = "css",
                    typescript = "typescript",
                    typescriptreact = "typescript",
                    neorg = "neorg",
                },
                groups = {
                    default = extend({}),
                    typescript = extend({
                        logical_alias,
                        augend.constant.new({ elements = { "let", "const" } }),
                        ordinal_numbers,
                        weekdays,
                        months,
                    }),
                    css = extend({}),
                    markdown = extend({
                        augend.misc.alias.markdown_header,
                        ordinal_numbers,
                        weekdays,
                        months,
                    }),
                    json = extend({
                        augend.semver.alias.semver, -- versioning (v1.1.2)
                    }),
                    neorg = extend({
                        -- Neorg Todo
                        augend.constant.new({
                            elements = {
                                "- ( ) ",
                                "- (-) ",
                                "- (x) ",
                                "- (=) ",
                                "- (_) ",
                                "- (!) ",
                                "- (?) ",
                                "- (+) ",
                            },
                            word = false,
                            cyclic = true,
                        }),
                    }),
                    lua = extend({
                        augend.constant.new({
                            elements = { "and", "or" },
                            word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
                            cyclic = true, -- "or" is incremented into "and".
                        }),
                        ordinal_numbers,
                        weekdays,
                        months,
                    }),
                    python = extend({
                        logical_alias,
                        ordinal_numbers,
                        weekdays,
                        months,
                    }),
                },
            }
        end,
        config = function(_, opts)
            require("dial.config").augends:register_group(opts.groups)
            -- M.dials_by_ft = opts.dials_by_ft
        end,
    },
}
