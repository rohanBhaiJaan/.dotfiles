if has('syntax')
    syntax on
endif

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
set wildignore+=**/.git/*
set wildignore+=**/node_modules/*

" <ESC> IS RETURN WHEN ALT IS PRESSED
let mapleader = '\'
let g:netrw_winsize = 30
let g:netrw_banner = 0

let g:setup_change_to_current_file = 1

let g:lightline = { 'colorscheme': 'solarized', }
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 0

let g:be_vimmer_enable = 1
let g:be_vimmer_disable_backspace = 1
let g:be_vimmer_wait_time = 1000

nnoremap <leader>x :source $MYVIMRC<CR>

nnoremap <Plug>scroll <C-e>
nnoremap <ScrollWheelDown> <Plug>scroll
nnoremap <C-e> :Lex<CR>
nnoremap <C-p> :find<space>

nnoremap Y y$

filetype plugin on
set omnifunc=syntaxcomplete#Complete
set termguicolors

function! s:colorize() abort
    if exists("$g:colors_name") && g:colors_name == "pablo"
        hi Normal         ctermbg=234
        hi CursorLine     ctermbg=240 cterm=none
        hi CursorLineNr   ctermbg=237 cterm=none
        hi Pmenu          ctermbg=237 ctermfg=251
        hi PmenuSel       ctermbg=247 ctermfg=254
        hi ColorColumn    ctermbg=214 
        hi LineNr         ctermbg=233 ctermfg=251
        hi Comment        ctermfg=248
    endif
endfunction

" https://github.com/ghifarit53/tokyonight-vim
function! s:setcolorscheme() abort
    if match(&runtimepath, "tokyonight-vim") != -1
        colorscheme tokyonight
    else
        colorscheme pablo
        call s:colorize()
    endif
endfunction

function! s:cleanNoNameEmptyBuffers()
    let buffers = filter(range(1, bufnr('$')), 'buflisted(v:val) && empty(bufname(v:val)) && bufwinnr(v:val) < 0 && (getbufline(v:val, 1, "$") == [""])')
    if !empty(buffers)
        exe 'bd '.join(buffers, ' ')
    endif
endfunction

let &runtimepath .= ','.expand('$HOME').'/projects/CP_setup.vim/' 
let &runtimepath .= ','. expand('$HOME').'/projects/be-vimmer.vim/'

augroup ALL
    autocmd!
    autocmd FILETYPE * set nu rnu
    autocmd FileType vimwiki nnoremap <buffer> <leader>tl <Plug>VimwikiToggleListItem
    autocmd VimEnter * call s:setcolorscheme()
    autocmd BufEnter * call s:cleanNoNameEmptyBuffers()
augroup END
