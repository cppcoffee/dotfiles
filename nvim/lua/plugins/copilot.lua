-- return {
--     'github/copilot.vim',
--     event = "InsertEnter",
--     init = function()
--         vim.g.copilot_no_tab_map = 1
--         vim.g.copilot_no_maps = 1
--         vim.g.copilot_assume_mapped = 1
--         vim.keymap.set("i", "<C-e>", "copilot#Accept()",
--             { noremap = true, silent = true, expr = true, replace_keycodes = false })
--     end,
-- }

return {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    opts = {
        nes = {
            enabled = false,
        },
        suggestion = {
            auto_trigger = true,
            keymap = {
                accept = '<C-e>',
                next = '<M-]>',
                prev = '<M-[>',
            }
        }
    }
}
