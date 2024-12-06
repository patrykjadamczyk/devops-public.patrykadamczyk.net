" set guifont=JetBrains\ Mono:h16
" set guifont=JetBrainsMonoNL\ NFM:h16
" Enable Mouse
" set mouse=a

" Set Editor Font
if exists(':GuiFont')
    " Use GuiFont! to ignore font errors
    " GuiFont {font_name}:h{size}
    GuiFont! IosevkaTerm\ NFM\ SemiBold:h16
    " GuiFont! JetBrains\ Mono:h16
    " GuiFont! JetBrainsMonoNL\ NFM:h16
endif

" Disable GUI Tabline
" if exists(':GuiTabline')
"     GuiTabline 0
" endif

" Disable GUI Popupmenu
" if exists(':GuiPopupmenu')
"     GuiPopupmenu 0
" endif

" Enable GUI ScrollBar
if exists(':GuiScrollBar')
    GuiScrollBar 1
endif

if exists(":GuiRenderLigatures")
    GuiRenderLigatures 1
endif

if exists(":GuiWindowOpacity")
    GuiWindowOpacity 0.75
endif

if exists(":GuiLoaded")
    " Right Click Context Menu (Copy-Cut-Paste)
    nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
    inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
    xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
    snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv
endif

