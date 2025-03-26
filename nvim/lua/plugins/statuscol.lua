return {
    'luukvbaal/statuscol.nvim',
    event = 'VeryLazy',
    opts = function()
        local builtin = require('statuscol.builtin')
        return {
            ft_ignore = {
                'NvimTree',
                'toggleterm',
            },
            bt_ignore = {
                'nofile',
                'terminal',
            },
            relculright = true,
            segments = {
                {
                    sign = { namespace = { "diagnostic/signs" }, maxwidth = 1, colwidth = 1, auto = true },
                    click = "v:lua.ScSa"
                },
                { text = { builtin.lnumfunc }, click = "v:lua.ScLa", },
                { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
                {
                    sign = { namespace = { 'gitsigns' }, maxwidth = 1, colwidth = 1, auto = true, },
                    click = 'v:lua.ScSa'
                },
                {
                    sign = { name = { ".*" }, maxwidth = 1, colwidth = 1 },
                    click = "v:lua.ScSa"
                },
            }
        }
    end
}
