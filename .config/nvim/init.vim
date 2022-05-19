if has("syntax")
    syntax on
endif

call plug#begin('~/.plugins/')
Plug 'morhetz/gruvbox'

" Plug 'preservim/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'ryanoasis/vim-devicons'

Plug 'preservim/tagbar'
Plug 'mattn/emmet-vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'vimwiki/vimwiki'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug '~/.config/nvim/custom/'
call plug#end()

set nu rnu
set guicursor=
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set nowrap noswapfile nobackup
set incsearch inccommand=split nohlsearch
set autoread hidden
set splitbelow splitright
set scrolloff=20
set colorcolumn=80
set bg=dark
set cursorline
colorscheme gruvbox

let mapleader = " "
let g:netrw_banner = 0
let g:netrw_winsize = 25

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <A-j> <C-d>
nnoremap <A-k> <C-u>
nnoremap <C-e> :Lex<CR>
" nnoremap <C-e> :call g:NerdTreeToggle()<CR>

nnoremap - :vertical resize -5<CR>
nnoremap + :vertical resize +5<CR>

nnoremap <C-p> :GitFiles<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap gs :G<CR>

nnoremap Y y$
nnoremap <F1> :TagbarToggle<CR>

augroup Vim
    autocmd! VimEnter *.vim nnoremap <leader>x :source ~/.config/nvim/init.vim<CR>
    autocmd! VimEnter *.vim nnoremap <leader>c :source %<CR>
augroup END
