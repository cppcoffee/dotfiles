return {
    'luukvbaal/statuscol.nvim',
    event = 'VeryLazy',
    opts = function()
        local builtin = require('statuscol.builtin')
        return {
            relculright = true,
            segments = {
                { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
                {
                    sign = { name = { "Diagnostic" }, maxwidth = 1, auto = true },
                    click = "v:lua.ScSa"
                },
                { text = { builtin.lnumfunc }, click = "v:lua.ScLa", },
                {
                    sign = { name = { 'GitSigns' }, maxwidth = 1, colwidth = 1, auto = true },
                    click = 'v:lua.ScSa'
                },
                {
                    sign = { name = { ".*" }, maxwidth = 2, colwidth = 1, auto = true, wrap = true },
                    click = "v:lua.ScSa"
                },
            }
        }
    end
}
