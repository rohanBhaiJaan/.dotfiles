local M = require("remaps.remap")

-- See `:help vim.lsp.*` for documentation on any of the below functions

local opts = { silent = true }

M.nnoremap('<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
M.nnoremap('[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
M.nnoremap(']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
M.nnoremap('<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
M.nnoremap('<leader>d', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
M.nnoremap('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
M.nnoremap('gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
M.nnoremap('K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
M.nnoremap('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
M.nnoremap('<C-K>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
M.nnoremap('<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
M.nnoremap('<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
M.nnoremap('<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
M.nnoremap('<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
M.nnoremap('<leader>rm', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
M.nnoremap('<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
M.nnoremap('gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
M.nnoremap('<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
