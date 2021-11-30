--Install packer
require('dk.plugins.pack')

-- Options and Display settings
require('dk.options')

local map = vim.api.nvim_set_keymap
-- Remap space as leader key
map('', '<Space>', '<Nop>', {noremap = true, silent = true})
vim.g.mapleader = ' ' vim.g.maplocalleader = ' '

--Mappings
require('dk.mappings')

-- Autocmds
require('dk.autocmds')

-- colors
require('dk.colors')

-- Map blankline
require('dk.plugins.blankline')

-- Gitsigns
require('dk.plugins.gitsigns')

-- Telescope
require('dk.plugins.telescope')

-- Treesitter configuration
require('dk.plugins.treesitter')

-- LSP settings
require('dk.lsp')

-- lualine
require('dk.plugins.lualine')
-- bufferline
require('dk.plugins.bufferline')

-- Comment
require('dk.plugins.comment')

-- nvim-tree
require('dk.plugins.nvim-tree')
