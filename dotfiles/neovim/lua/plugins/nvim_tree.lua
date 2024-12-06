return {
    -- ===== File Explorer =====
    {
        "nvim-tree/nvim-tree.lua",
        priority = vim.g.patconfig_highest_base_priority - 40,
        cond = function()
            return false
        end,
        config = function()
            require("nvim-tree").setup({
                filters = {
                    dotfiles = false,
                },
                -- disable_netrw = true,
                -- hijack_netrw = true,
                disable_netrw = false,
                hijack_netrw = true,
                hijack_cursor = true,
                hijack_unnamed_buffer_when_opening = false,
                sync_root_with_cwd = false,
                update_focused_file = {
                    enable = true,
                    update_root = false,
                },
                view = {
                    side = "left",
                    width = 30,
                    preserve_window_proportions = true,
                },
                git = {
                    enable = true,
                    ignore = false,
                },
                filesystem_watchers = {
                    enable = true,
                },
                actions = {
                    open_file = {
                        resize_window = true,
                    },
                },
                renderer = {
                    -- Force label using default label instead of true because true doesn't work
                    -- root_folder_label = true,
                    root_folder_label = ":~:s?$?/..?",
                    highlight_git = true,
                    -- highlight_opened_files = "none",
                    indent_markers = {
                        enable = true,
                    },
                },
                tab = {
                    sync = {
                        open = true,
                    },
                },
            })
        end,
    },
}
