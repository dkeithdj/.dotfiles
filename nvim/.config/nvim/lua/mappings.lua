local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
--Remap for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- nohl
map("n", "<leader>,", ":noh<CR>", opts)

-- source neovim
map("n", "<leader>lo", ":luafile%<CR>", opts)

-- paste from outside vim
map("v", "<leader>p", '"_dP<CR>', opts)
map("n", "<leader>p", '"+p<CR>', opts)

-- delete without adding to reg
map("v", "<leader>d", '"_d', opts)

map("n", "<leader>y", '"+y<CR>', opts)
map("v", "<leader>y", '"+y<CR>', opts)
map("n", "<leader>Y", 'gg"+yG"<CR>', opts)

-- indent
map("v", ">", ">gv", opts)
map("v", "<", "<gv", opts)

-- delete buffer
map("n", "<leader>rb", ":bdelete<CR>", opts)

--terminal settings
local terminal = "zsh" --choose terminal

map("n", "<leader>ot", ":vsplit term://" .. terminal .. "<CR>", opts)
map("t", "<c-[>", "<c-\\><c-n>", opts)

map("n", "<c-f>", ":silent !tmux neww tmux-sessionizer<CR>", opts)
