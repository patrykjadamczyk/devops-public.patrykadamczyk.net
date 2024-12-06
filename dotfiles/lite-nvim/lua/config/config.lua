-- NVIM Tree Test
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- Set Win Fix width to make sure that sidebar have always same length
vim.api.nvim_create_autocmd({"BufEnter"}, {
  callback = function(args)
    local buf = args["buf"]
    if string.match(vim.fn.bufname(buf), "^SidebarNvim_.*") then
      vim.cmd("set winfixwidth")
    end
  end
})
-- Close when last buffer is sidebar
vim.api.nvim_create_autocmd({"BufEnter"}, {
  callback = function(_)
    local buffers = vim.api.nvim_list_bufs()
    if (#buffers == 1) then
      for _, v in ipairs(vim.api.nvim_list_bufs()) do
          if string.match(vim.fn.bufname(v), "^SidebarNvim_.*") then
              vim.cmd("quit")
              return
          end
      end
    end
  end
})
-- Prepare stuff to make everything work if folder is provided
-- This is workaround for nvim-tree which acts very crazy when there is no buffers
-- This workaround does not work when you disable git integration in nvim tree because then for some reason argv(0) is
-- NvimTree1 (name of nvimtree buffer) instead of real argv (some folder)
vim.api.nvim_create_autocmd({"VimEnter"}, {
  callback = function(_)
    local argc = vim.fn.argc()
    if (argc == 0) then
      return
    end
    local i = 0
    local found = false
    while i < argc do
      if (vim.fn.isdirectory(vim.fn.argv(i)) == 1) then
        found = true
      end
      i = i + 1
    end
    if (found ~= true) then
      return
    end
  end
})
-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = vim.api.nvim_create_augroup("auto_create_dir", {}),
  callback = function(event)
    if event.match:match("^%w%w+://") then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- Turn Inlay Hints On by Default
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client.server_capabilities.inlayHintProvider then
          vim.lsp.inlay_hint(args.buf, true)
      end
  end
})

-- Fold Column
-- vim.o.statuscolumn = '%C%s%l %{v:relnum}' --default
-- vim.o.statuscolumn = '%{foldlevel(v:lnum) > foldlevel(v:lnum - 1) ? (foldclosed(v:lnum) == -1 ? "▼" : "⏵") : " " }%s%l %{v:relnum}'

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ timeout = 500 })
  end,
})
