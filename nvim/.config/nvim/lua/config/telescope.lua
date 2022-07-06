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
