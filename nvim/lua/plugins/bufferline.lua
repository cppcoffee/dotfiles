return {
    'akinsho/bufferline.nvim',
    enabled = true,
    opts = {
        options = {
            show_buffer_icons = true,
            diagnostics = 'nvim_lsp',
            indicator = {
                icon = '▎',
                style = 'icon',
            },
            -- show_buffer_close_icons = false,
            modified_icon = '✥',
            offsets = {
                { filetype = 'NvimTree', text = 'File Explorer', text_align = 'center', highlight = 'Directory' },
            },
        },
    }
}
