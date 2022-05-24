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
colorscheme monokai

call plug#begin("~/.vim/autoload")
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
Plug 'octol/vim-cpp-enhanced-highlight'

Plug '~/.config/nvim/custom'
call plug#end()

" <ESC> IS RETURN WHEN ALT IS PRESSED
let mapleader = ' '
nnoremap <leader>x :source $MYVIMRC<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <Esc>j <C-d>
nnoremap <Esc>k <C-u>
nnoremap <C-e> :Lex<CR>
nnoremap Y y$

vnoremap <C-x> :!termux-clipboard-set<CR>
vnoremap <C-c> :w !termux-clipboard-set<CR><CR>
inoremap <C-v> <ESC>:read !termux-clipboard-get<CR>i

let g:netrw_winsize = 30
let g:netrw_banner = 0

if g:colors_name != "monokai"
    hi Normal         ctermbg=234
    hi CursorLine     ctermbg=240 cterm=none
    hi CursorLineNr   ctermbg=237 cterm=none
    hi Pmenu          ctermbg=237 ctermfg=251
    hi PmenuSel       ctermbg=247 ctermfg=254
endif
