" Load Config Notification
autocmd User ConfigFinished lua require("notify")("Loading local configuration completed", "info", { title = "NeoVim Local Configuration", timeout = 2000, })
" Set Shell
" Bash and Windows are not good
" if executable("bash")
"     set shell=bash
" endif

" PowerShell with :! is buggy as f
" if executable("pwsh")
"     set shell=pwsh
" endif

" Useful stuff from https://github.com/jdhao/nvim-config/blob/master/core/autocommands.vim
augroup term_settings
  autocmd!
  " Do not use number and relative number for terminal inside nvim
  autocmd TermOpen * setlocal norelativenumber nonumber
  " Go to insert mode by default to start typing command
  autocmd TermOpen * startinsert
  " Notify on how to exit terminal mode
  autocmd TermOpen * lua require("notify")("Ctrl+\\ Ctrl+n -> Exit Terminal mode", "info", {title = "Terminal",timeout = 10000})
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
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
"  set nofoldenable

" Show warnings for invalid c like syntax
let g:v_warnings = 1
" Set Tags for Vim-fugitive
set tags^=.git/tags

set signcolumn=yes
set foldcolumn=1
set title

" OCaml
" let g:opamshare = substitute(system('opam var share'),'\n$','','''')
" let g:opamshare = "C:\Users\patry\AppData\Local\opam\playground\share"
" execute "set rtp+=" . g:opamshare . "/merlin/vim"
" execute "helptags " . g:opamshare . "/merlin/vim/doc"
