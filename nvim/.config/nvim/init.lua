local map = vim.api.nvim_set_keymap
-- Remap space as leader key
map("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Options and Display settings
require "dk.options"

--Mappings
require "dk.mappings"

-- Autocmds
require "dk.autocmds"

-- colors
require "dk.colors"

-- LSP settings
require "dk.lsp"

-- plugins
require "dk.plugins"
