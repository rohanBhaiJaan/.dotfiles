-- Functional wrapper for mapping custom keybindings
require('telescope').setup({
  defaults = {
    layout_strategy = 'bottom_pane',
    layout_config = {
        bottom_pane = {
          width = 0.9,
          height = 0.6,
          prompt_position = "bottom"
        }
      -- other layout configuration here
    },
    -- other defaults configuration here
  },
  -- other configuration values here
})

function map(mode, lhs, rhs, opts)
    vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

map("n", "<C-F>", ":Telescope find_files<cr>", { noremap = true })
map("n", "<C-B>", ":Telescope buffers<cr>", { noremap = true })
map("n", "<C-P>", ":Telescope git_files<cr>", { noremap = true })
