local M = require("remaps.remap")

M.nnoremap("<C-F>", ":Telescope find_files<cr>")
M.nnoremap("<C-B>", ":Telescope buffers<cr>")
M.nnoremap("<C-P>", ":Telescope git_files<cr>")
