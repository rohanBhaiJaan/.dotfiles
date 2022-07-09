local M = {}

function bind(mode, outer_opts)
    outer_opts = outer_opts or { noremap = true }
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force",
            outer_opts,
            opts or {}
        )
        vim.api.nvim_set_keymap(mode, lhs, rhs, opts);
    end
end

M.nmap = bind('n')
M.nnoremap = bind('n')
M.vnoremap = bind('v')
M.inoremap = bind('i')

return M
