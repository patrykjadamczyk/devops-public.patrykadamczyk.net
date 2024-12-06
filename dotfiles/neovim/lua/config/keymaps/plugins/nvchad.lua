local custom_menus = require("config.plugins.config.volt_menus")

-- Keyboard users
PatVimKeyMapSet({
    "n",
    "<leader>O",
    function()
        require("menu").open(custom_menus.main_menu)
    end,
    {
        desc = "Open Volt Menu",
    },
})

-- mouse users + nvimtree users!
-- PatVimKeyMapSet({"n", "<RightMouse>", function()
--     vim.cmd.exec '"normal! \\<RightMouse>"'

--     require("menu").open(custom_menus.main_menu, { mouse = true })
-- end, {}})
PatVimKeyMapSet({
    "n",
    "<S-RightMouse>",
    function()
        vim.cmd.exec('"normal! \\<RightMouse>"')

        require("menu").open(custom_menus.main_menu, { mouse = true })
    end,
    {
        desc = "Open Volt Menu",
    },
})
