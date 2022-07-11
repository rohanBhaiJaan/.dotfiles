vim.cmd([[
    call plug#begin('~/.config/nvim/autoload')
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'ThePrimeagen/harpoon'
    Plug 'rohanBhaiJaan/be-vimmer.vim'
    Plug '~/projects/CP_setup.vim/'
    call plug#end()
]])

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.guicursor=""

vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.wrap = false

vim.opt.incsearch = true
vim.opt.inccommand = "split"
vim.opt.hlsearch = false

vim.opt.hidden = true
vim.opt.scrolloff = 10

vim.opt.termguicolors = true

vim.cmd("colorscheme tokyonight")

vim.g.mapleader = "\\"
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.be_vimmer_enable = 1
vim.g.be_vimmer_disable_backspace = 1


require("remaps");
