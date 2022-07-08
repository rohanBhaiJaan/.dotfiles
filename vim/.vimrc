if has('syntax')
    syntax on
endif

set nu rnu
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set hidden autoread
set splitright splitbelow
set noswapfile nobackup nowrap
set wildmenu wildmode=full
set incsearch nohlsearch
set smartindent
set colorcolumn=80 cursorline
set scrolloff=20
set lazyredraw
set bg=dark
set noshowmode

set path+=**
set path+=.,**
set path+=**/.*/**/*
set wildignore+=**/.git/*
set wildignore+=**/node_modules/*
set wildignore+=**/.local/*

call plug#begin("~/.vim/autoload")
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" Plug 'sheerun/vim-polyglot'
Plug 'bfrg/vim-cpp-modern'
Plug 'itchyny/lightline.vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'rohanBhaiJaan/vim-keycast'

call plug#end()

" <ESC> IS RETURN WHEN ALT IS PRESSED
let mapleader = '\'
nnoremap <leader>x :source $MYVIMRC<CR>

" remap to navigate through tabs in vim 
nnoremap <Esc>u 1gt
nnoremap <Esc>i 2gt
nnoremap <Esc>o 3gt
nnoremap <Esc>p 4gt

nnoremap <Plug>scroll <C-e>
nnoremap <ScrollWheelDown> <Plug>scroll
nnoremap <C-e> :Lex<CR>

nnoremap Y y$
nnoremap <leader>tn :set nu! rnu!<Cr>

inoremap <BS> <Nop>
inoremap <Del> <Nop>
inoremap <C-w> <Nop>
inoremap <C-h> <Nop>

let g:netrw_winsize = 30
let g:netrw_banner = 0
let g:changeMode_waitTime = 1000
let g:setup_change_to_current_file = 1
let g:lightline = { 'colorscheme': 'solarized', }

set termguicolors

let g:tokyonight_style = 'night' " available: night, storm
" let g:tokyonight_enable_italic = 1

if exists("$g:colors_name") && g:colors_name != "monokai"
    hi Normal         ctermbg=234
    hi CursorLine     ctermbg=240 cterm=none
    hi CursorLineNr   ctermbg=237 cterm=none
    hi Pmenu          ctermbg=237 ctermfg=251
    hi PmenuSel       ctermbg=247 ctermfg=254
endif

let  &runtimepath .=  ','.expand('$HOME').'/projects/CP_setup.vim/' 

source ~/.config/nvim/custom/changeMode.vim
source ~/.config/nvim/custom/nerdtree.vim
source ~/.config/nvim/custom/fzf.vim
source ~/.config/nvim/custom/smallFunc.vim
