local map = vim.api.nvim_set_keymap

--Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- nohl
map('n', '<leader>,', '<cmd>noh<CR>',{ noremap = true, silent = true })

-- paste from outside vim
map('v', '<leader>p', '"_dP<CR>',{ noremap = true, silent = true })
map('n', '<leader>p', '"+p<CR>',{ noremap = true, silent = true })

-- Y yank until the end of line  (note: this is now a default on master)
map('n', 'Y', 'y$', { noremap = true })

-- Access terminal
map('n', '<leader>y', '"+y<CR>', { noremap = true, silent = true })
map('n', '<leader>Y', 'gg"+yG"<CR>',{ noremap = true, silent = true })

--terminal settings
local terminal = 'zsh' --choose terminal

map('n', '<leader>ot', '<cmd>vsplit term://' .. terminal .. '<CR>',{ noremap = true, silent = true })
map('t', '<c-[>', '<c-\\><c-n>',{ noremap = true, silent = true })
