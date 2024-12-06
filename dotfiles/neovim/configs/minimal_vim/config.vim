" Load Config Notification
autocmd User ConfigFinished lua vim.notify("Loading local configuration completed", "info", {})

" Useful stuff from https://github.com/jdhao/nvim-config/blob/master/core/autocommands.vim
augroup term_settings
  autocmd!
  " Do not use number and relative number for terminal inside nvim
  autocmd TermOpen * setlocal norelativenumber nonumber
  " Go to insert mode by default to start typing command
  autocmd TermOpen * startinsert
  " Notify on how to exit terminal mode
  autocmd TermOpen * lua vim.notify("Ctrl+\\ Ctrl+n -> Exit Terminal mode", "info", {})
augroup END

" Return to last cursor position when opening a file
augroup resume_cursor_position
  autocmd!
  autocmd BufReadPost * call s:resume_cursor_position()
augroup END
  
" Only resume last cursor position when there is no go-to-line command (something like '+23').
function s:resume_cursor_position() abort
  if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    let l:args = v:argv  " command line arguments
    for l:cur_arg in l:args
      " Check if a go-to-line command is given.
      let idx = match(l:cur_arg, '\v^\+(\d){1,}$')
      if idx != -1
        return
      endif
    endfor

    execute "normal! g`\"zvzz"
  endif
endfunction

" Do not close the preview tab when switching to other buffers
let g:mkdp_auto_close = 0

" Force to not fold by default
set foldlevelstart=99
set foldlevel=99
" Use treesitter for folding
" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()
"  set nofoldenable

set signcolumn=yes
