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

vim.g.mapleader = "\\"
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.be_vimmer_enable = 1
vim.g.be_vimmer_disable_backspace = 1

vim.opt.runtimepath:append(vim.fn.expand('$HOME') .. '/projects/CP_setup.vim/')
vim.opt.runtimepath:append(vim.fn.expand('$HOME') .. '/projects/be-vimmer.vim/')

vim.cmd("colorscheme tokyonight")

require("remaps");

vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use {
    'folke/tokyonight.nvim',
    branch = 'main'
  }
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    cmd = 'TSUpdate'
  }
  use 'ThePrimeagen/harpoon'
end)

