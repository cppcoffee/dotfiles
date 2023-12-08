return {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead',
    main = "ibl",
    opts = {
        indent = {
            char = '|',
        },
        exclude = {
            buftypes = { 'terminal', 'NvimTree', 'nofile' },
        },
        -- show_trailing_blankline_indent = false,
        whitespace = {
            remove_blankline_trail = true,
        },
        -- use_treesitter = true,
        scope = {
            enabled = true,
        },
    },
}
