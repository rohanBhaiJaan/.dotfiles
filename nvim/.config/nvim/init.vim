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

lua <<EOF
require'lspconfig'.tsserver.setup{}
require'lspconfig'.clangd.setup{}

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'pyright', 'tsserver', 'vimls' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

EOF

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

nnoremap <leader>ed :lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <leader>jd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>jD :lua vim.lsp.buf.declaration()<CR>

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
