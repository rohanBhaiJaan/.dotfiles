if has("syntax")
    syntax on
endif

call plug#begin('~/.plugins/')
Plug 'morhetz/gruvbox'

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'

" Plug 'mattn/emmet-vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'vimwiki/vimwiki'
Plug 'preservim/tagbar'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug '~/.config/nvim/custom/'
call plug#end()

let mapleader = " "
set hidden
set nu rnu
set guicursor=
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set nowrap noswapfile nobackup
set incsearch inccommand=split nohlsearch
set autoread
set splitbelow splitright
set scrolloff=20
set bg=dark
colorscheme gruvbox

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <A-j> <C-d>
nnoremap <A-k> <C-u>

nnoremap <C-e> :call g:NerdTreeToggle()<CR>
nnoremap - :vertical resize -5<CR>
nnoremap + :vertical resize +5<CR>

nnoremap <C-p> :GitFiles<CR>
nnoremap gs :G<CR>

nnoremap Y y$
nnoremap <F1> :TagbarToggle<CR>

augroup Vim
    autocmd! VimEnter * nnoremap <leader>x :source ~/.config/nvim/init.vim<CR>
augroup END

