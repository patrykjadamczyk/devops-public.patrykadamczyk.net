" Do not yank with x
nnoremap x "_x

" LSP Keymaps
command! LspFormat lua vim.lsp.buf.format()
autocmd User LspAttach nnoremap K <cmd>lua vim.lsp.buf.hover()<cr>
autocmd User LspAttach nnoremap gd <cmd>lua vim.lsp.buf.definition()<cr>
autocmd User LspAttach nnoremap gD <cmd>lua vim.lsp.buf.declaration()<cr>
autocmd User LspAttach nnoremap gi <cmd>lua vim.lsp.buf.implementation()<cr>
autocmd User LspAttach nnoremap go <cmd>lua vim.lsp.buf.type_definition()<cr>
autocmd User LspAttach nnoremap gr <cmd>lua vim.lsp.buf.references()<cr>
autocmd User LspAttach nnoremap gs <cmd>lua vim.lsp.buf.signature_help()<cr>
autocmd User LspAttach nnoremap <F2> <cmd>lua vim.lsp.buf.rename()<cr>
autocmd User LspAttach nnoremap <F3> <cmd>lua vim.lsp.buf.format({async = true})<cr>
autocmd User LspAttach nnoremap <F4> <cmd>lua vim.lsp.buf.code_action()<cr>
autocmd User LspAttach xnoremap <F4> <cmd>lua vim.lsp.buf.range_code_action()<cr>
" Diagnostics
autocmd User LspAttach nnoremap gl <cmd>lua vim.diagnostic.open_float()<cr>
autocmd User LspAttach nnoremap [d <cmd>lua vim.diagnostic.goto_prev()<cr>
autocmd User LspAttach nnoremap ]d <cmd>lua vim.diagnostic.goto_next()<cr>
autocmd User LspAttach nnoremap K <cmd>lua vim.lsp.buf.hover()<cr>
" Other
nnoremap <C-s> <cmd>w<cr>
nnoremap <esc> <cmd>noh<cr><esc>
inoremap <esc> <cmd>noh<cr><esc>
