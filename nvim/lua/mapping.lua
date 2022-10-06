local map = require('utils').map

-- Key bindings
map('', '<c-a>', 'ggVG$"+y')

map('v', '<c-c>', '"+y')
map('v', '<tab>', '>gv')
map('v', '<s-tab>', '<gv')

map('i', '<c-b>', '<c-o>b')
map('i', '<c-f>', '<c-o>l')
map('i', '<c-h>', '<c-o>h')
map('i', '<c-l>', '<c-o>l')
map('i', '<c-j>', '<c-o>j')
map('i', '<c-k>', '<c-o>k')

map('c', '<c-h>', '<Left>')
map('c', '<c-l>', '<Right>')
map('c', '<c-b>', '<Left>')
map('c', '<c-f>', '<Right>')

-- map('n', '<leader>w', ':w<CR>')
-- map('n', '<leader>c', ':close<CR>')
-- map('n', '<leader>t', ':NvimTreeToggle<CR>')
-- map('n', '<leader>h', '<c-w><Left>')
-- map('n', '<leader>l', '<c-w><Right>')
