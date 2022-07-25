local M = require("remaps.remap")
print("maps")

M.nnoremap("<Plug>scroll", "<C-e>")
M.nnoremap("<C-e>", "<cmd>Lex<Cr>")
M.nnoremap("<ScrollWheelDown>", "<Plug>scroll")

M.nnoremap("<C-F>", ":Telescope find_files<cr>")
M.nnoremap("<C-B>", ":Telescope buffers<cr>")
M.nnoremap("<C-P>", ":Telescope git_files<cr>")
M.nnoremap("<C-S>", ":Telescope live_grep<cr>")
