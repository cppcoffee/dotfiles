local tree_cb = require('nvim-tree.config').nvim_tree_callback
require('nvim-tree').setup({
    view = {
        width = 35,
        side = 'left',
        mappings = {
            list = {
                { key = '<C-v>', cb = tree_cb('vsplit') },
                { key = '<C-s>', cb = tree_cb('split') },
                { key = 'v', cb = tree_cb('vsplit') },
                { key = 's', cb = tree_cb('split') },
                { key = '-', cb = '<Plug>(choosewin)' },
                { key = '<C-t>', cb = ':ToggleTerm<cr>' },
                { key = '<leader>-', cb = ':Chowcho<cr>' },
            },
        },
    },
    diagnostics = {
        enable = true,
        icons = {
            error = '',
            warning = '',
            info = '',
            hint = '',
        },
    },
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    update_focused_file = {
        enable = true,
    },
    renderer = {
        icons = {
            show = {
                git = true,
                folder = true,
                file = true,
                folder_arrow = true,
            },
            glyphs = {
                symlink = '',
                git = {
                    untracked = '?',
                },
                folder = {
                    arrow_open = '',
                    arrow_closed = '',
                    default = '',
                    open = '',
                },
            },
        },
        highlight_opened_files = 'icon',
    },
    -- auto_close = true,
    hijack_netrw = true,
    update_cwd = true,
    -- focus_tree = false,
    open_on_setup = true,
})

vim.api.nvim_create_autocmd('VimEnter', {
    callback = function()
        require('nvim-tree').toggle(false, true)
    end,
})
