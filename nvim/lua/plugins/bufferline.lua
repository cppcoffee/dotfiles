return {
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    enabled = true,
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    opts = {
        options = {
            diagnostics = 'nvim_lsp',
            indicator = {
                icon = '▎',
                style = 'icon',
            },
            show_buffer_icons = true,
            show_buffer_close_icons = true,
            show_close_icon = true,
            modified_icon = '✥',
            offsets = {
                { filetype = 'NvimTree', text = 'File Explorer', text_align = 'center', highlight = 'Directory' },
            },
        },
    }
}
