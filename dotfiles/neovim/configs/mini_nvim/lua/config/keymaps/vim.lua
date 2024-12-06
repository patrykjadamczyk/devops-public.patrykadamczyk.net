vim.cmd([[
" ==================== Keyboard Shortcuts and Remaps ====================
" nnoremap <silent>tg <cmd>exe ":tabnext " . v:count1<CR>
" ========== Plugin Keymaps ==========
" Toggle Term
autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>

" By applying the mappings this way you can pass a count to your
" mapping to open a specific window.
" For example: 2<C-t> will open terminal 2
nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
nnoremap <silent><leader>tf <Cmd>exe v:count1 . "ToggleTerm direction=float"<CR>

" https://www.youtube.com/watch?v=FdaWQIyGZJg

" Harpoon
nnoremap <silent><leader>hg <cmd>exe ':lua require("harpoon"):list():select('.v:count1.')'<cr>
nnoremap <leader>hj1 <cmd>lua require("harpoon"):list():select(1)<cr>
nnoremap <leader>hj2 <cmd>lua require("harpoon"):list():select(2)<cr>
nnoremap <leader>hj3 <cmd>lua require("harpoon"):list():select(3)<cr>
nnoremap <leader>hj4 <cmd>lua require("harpoon"):list():select(4)<cr>
nnoremap <leader>hj5 <cmd>lua require("harpoon"):list():select(5)<cr>
nnoremap <leader>hj6 <cmd>lua require("harpoon"):list():select(6)<cr>
nnoremap <leader>hj7 <cmd>lua require("harpoon"):list():select(7)<cr>
nnoremap <leader>hj8 <cmd>lua require("harpoon"):list():select(8)<cr>
nnoremap <leader>hj9 <cmd>lua require("harpoon"):list():select(9)<cr>
" Vsnip
" imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
" smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
" imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
" smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
" imap <expr> <C-j>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-j>'
" smap <expr> <C-j>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-j>'
" Redo
nnoremap U <C-r>
]])
