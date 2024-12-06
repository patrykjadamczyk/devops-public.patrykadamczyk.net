" ==================== Keyboard Shortcuts and Remaps ====================

" Window Navigation (Ctrl+[H/J/K/L])
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Window Navigation (Ctrl+[ArrowKeys])
nnoremap <C-Left> <C-w>h
nnoremap <C-Down> <C-w>j
nnoremap <C-Up> <C-w>k
nnoremap <C-Right> <C-w>l
" Window Resize (Ctrl+W [left/down/up/right])
nnoremap <C-w><left> <C-w>>
nnoremap <C-w><down> <C-w>-
nnoremap <C-w><up> <C-w>+
nnoremap <C-w><right> <C-w><

" Tab Navigation (T + [H/J/K/L] / TN)
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tn  :tabnew<CR>
nnoremap td  :tabclose<CR>
nnoremap t<right> :tabnext<CR>
nnoremap t<left> :tabprev<CR>
nnoremap <silent>tg <cmd>exe ":tabnext " . v:count1<CR>

" Relative Numbering Shortcuts
" map <C-l> :set rnu!<CR>

" ========== Plugin Keymaps ==========
" https://www.youtube.com/watch?v=FdaWQIyGZJg
" Files
" unmap <C-n>
nmap <C-n> <cmd>Sex!<cr>
" Restore default <CR> functionality
" Change <CR> back to new line in insert mode (cmp workaround)
imap <CR> <CR>

" Inlay Hints
" nnoremap <leader>th <cmd>lua vim.lsp.inlay_hint(0, nil)<cr>
nnoremap <leader>th <cmd>lua vim.lsp.inlay_hint.enable(true, {})<cr>
" Automatically center cursor when going half page up down
nnoremap <C-i> <C-d>zz
nnoremap <C-u> <C-u>zz
" Magical Paste
nnoremap <leader>p \"_dP
xnoremap <leader>p \"_dP
