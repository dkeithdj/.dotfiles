vim.cmd([[packadd packer.nvim]])

local present, packer = pcall(require, "dk.packerInit")

if present then
  packer = require("packer")
else
  return false
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local use = packer.use

return packer.startup(function()
  use({ "wbthomason/packer.nvim", opt = true }) -- Package manager

  local config = function(name)
    return string.format("require('dk.config.%s')", name)
  end

  local use_with_conf = function(repo, name)
    use({
      repo,
      -- config = function()
      config = config(name),
      -- end,
    })
  end

  -- Optimizations
  use({ "lewis6991/impatient.nvim" })
  use({ "nathom/filetype.nvim" })

  -- Used by alotta plugins
  use({ "nvim-lua/plenary.nvim", module = "plenary" })

  -- DISPLAY AND THEMES
  use({
    -- "rose-pine/neovim",
    "folke/tokyonight.nvim",
    config = function()
      require("dk.colors")
    end,
  })

  use({
    "kyazdani42/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup()
    end,
  })

  use_with_conf("kyazdani42/nvim-tree.lua", "nvim-tree")

  use_with_conf("rcarriga/nvim-notify", "notify")

  use({
    "nvim-lualine/lualine.nvim",
    event = "BufEnter",
    config = config("lualine"),
    disable = false,
  })
  use({
    "rebelot/heirline.nvim",
    event = "BufEnter",
    config = config("heirline"),
    disable = true,
  })

  use({
    "akinsho/bufferline.nvim",
    config = config("bufferline"),
    event = "BufReadPre",
    disable = false,
  })

  use({ "kazhala/close-buffers.nvim", cmd = "BDelete" })

  -- comments
  use({
    "numToStr/Comment.nvim",
    config = config("comment"),
    event = "BufRead",
  })

  use({
    "nvim-telescope/telescope.nvim",
    config = config("telescope"),
    cmd = "Telescope",
    wants = {
      "plenary.nvim",
      "telescope-fzf-native.nvim",
    },
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    },
  })

  -- Add indentation guides even on blank lines
  use({
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = config("blankline"),
  })
  -- Add git related info in the signs columns and popups
  use({
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = config("gitsigns"),
  })

  -- TREESITTER
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    opt = true,
    event = "BufRead",
    config = config("treesitter"),
    requires = {
      { "nvim-treesitter/playground", opt = true, cmd = "TSHighlightCaptureUnderCursor" },
      "nvim-treesitter/nvim-treesitter-refactor",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "RRethy/nvim-treesitter-textsubjects",
      "p00f/nvim-ts-rainbow",
      "windwp/nvim-ts-autotag",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  })

  -- LSP
  use({
    "neovim/nvim-lspconfig",
    opt = true,
    event = "BufReadPre",
    wants = {
      "nvim-lsp-installer",
      "null-ls.nvim",
    },
    config = config("lsp"),
    requires = {
      "williamboman/nvim-lsp-installer",
      "jose-elias-alvarez/null-ls.nvim",
      "jose-elias-alvarez/nvim-lsp-ts-utils",
    },
  })

  use({ "mfussenegger/nvim-jdtls", ft = "java" })

  use({
    "hrsh7th/nvim-cmp",
    event = "CursorHold",
    opt = true,
    config = config("lsp.completion"),
    wants = { "LuaSnip" },
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "ray-x/cmp-treesitter",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "saadparwaiz1/cmp_luasnip",
      {
        "L3MON4D3/LuaSnip",
        wants = "friendly-snippets",
      },
      {
        module = "nvim-autopairs",
        "windwp/nvim-autopairs",
        config = function()
          require("nvim-autopairs").setup()
        end,
      },
      "rafamadriz/friendly-snippets",
    },
  })

  use({
    "folke/trouble.nvim",
    event = "BufReadPre",
    config = config("trouble"),
    cmd = "Trouble",
    disable = true,
  })

  use({
    "filipdutescu/renamer.nvim",
    branch = "master",
    event = "InsertEnter",
    config = config("renamer"),
  })

  use({
    "akinsho/nvim-toggleterm.lua",
    keys = "<M-`>",
    config = config("terminal"),
  })

  use({
    "norcalli/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function()
      require("colorizer").setup()
    end,
  })

  use({
    "dstein64/vim-startuptime",
    config = function()
      vim.g.startuptime_tries = 10
    end,
    cmd = "StartupTime",
  })

  use({ "tpope/vim-surround", event = "BufReadPre", requires = { "tpope/vim-repeat" } })
  -- use({ "tpope/vim-repeat", event = "BufReadPre" })
  use({ "mbbill/undotree", cmd = "UndotreeToggle" })
  use({
    "ggandor/lightspeed.nvim",
    config = config("lightspeed"),
  })
end)
-- unused -----------------------

-- use({ "stevearc/dressing.nvim" })
-- use({ "MunifTanjim/nui.nvim" })

-- use({ "sainnhe/gruvbox-material" })
-- use({ "EdenEast/nightfox.nvim" })
-- use({ "eddyekofo94/gruvbox-flat.nvim" })
-- use({ "marko-cerovac/material.nvim" })
-- use({ "catppuccin/nvim" })

-- use({ "tami5/lspsaga.nvim" })
-- use({ "kosayoda/nvim-lightbulb" })
-- use({ "ray-x/lsp_signature.nvim" })
-- use({ "b0o/schemastore.nvim" })

-- use({ "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" })

-- This is just for JAVA
-- use({ "RishabhRD/nvim-lsputils" })
-- use({ "RishabhRD/popfix" })

-- use({ "tpope/vim-rhubarb", disable = false }) -- Fugitive-companion to interact with github
-- use({ "tpope/vim-fugitive", disable = false }) -- Git commands in nvim
-- use({
--   "noib3/nvim-cokeline",
--   config = function()
--     require("dk.config.cokeline")
--   end,
--   disable = true,
-- })
