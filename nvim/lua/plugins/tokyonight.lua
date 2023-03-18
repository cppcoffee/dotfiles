return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    init = function()
        vim.cmd([[colorscheme tokyonight]])
    end,
    opts = {
        style = 'moon',
        light_style = 'day'
    },
}
