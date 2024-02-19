return {
    'luukvbaal/statuscol.nvim',
    event = 'VeryLazy',
    opts = function()
        local builtin = require('statuscol.builtin')
        return {
            relculright = true,
            segments = {
                {
                    sign = { name = { "Diagnostic" }, maxwidth = 1, auto = true },
                    click = "v:lua.ScSa"
                },
                { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
                { text = { builtin.lnumfunc }, click = "v:lua.ScLa", },
                {
                    text = { ' ' },
                    condition = {
                        function(args)
                            local buf = vim.api.nvim_get_current_buf()
                            local filetype = vim.api.nvim_buf_get_option(buf, 'filetype')
                            return vim.api.nvim_get_current_win() == args.win
                                and filetype ~= 'NvimTree'
                                and filetype ~= 'toggleterm'
                        end,
                    },
                },
                {
                    sign = { name = { 'GitSigns' }, maxwidth = 1, colwidth = 1, auto = true },
                    click = 'v:lua.ScSa'
                },
                {
                    sign = { name = { ".*" }, maxwidth = 1, colwidth = 1, auto = true, wrap = true },
                    click = "v:lua.ScSa"
                },
            }
        }
    end
}
