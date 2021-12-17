-- local map = vim.api.nvim_set_keymap

local map = require("dk.utils").mappings

--Remap space as leader key
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Remap for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Resize with arrows
map("n", "<C-Up>", ":resize +2<CR>")
map("n", "<C-Down>", ":resize -2<CR>")
map("n", "<C-Left>", ":vertical resize +2<CR>")
map("n", "<C-Right>", ":vertical resize -2<CR>")

-- nohl
map("n", "<leader>,", ":noh<CR>")

-- source neovim
map("n", "<leader>lo", ":luafile%<CR>")

-- paste from outside vim
map("v", "<leader>p", '"_dP')
map("n", "<leader>p", '"+p<CR>')

-- delete without adding to reg
map("v", "<leader>d", '"_d')

map("v", "<leader>y", '"+y')
map("n", "<leader>y", '"+y<CR>')
map("n", "<leader>Y", 'gg"+yG"<CR>')

-- indent
map("v", ">", ">gv")
map("v", "<", "<gv")

-- delete buffer
map("n", "<leader>br", ":bdelete<CR>")

--terminal settings
local terminal = "zsh" --choose terminal

map("n", "<leader>ot", ":vsplit term://" .. terminal .. "<CR>")
map("t", "<c-[>", "<c-\\><c-n>")

map("n", "<c-f>", ":silent !tmux neww tmux-sessionizer<CR>")

-- Telescope Mappings
map("n", "<leader>tb", [[:Telescope buffers<CR>]])
map("n", "<leader>tf", [[:Telescope find_files<CR>]])
map("n", "<leader>t.", [[:Telescope find_files hidden=true<CR>]])
map("n", "<leader>ta", [[:Telescope current_buffer_fuzzy_find<CR>]])
map("n", "<leader>th", [[:Telescope help_tags<CR>]])
map("n", "<leader>ts", [[:Telescope grep_string<CR>]])
map("n", "<leader>tr", [[:Telescope live_grep<CR>]])
map("n", "<leader>tp", [[:Telescope file_browser<CR>]])

map("n", "<leader>tc", [[:Telescope lsp_code_actions<CR>]])
map("n", "<leader>tC", [[:Telescope lsp_range_code_actions<CR>]])
map("n", "<leader>te", [[:Telescope diagnostics bufnr=0<CR>]])
map("n", "<leader>tE", [[:Telescope diagnostics<CR>]])

-- Nvim-Tree Mappings
map("n", "<leader>eo", ":NvimTreeToggle<CR>")
map("n", "<leader>ef", ":NvimTreeFindFile<CR>")

-- Renamer Mappings
map("n", "<leader>rn", ':lua require("renamer").rename()<CR>')
map("v", "<leader>rn", ':lua require("renamer").rename()<CR>')

-- Bufferline Mappings
for i = 1, 20 do
  map("n", ("<A-%s>"):format(i), (":BufferLineGoToBuffer %s<CR>"):format(i), { silent = true })
end
map("n", "<leader>bd", ':BufferLinePickClose<CR>')

-- unused -------------------------------

-- Cokeline Mappings
-- for i = 1, 9 do
--   map("n", ("<A-%s>"):format(i), ("<Plug>(cokeline-focus-%s)"):format(i), {silent = true})
-- end
-- map("n", "<A-n>", "<Plug>(cokeline-focus-next)", {silent = true})
-- map("n", "<A-p>", "<Plug>(cokeline-focus-prev)", {silent = true})
