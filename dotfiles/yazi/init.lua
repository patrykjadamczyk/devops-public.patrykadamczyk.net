require("bookmarks"):setup({
    last_directory = { enable = true, persist = true },
    persist = "vim",
    desc_format = "full",
    file_pick_mode = "hover",
    notify = {
        enable = true,
        timeout = 1,
        message = {
            new = "New bookmark '<key>' -> '<folder>'",
            delete = "Deleted bookmark in '<key>'",
            delete_all = "Deleted all bookmarks",
        },
    },
})

local catppuccin_theme = require("yatline-catppuccin"):setup("mocha")

-- Overide that this way because theme overrides config completely (which is stupid)
catppuccin_theme.section_separator_open = ""
catppuccin_theme.section_separator_close = ""
catppuccin_theme.inverse_separator_open = ""
catppuccin_theme.inverse_separator_close = ""
catppuccin_theme.part_separator_open = ""
catppuccin_theme.part_separator_close = ""
catppuccin_theme.section_separator = { open = "", close = "" }
catppuccin_theme.part_separator = { open = "", close = "" }
catppuccin_theme.inverse_separator = { open = "", close = "" }

require("yatline"):setup({
    theme = catppuccin_theme,
    --Manual theme deconstruct
    -- theme = {
    --     style_a = catppuccin_theme.style_a,
    --     style_b = catppuccin_theme.style_b,
    --     style_c = catppuccin_theme.style_c,
    --
    --     permissions_t_fg = catppuccin_theme.permissions_t_fg,
    --     permissions_r_fg = catppuccin_theme.permissions_r_fg,
    --     permissions_w_fg = catppuccin_theme.permissions_w_fg,
    --     permissions_x_fg = catppuccin_theme.permissions_x_fg,
    --     permissions_s_fg = catppuccin_theme.permissions_s_fg,
    --
    --     selected = catppuccin_theme.selected,
    --     copied = catppuccin_theme.copied,
    --     cut = catppuccin_theme.cut,
    --
    --     total = catppuccin_theme.total,
    --     succ = catppuccin_theme.succ,
    --     fail = catppuccin_theme.fail,
    --     found = catppuccin_theme.found,
    --     processed = catppuccin_theme.processed,
    --
    --     -- yatline-githead
    --     prefix_color = catppuccin_theme.prefix_color,
    --     branch_color = catppuccin_theme.branch_color,
    --     commit_color = catppuccin_theme.commit_color,
    --     behind_color = catppuccin_theme.behind_color,
    --     ahead_color = catppuccin_theme.ahead_color,
    --     stashes_color = catppuccin_theme.stashes_color,
    --     state_color = catppuccin_theme.state_color,
    --     staged_color = catppuccin_theme.staged_color,
    --     unstaged_color = catppuccin_theme.unstaged_color,
    --     untracked_color = catppuccin_theme.untracked_color,
    -- },
    --end

    -- section_separator = { open = "", close = "" },
    -- part_separator = { open = "", close = "" },
    -- inverse_separator = { open = "", close = "" },
    -- section_separator = { open = "|", close = "|" },
    -- part_separator = { open = "|", close = "|" },
    -- inverse_separator = { open = "|", close = "|" },
    section_separator_open = "",
    section_separator_close = "",
    inverse_separator_open = "",
    inverse_separator_close = "",
    part_separator_open = "",
    part_separator_close = "",
    -- section_separator = { open = " ", close = " " },
    -- part_separator = { open = " ", close = " " },
    -- inverse_separator = { open = "tab", close = "TAB" },

    style_a = {
        fg = "black",
        bg_mode = {
            normal = "#a89984",
            select = "#d79921",
            un_set = "#d65d0e"
        }
    },
    style_b = { bg = "#665c54", fg = "#ebdbb2" },
    style_c = { bg = "#3c3836", fg = "#a89984" },

    permissions_t_fg = "green",
    permissions_r_fg = "yellow",
    permissions_w_fg = "red",
    permissions_x_fg = "cyan",
    permissions_s_fg = "darkgray",

    tab_width = 20,
    tab_use_inverse = false,

    selected = { icon = "󰻭", fg = "yellow" },
    copied = { icon = "", fg = "green" },
    cut = { icon = "", fg = "red" },

    total = { icon = "󰮍", fg = "yellow" },
    succ = { icon = "", fg = "green" },
    fail = { icon = "", fg = "red" },
    found = { icon = "󰮕", fg = "blue" },
    processed = { icon = "󰐍", fg = "green" },

    show_background = true,

    display_header_line = true,
    display_status_line = true,

    header_line = {
        left = {
            section_a = {
                { type = "line", custom = false, name = "tabs", params = { "left" } },
            },
            section_b = {
            },
            section_c = {
            }
        },
        right = {
            section_a = {
                { type = "string", custom = false, name = "date", params = { "%A, %d %B %Y" } },
            },
            section_b = {
                { type = "string", custom = false, name = "date", params = { "%X" } },
            },
            section_c = {
            }
        }
    },

    status_line = {
        left = {
            section_a = {
                { type = "string", custom = false, name = "tab_mode" },
            },
            section_b = {
                { type = "string", custom = false, name = "hovered_size" },
            },
            section_c = {
                { type = "string",   custom = false, name = "hovered_name" },
                { type = "coloreds", custom = false, name = "symlink" },
            }
        },
        right = {
            section_a = {
                { type = "string", custom = false, name = "cursor_position" },
            },
            section_b = {
                { type = "string", custom = false, name = "cursor_percentage" },
            },
            section_c = {
                { type = "string",   custom = false, name = "hovered_file_extension", params = { true } },
                { type = "coloreds", custom = false, name = "permissions" },
                -- { type = "coloreds", custom = false, name = "task_states" },
                { type = "coloreds", custom = false, name = "count" },
            }
        }
    },
})
require("yatline-symlink"):setup({
    -- symlink_color = "white"
})
