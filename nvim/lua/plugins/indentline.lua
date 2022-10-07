require('indent_blankline').setup({
    char = '|',
    buftype_exclude = { 'terminal' },
    show_trailing_blankline_indent = false,
    use_treesitter = true,
    -- context indent highlighted
    space_char_blankline = ' ',
    show_current_context = true,
    show_current_context_start = true,
})
