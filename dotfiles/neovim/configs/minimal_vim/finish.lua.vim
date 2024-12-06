" ============= Notify about loading config =============
if g:is_nvim
lua << EOF
vim.schedule(function()
  vim.notify("Loading configuration completed", "info", {})
end)
EOF
endif
silent! helptags ALL
