--#region Mini Basics
---@diagnostic disable:undefined-field
_G.PatMiniBasics = {}
-- Add empty lines before and after cursor line supporting dot-repeat
_G.PatMiniBasics.put_empty_line = function(put_above)
    -- This has a typical workflow for enabling dot-repeat:
    -- - On first call it sets `operatorfunc`, caches data, and calls
    --   `operatorfunc` on current cursor position.
    -- - On second call it performs task: puts `v:count1` empty lines
    --   above/below current line.
    if type(put_above) == "boolean" then
        vim.o.operatorfunc = "v:lua.MiniBasics.put_empty_line"
        _G.PatMiniBasics.cache_empty_line = { put_above = put_above }
        return "g@l"
    end

    local target_line = vim.fn.line(".") - (_G.PatMiniBasics.cache_empty_line.put_above and 1 or 0)
    vim.fn.append(target_line, vim.fn["repeat"]({ "" }, vim.v.count1))
end
-- Add new lines above/below cursor
vim.keymap.set("n", "[<Space>", "v:lua.PatMiniBasics.put_empty_line(v:true)", { expr = true, desc = "Put empty line above" })
vim.keymap.set("n", "]<Space>", "v:lua.PatMiniBasics.put_empty_line(v:false)", { expr = true, desc = "Put empty line below" })

-- Copy/paste with system clipboard
vim.keymap.set({ "n", "x" }, "gy", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set("n", "gp", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set({ "n", "x" }, "gY", '"+Y', { desc = "Copy to system clipboard" })
vim.keymap.set("n", "gP", '"+P', { desc = "Paste from system clipboard" })
-- Paste in Visual with `P` to not copy selected text (`:h v_P`)
vim.keymap.set("x", "gp", '"+P', { desc = "Paste from system clipboard" })

-- Reselect latest changed, put, or yanked text
vim.keymap.set(
    "n",
    "gV",
    '"`[" . strpart(getregtype(), 0, 1) . "`]"',
    { expr = true, replace_keycodes = false, desc = "Visually select changed text" }
)

-- Search inside visually highlighted text. Use `silent = false` for it to
-- make effect immediately.
vim.keymap.set("x", "g/", "<esc>/\\%V", { silent = false, desc = "Search inside visual selection" })
---@diagnostic enable:undefined-field
--#endregion
