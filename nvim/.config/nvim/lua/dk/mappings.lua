local map = require("dk.utils").mappings

-- do nothing mapping
map("n", "<Space>", "")
--Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Remap for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Resize with arrows
map("n", "<C-Up>", "<cmd>resize +2<CR>")
map("n", "<C-Down>", "<cmd>resize -2<CR>")
map("n", "<C-Left>", "<cmd>vertical resize +2<CR>")
map("n", "<C-Right>", "<cmd>vertical resize -2<CR>")

-- nohl
-- map("n", "<leader>,", "<cmd>noh<CR>")

-- source neovim
map("n", "<leader>lo", "<cmd>source%<CR>")

-- paste from outside vim
map("v", "<leader>p", '"_dP')
map("n", "<leader>p", '"+p<CR>')

-- delete without adding to reg
map("v", "<leader>d", '"_d')

map({ "v" }, "<leader>y", '"+y')
map("n", "<leader>Y", 'gg"+yG"<CR>')

-- indent
map("v", ">", ">gv")
map("v", "<", "<gv")

map("n", "<c-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Telescope Mappings
map("n", "<leader>tb", [[<cmd>Telescope buffers<CR>]])
map("n", "<leader>tf", [[<cmd>Telescope find_files<CR>]])
map("n", "<leader>t.", [[<cmd>Telescope find_files hidden=true<CR>]])
map("n", "<leader>ta", [[<cmd>Telescope current_buffer_fuzzy_find<CR>]])
map("n", "<leader>th", [[<cmd>Telescope help_tags<CR>]])
map("n", "<leader>ts", [[<cmd>Telescope grep_string<CR>]])
map("n", "<leader>tr", [[<cmd>Telescope live_grep<CR>]])

map("n", "<leader>tn", [[<cmd>Telescope notify<CR>]])

-- Trouble
-- map("n", "<leader>xx", "<cmd>Trouble<cr>")
-- map("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>")
-- map("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>")

-- Nvim-Tree Mappings
map("n", "<A-t>", "<cmd>NvimTreeToggle<CR>")
map("n", "<A-f>", "<cmd>NvimTreeFindFile<CR>")

-- Renamer Mappings
map({ "n", "v" }, "<leader>rn", require("renamer").rename)

-- Bufferline Mappings
for i = 1, 9 do
  map("n", ("<A-%s>"):format(i), ("<cmd>BufferLineGoToBuffer %s<CR>"):format(i), { silent = true })
end
map("n", "<leader>bd", "<cmd>BufferLinePickClose<CR>")
map("n", "<leader>bs", "<cmd>BufferLinePick<CR>")
map("n", "<A-l>", "<cmd>BufferLineCycleNext<CR>")
map("n", "<A-h>", "<cmd>BufferLineCyclePrev<CR>")
map("n", "<leader>br", "<cmd>BDelete this<CR>") -- delete buffer

-- since we lazy load packer.nvim, we need to load it when we run packer-related commands
vim.cmd([[silent! command PackerCompile lua require 'dk.plugins' require('packer').compile()]])
vim.cmd([[silent! command PackerInstall lua require 'dk.plugins' require('packer').install()]])
vim.cmd([[silent! command PackerStatus lua require 'dk.plugins' require('packer').status()]])
vim.cmd([[silent! command PackerSync lua require 'dk.plugins' require('packer').sync()]])
vim.cmd([[silent! command PackerUpdate lua require 'dk.plugins' require('packer').update()]])
-- unused -------------------------------
