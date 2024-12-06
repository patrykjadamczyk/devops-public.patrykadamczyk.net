return {
    -- Project management
    {
        "ahmedkhalf/project.nvim",
        priority = vim.g.patconfig_highest_base_priority - 320,
        config = function()
            require("project_nvim").setup({
                sync_root_with_cwd = true,
                respect_buf_cwd = true,
                update_focused_file = {
                    enable = true,
                    update_root = true,
                },
            })
        end,
    },
    -- Search Plugin for Manual and stuff
    {
        "lalitmee/browse.nvim",
        priority = vim.g.patconfig_highest_base_priority - 320,
        config = function()
            require("browse").setup({
                provider = "duckduckgo",
            })
            vim.api.nvim_create_user_command("BrowseInputSearch", function()
                require("browse").input_search()
            end, {})
            vim.api.nvim_create_user_command("BrowseDevdocsSearch", function()
                require("browse").devdocs.search()
            end, {})
            vim.api.nvim_create_user_command("BrowseDevdocsFiletypeSearch", function()
                require("browse").devdocs.search_with_filetype()
            end, {})
            vim.api.nvim_create_user_command("BrowseMdnSearch", function()
                require("browse").mdn.search()
            end, {})
        end,
    },
    -- Package Information (YARN/NPM)
    {
        "vuki656/package-info.nvim",
        priority = vim.g.patconfig_highest_base_priority - 320,
        config = function()
            require("package-info").setup({})
        end,
    },
    -- Scratch files
    {
        "Sonicfury/scretch.nvim",
        priority = vim.g.patconfig_highest_base_priority - 320,
        config = function()
            require("scretch").setup({
                default_name = "scratch_",
                default_type = "txt",
                split_cmd = "vsplit",
            })
        end,
    },
    -- Task Runner
    {
        "stevearc/overseer.nvim",
        priority = vim.g.patconfig_highest_base_priority - 320,
        opts = {
            strategy = "toggleterm",
        },
    },
}
