-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
  false
)

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
  use 'tpope/vim-fugitive' -- Git commands in nvim
  use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
  use 'numToStr/Comment.nvim'
  use 'mhartington/formatter.nvim'
  -- UI to select things (files, grep results, open buffers...)
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  -- surround
  use 'tpope/vim-surround'

  -- Colorsheme
  use 'sainnhe/gruvbox-material'
  use 'EdenEast/nightfox.nvim'
  use 'eddyekofo94/gruvbox-flat.nvim'

  use 'nvim-lualine/lualine.nvim'
  use {'akinsho/bufferline.nvim', requires = {'kyazdani42/nvim-web-devicons'} }

  -- Add indentation guides even on blank lines
  use 'lukas-reineke/indent-blankline.nvim'
  -- Add git related info in the signs columns and popups
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  -- Additional textobjects for treesitter
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'p00f/nvim-ts-rainbow'
  use 'nvim-treesitter/playground'
  use 'windwp/nvim-ts-autotag'
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Lsp
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'ray-x/cmp-treesitter'
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'onsails/lspkind-nvim'
  use 'ray-x/lsp_signature.nvim'

  use 'folke/trouble.nvim'

  use 'jose-elias-alvarez/null-ls.nvim'

  -- use {'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu',}

  -- This is just for JAVA
  use 'RishabhRD/nvim-lsputils'
  use 'RishabhRD/popfix'

  use 'windwp/nvim-autopairs' -- auto close
  use 'dstein64/vim-startuptime'

  use 'williamboman/nvim-lsp-installer'
  use 'mfussenegger/nvim-jdtls'

  use 'kyazdani42/nvim-tree.lua'

  use 'norcalli/nvim-colorizer.lua'

  use {
    'filipdutescu/renamer.nvim',
    branch = 'master',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use 'stevearc/dressing.nvim'
  use 'MunifTanjim/nui.nvim'

  -- unused -----------------------

  -- use 'tami5/lspsaga.nvim'
  -- use 'kosayoda/nvim-lightbulb'
end)
