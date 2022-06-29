if has("syntax")
    syntax on
endif

call plug#begin('~/.config/nvim/autoload/')
Plug 'morhetz/gruvbox'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Plug 'preservim/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'ryanoasis/vim-devicons'

Plug 'preservim/tagbar'
Plug 'mattn/emmet-vim'
Plug 'vimwiki/vimwiki'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

" Plug 'junegunn/fzf'
" Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'
call plug#end()

lua require("my_lsp_config")

if match(&runtimepath, "telescope") != -1
    lua require("my_telescope")
elseif match(&runtimepath, "fzf") != -1
    source ~/.config/nvim/custom/fzf.vim
endif

lua require("my_tokyonight")

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

let mapleader ='\'
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:gruvbox_contrast_dark = "hard"

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Plug>scroll <C-e>
nnoremap <ScrollWheelDown> <Plug>scroll
nnoremap <C-e> :Lex<CR>

nnoremap <A-u> 1gt
nnoremap <A-i> 2gt
nnoremap <A-o> 3gt
nnoremap <A-p> 4gt

nnoremap - :vertical resize -5<CR>
nnoremap + :vertical resize +5<CR>

nnoremap gs :G<CR> 

nnoremap Y y$
nnoremap <F1> :TagbarToggle<CR>
nnoremap <leader>gvd :Gvdiffsplit

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
else
    hi visual cterm=none ctermbg=242
endif

source ~/.config/nvim/custom/CP.vim
source ~/.config/nvim/custom/nerdtree.vim

augroup TAB
    autocmd!
    autocmd BufEnter *.lua set tabstop=2 softtabstop=2 shiftwidth=2
augroup END
