--#region Harpoon
function harpoon_is_current_on_list()
    local harpoon = require("harpoon")
    local harpoon_list = harpoon:list().items
    local found = false
    for _, v in ipairs(harpoon_list) do
        found = found or (v.value == vim.fn.expand("%:w"))
    end
    return found
end
function harpoon_current_id_on_list()
    local harpoon = require("harpoon")
    local harpoon_list = harpoon:list().items
    for i, v in ipairs(harpoon_list) do
        if v.value == vim.fn.expand("%:w") then
            return i
        end
    end
    return nil
end
PatVimKeyMapSet({
    "n",
    "<leader>hm",
    function()
        local harpoon = require("harpoon")
        if harpoon_is_current_on_list() == true then
            harpoon:list():remove()
            vim.notify("Removing current file from harpoon marks", vim.log.levels.INFO, { title = "Harpoon" })
        else
            harpoon:list():prepend()
            vim.notify("Adding current file from harpoon marks", vim.log.levels.INFO, { title = "Harpoon" })
        end
    end,
    {
        noremap = true,
        silent = true,
        desc = "Toggle harpoon mark for current file",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>ha",
    function()
        local harpoon = require("harpoon")
        if harpoon_is_current_on_list() == true then
            harpoon:list():remove()
            vim.notify("Removing current file from harpoon marks", vim.log.levels.INFO, { title = "Harpoon" })
        else
            harpoon:list():add()
            vim.notify("Adding current file from harpoon marks", vim.log.levels.INFO, { title = "Harpoon" })
        end
    end,
    {
        noremap = true,
        silent = true,
        desc = "Toggle harpoon mark for current file",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>hq",
    -- "<cmd>lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<cr>",
    function()
        require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
    end,
    {
        noremap = true,
        silent = true,
        desc = "Open Harpoon quick menu",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>hn",
    -- "<cmd>lua require('harpoon'):list():next()<cr>",
    function()
        require("harpoon"):list():next()
    end,
    {
        noremap = true,
        silent = true,
        desc = "Go to next Harpoon mark",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>hp",
    -- "<cmd>lua require('harpoon'):list():prev()<cr>",
    function()
        require("harpoon"):list():prev()
    end,
    {
        noremap = true,
        silent = true,
        desc = "Go to previous Harpoon Mark",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>h<Right>",
    function()
        require("harpoon"):list():next()
    end,
    {
        noremap = true,
        silent = true,
        desc = "Go to next Harpoon mark",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>h<Left>",
    function()
        require("harpoon"):list():prev()
    end,
    {
        noremap = true,
        silent = true,
        desc = "Go to previous Harpoon Mark",
    },
})
--#endregion
--#region Harpoon
PatVimKeyMapSet({
    "n",
    "<leader>hA",
    function()
        require("harpoon"):list():add()
    end,
    {
        noremap = true,
        silent = true,
        desc = "Harpoon File",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>hh",
    function()
        require("harpoon"):list():add()
    end,
    {
        noremap = true,
        silent = true,
        desc = "Harpoon File",
    },
})
for _, lhs in ipairs({ "<leader>ht", "<leader>fH", "<leader>`" }) do
    PatVimKeyMapSet({
        "n",
        lhs,
        function()
            local function toggle_telescope(harpoon_files)
                local file_paths = {}
                for _, item in ipairs(harpoon_files.items) do
                    table.insert(file_paths, item.value)
                end

                require("telescope.pickers")
                    .new({}, {
                        prompt_title = "Harpoon",
                        finder = require("telescope.finders").new_table({
                            results = file_paths,
                        }),
                        previewer = require("telescope.config").values.file_previewer({}),
                        sorter = require("telescope.config").values.generic_sorter({}),
                    })
                    :find()
            end

            toggle_telescope(require("harpoon"):list())
        end,
        {
            noremap = true,
            silent = true,
            desc = "Harpoon Menu in Telescope",
        },
    })
end
for _, lhs_prefix in ipairs({ "<leader>", "<leader>h" }) do
    for i = 1, 9 do
        PatVimKeyMapSet({
            "n",
            lhs_prefix .. i,
            function()
                require("harpoon"):list():select(i)
            end,
            {
                noremap = true,
                silent = true,
                desc = "Harpoon to File " .. i,
            },
        })
    end
end
--#endregion
