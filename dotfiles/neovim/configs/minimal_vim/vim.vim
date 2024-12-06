" ==================== Base Settings ====================
" Encoding
set encoding=utf-8
" Syntax
syntax on
" Spacing and indenting
filetype plugin indent on
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set backspace=2
set shiftround
" History
set history=100
" Search
set incsearch
set hlsearch
set ignorecase smartcase
" Line Numbering and Ruler
set ruler
set number
set numberwidth=5
" Completion
set wildmenu
set wildmode=list:longest,full
" Folding
set foldmethod=indent
set foldlevelstart=99
" UI
set laststatus=2
set showcmd
set scrolloff=2
set sidescrolloff=10
" Editor
set clipboard=unnamed,unnamedplus
set list listchars=tab:»·,trail:·,nbsp:·,precedes:←,extends:→
" Text Width Guide
set textwidth=120
set colorcolumn=+1
" set nowrap
" Mouse
set mouse=a
" Enable undohistory
set undofile

" =============== Language Specific Stuff ===============

" Treat li and p tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" =============== Editor Specific Settings ==============

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
" Auto complete with dictionary words
set complete+=kspell
" Spell check
"set spell
set spelllang=en,en_us,pl,eo,sv_se
" Auto reload changed files
set autoread
" Auto chdir
" set autochdir
" Performance
" set lazyredraw
set ttyfast
set timeoutlen=1000 ttimeoutlen=0
" Backup Files
set nobackup nowritebackup noswapfile
" Bells
set noerrorbells novisualbell
" User Interface
" colorsheme solarized
set background=dark
highlight Comment cterm=italic gui=italic

" Relative Numbering
" set rnu!
set number relativenumber
let &stc='%C%s%l %{v:relnum} '


" Vim Syntax Highlighting for Lua HEREDOC
let g:vimsyn_embed = 'l'
" Term gui colors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
" Confirm to save changes before exiting modified buffer
set confirm
" Remap Next change in diff to something else
nnoremap [g [c
nnoremap ]g ]c
