return {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    enabled = true,
    init = function()
        vim.diagnostic.config({
            virtual_text = true,
        })
    end,
    config = true
}
