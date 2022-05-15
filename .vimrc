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
set scrolloff=20
set lazyredraw
set bg=dark

call plug#begin("~/.vim-plugins")
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'danilo-augusto/vim-afterglow'
call plug#end()

colorscheme afterglow

let mapleader = ' '
nnoremap <leader>x :source $MYVIMRC<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
