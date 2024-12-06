vim.cmd([[
" Useful stuff from https://github.com/jdhao/nvim-config/blob/master/core/autocommands.vim
augroup term_settings
  autocmd!
  " Do not use number and relative number for terminal inside nvim
  autocmd TermOpen * setlocal norelativenumber nonumber
  " Go to insert mode by default to start typing command
  autocmd TermOpen * startinsert
  " Notify on how to exit terminal mode
  " autocmd TermOpen * lua require("notify")("Ctrl+\\ Ctrl+n -> Exit Terminal mode", "info", {title = "Terminal",timeout = 10000})
augroup END
]])
