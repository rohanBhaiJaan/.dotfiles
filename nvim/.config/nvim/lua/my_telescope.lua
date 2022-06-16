-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

map("n", "<C-F>", ":lua require('telescope.builtin').find_files(require('telescope.themes').get_ivy())<cr>", { noremap = true })
map("n", "<C-B>", ":lua require('telescope.builtin').buffers(require('telescope.themes').get_ivy())<cr>", { noremap = true })
map("n", "<C-P>", ":lua require('telescope.builtin').git_files(require('telescope.themes').get_ivy())<cr>", { noremap = true })
