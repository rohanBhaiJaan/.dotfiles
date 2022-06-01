if has("syntax")
    syntax on
endif

call plug#begin('~/.config/nvim/autoload/')
Plug 'morhetz/gruvbox'

" Plug 'preservim/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'ryanoasis/vim-devicons'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'preservim/tagbar'
Plug 'mattn/emmet-vim'
Plug 'vimwiki/vimwiki'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'ThePrimeagen/vim-be-good'
Plug 'tpope/vim-fugitive'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug '~/.config/nvim/custom/'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'
call plug#end()

lua require("my_lsp_config")

set nu rnu
set guicursor=
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set nowrap noswapfile nobackup backspace=0
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
let g:netrw_liststyle = 3

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <A-j> <C-d>
nnoremap <A-k> <C-u>
nnoremap <C-e> :Lex<CR>

nnoremap - :vertical resize -5<CR>
nnoremap + :vertical resize +5<CR>

nnoremap <C-p> :GitFiles<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap gs :G<CR>

nnoremap Y y$
nnoremap <F1> :TagbarToggle<CR>

inoremap <BS> <Nop>
inoremap <Del> <Nop>
inoremap <C-w> <Nop>
inoremap <C-h> <Nop>

augroup Vim
    autocmd! VimEnter *.vim nnoremap <leader>x :source ~/.config/nvim/init.vim<CR>
    autocmd! VimEnter *.vim nnoremap <leader>c :source %<CR>
augroup END

if g:colors_name != "gruvbox"
    hi ColorColumn    ctermbg=214
    hi Normal         ctermbg=234
    hi LineNr         ctermbg=233   ctermfg=251
    hi CursorLine     ctermbg=240                 cterm=none 
    hi CursorLineNr   ctermbg=237   ctermfg=9     cterm=none 
    hi Pmenu          ctermbg=237                 ctermfg=251
    hi Comment        ctermfg=248
endif
