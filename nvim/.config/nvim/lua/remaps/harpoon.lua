require('harpoon').setup({})
local M = require("remaps.remap")
M.nnoremap('<leader>ha', ':lua require("harpoon.mark").add_file()<Cr>')
M.nnoremap('<leader>hp', ':lua require("harpoon.ui").nav_prev()<Cr>')
M.nnoremap('<leader>hn', ':lua require("harpoon.ui").nav_next()<Cr>')
M.nnoremap('<leader>hq', ':lua require("harpoon.ui").toggle_quick_menu()<Cr>')
