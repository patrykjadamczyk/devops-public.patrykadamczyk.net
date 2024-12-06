" ===== Theme (Color Scheme) =====
let g:airline_detect_spell=0

if has('nvim')
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    set termguicolors
    "colorscheme NeoSolarized
    "colorscheme dracula
    "colorscheme material-monokai
    " colorscheme catppuccin-mocha
    colorscheme tokyonight
    set background=dark
endif

" Theme Customization
try " Check For Material Theme that we can customize
    "colorscheme material-monokai
catch /^E185:/
    let g:materialmonokai_italic=1
    let g:materialmonokay_subtle_spell=1
    let g:airline_theme='materialmonokai'
endtry
