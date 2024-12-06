" ==================== Keyboard Shortcuts and Remaps ====================
nnoremap <silent>tg <cmd>exe ":tabnext " . v:count1<CR>
" ========== Plugin Keymaps ==========
" Toggle Term
autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>

" By applying the mappings this way you can pass a count to your
" mapping to open a specific window.
" For example: 2<C-t> will open terminal 2
nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
" inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>
nnoremap <silent><leader>tf <Cmd>exe v:count1 . "ToggleTerm direction=float"<CR>
" inoremap <silent><leader>tf <Esc><Cmd>exe v:count1 . "ToggleTerm direction=float"<CR>

" https://www.youtube.com/watch?v=FdaWQIyGZJg
" Files
silent! unmap <C-n>
nmap <C-n> <cmd>NvimTreeToggle<cr>
" Restore default <CR> functionality
" Change <CR> back to new line in insert mode (cmp workaround)
imap <CR> <CR>

" Magic Paste
nnoremap <leader>p \"_dP
xnoremap <leader>p \"_dP
" Harpoon
nnoremap <silent><leader>hg <cmd>exe ':lua require("harpoon.ui").nav_file('.v:count1.')'<cr>
nnoremap <silent><leader>ht <cmd>exe ':lua require("harpoon.term").gotoTerminal('.v:count1.')'<cr>
" Vsnip
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
