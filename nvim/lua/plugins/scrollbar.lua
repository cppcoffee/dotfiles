return {
    'petertriho/nvim-scrollbar',
    event = 'VeryLazy',
    opts = function()
        local colors = require('tokyonight.colors').setup()
        return {
            exclude = {
                filetypes = { 'NvimTree', 'TelescopePrompt', 'chatgpt' },
            },
            marks = {
                Search = { highlight = { fg = colors.orange } },
                Error = { highlight = { fg = colors.error } },
                Warn = { highlight = { fg = colors.warning } },
                Info = { highlight = { fg = colors.info } },
                Hint = { highlight = { fg = colors.hint } },
                Misc = { highlight = { fg = colors.purple } },
            },
            scrollbar = {
                thumb = {
                    highlight = { bg = colors.bg_highlight },
                },
            },
        }
    end
}
