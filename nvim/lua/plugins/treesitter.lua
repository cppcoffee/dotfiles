local parsers = {
    'c', 'lua', 'rust', 'go', 'python', 'zig', 'markdown', 'vim',
}

return {
    -- main branch: master is frozen, see https://github.com/nvim-treesitter/nvim-treesitter
    -- nvim-treesitter does not support lazy-loading
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    dependencies = {
        'nvim-treesitter/nvim-treesitter-context',
    },
    config = function()
        require('nvim-treesitter').install(parsers)

        -- highlighting and folds are provided by Neovim itself now
        vim.api.nvim_create_autocmd('FileType', {
            callback = function()
                if not pcall(vim.treesitter.start) then
                    return
                end
                vim.wo.foldmethod = 'expr'
                vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
            end,
        })
    end,
}
