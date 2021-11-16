local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
--Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- nohl
map('n', '<leader>,', '<cmd>noh<CR>',opts)

-- source neovim
map('n', '<leader>[', '<cmd>luafile init.lua<CR>',opts)

-- paste from outside vim
map('v', '<leader>p', '"_dP<CR>',opts)
map('n', '<leader>p', '"+p<CR>',opts)


-- Y yank until the end of line  (note: this is now a default on master)
map('n', 'Y', 'y$', { noremap = true })

map('n', '<leader>y', '"+y<CR>', opts)
map('v', '<leader>y', '"+y<CR>', opts)
map('n', '<leader>Y', 'gg"+yG"<CR>',opts)

--terminal settings
local terminal = 'zsh' --choose terminal

map('n', '<leader>ot', '<cmd>vsplit term://' .. terminal .. '<CR>',opts)
map('t', '<c-[>', '<c-\\><c-n>',opts)
