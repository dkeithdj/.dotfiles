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
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile profile=true
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
  use({ "nvim-lua/plenary.nvim" })

  -- DISPLAY AND THEMES
  use({ "rose-pine/neovim" })

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
  })

  use({
    "akinsho/bufferline.nvim",
    config = config("bufferline"),
    event = "BufEnter",
    disable = false,
  })

  -- comments
  use({
    "numToStr/Comment.nvim",
    config = config("comment"),
    event = "BufRead",
  })

  use({
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    config = config("telescope"),
  })
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

  -- Add indentation guides even on blank lines
  use({
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = config("blankline"),
  })
  -- Add git related info in the signs columns and popups
  use({
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    config = config("gitsigns"),
  })
  -- TREESITTER
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    event = "BufEnter",
    config = config("treesitter"),
  })
  use({ "nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter" })
  use({ "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" })
  use({ "p00f/nvim-ts-rainbow", after = "nvim-treesitter" })
  use({ "nvim-treesitter/playground", after = "nvim-treesitter" })
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })
  use({ "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" })

  -- LSP
  use({ "williamboman/nvim-lsp-installer" })
  use({
    "neovim/nvim-lspconfig",
    event = "BufRead",
    config = config("lsp"),
  })
  use({
    "jose-elias-alvarez/null-ls.nvim",
  })
  use({ "mfussenegger/nvim-jdtls", ft = "java" })

  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "ray-x/cmp-treesitter",
      "lukas-reineke/cmp-under-comparator",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    config = config("lsp.completion"),
  })
  use({ "L3MON4D3/LuaSnip" })
  use({ "rafamadriz/friendly-snippets" })

  use({
    "folke/trouble.nvim",
    config = config("trouble"),
    cmd = "Trouble",
    disable = false,
  })

  use({
    "filipdutescu/renamer.nvim",
    branch = "master",
    event = "InsertEnter",
    config = config("renamer"),
  })

  use({
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
    cmd = "ColorizerToggle",
  })

  use({
    "windwp/nvim-autopairs",
    event = "CursorHold",
    config = function()
      require("nvim-autopairs").setup()
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
    end,
  }) -- auto close

  use({
    "dstein64/vim-startuptime",
    config = function()
      vim.g.startuptime_tries = 10
    end,
    cmd = "StartupTime",
  })
  use({ "tpope/vim-surround", event = "CursorHold" })
end)
-- unused -----------------------

-- use({ "williamboman/nvim-lsp-installer" })
-- use({ "stevearc/dressing.nvim" })
-- use({ "MunifTanjim/nui.nvim" })

-- use({ "sainnhe/gruvbox-material" })
-- use({ "EdenEast/nightfox.nvim" })
-- use({ "eddyekofo94/gruvbox-flat.nvim" })
-- use({ "folke/tokyonight.nvim" })
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
