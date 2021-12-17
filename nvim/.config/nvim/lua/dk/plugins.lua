local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

return packer.startup({
  function(use)
    use("wbthomason/packer.nvim") -- Package manager

    use({
      "lewis6991/impatient.nvim",
      config = function()
        require("impatient").enable_profile()
      end,
    })

    use("nvim-lua/plenary.nvim")

    -- DISPLAY AND THEMES
    use("rose-pine/neovim")
    use({
      "kyazdani42/nvim-web-devicons",
      config = function()
        require("nvim-web-devicons").setup()
      end,
    })
    use({
      "nvim-lualine/lualine.nvim",
      config = function()
        require("dk.config.lualine")
      end,
    })

    -- use({
    --   "noib3/nvim-cokeline",
    --   config = function()
    --     require("dk.config.cokeline")
    --   end,
    -- })

    use({
      "akinsho/bufferline.nvim",
      config = function()
        require("dk.config.bufferline")
      end,
    })

    use({
      "numToStr/Comment.nvim",
      config = function()
        require("dk.config.comment")
      end,
    })

    use({
      "nvim-telescope/telescope.nvim",
      config = function()
        require("dk.config.telescope")
      end,
    })
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

    -- Add indentation guides even on blank lines
    use({
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require("dk.config.blankline")
      end,
    })
    -- Add git related info in the signs columns and popups
    use({
      "lewis6991/gitsigns.nvim",
      config = function()
        require("dk.config.gitsigns")
      end,
    })

    -- TREESITTER
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require("dk.config.treesitter")
      end,
    })
    use("nvim-treesitter/nvim-treesitter-refactor")
    use("nvim-treesitter/nvim-treesitter-textobjects")
    use("p00f/nvim-ts-rainbow")
    use("nvim-treesitter/playground")
    use("windwp/nvim-ts-autotag")
    use("JoosepAlviste/nvim-ts-context-commentstring")

    -- LSP
    use({ "neovim/nvim-lspconfig", config = "require('dk.lsp')" })
    use("jose-elias-alvarez/null-ls.nvim")
    use("mfussenegger/nvim-jdtls")

    use({
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "ray-x/cmp-treesitter",
        "lukas-reineke/cmp-under-comparator",
      },
      config = function()
        require("dk.lsp.completion")
      end,
    })
    use("L3MON4D3/LuaSnip")
    use("rafamadriz/friendly-snippets")

    use({
      "filipdutescu/renamer.nvim",
      branch = "master",
      config = function()
        require("dk.config.renamer")
      end,
    })

    use({
      "kyazdani42/nvim-tree.lua",
      config = function()
        require("dk.config.nvim-tree")
      end,
    })

    use({
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup()
      end,
      event = "BufRead",
    })

    use("windwp/nvim-autopairs") -- auto close
    use("dstein64/vim-startuptime")
    use("tpope/vim-surround")

    -- Automatically set up configuration after cloning packer.nvim
    if PACKER_BOOTSTRAP then
      require("packer").sync()
    end
  end,
  config = {
    compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "rounded" })
      end,
    },
  },
})
-- unused -----------------------

-- use("williamboman/nvim-lsp-installer")
-- use 'stevearc/dressing.nvim'
-- use 'MunifTanjim/nui.nvim'

-- use("sainnhe/gruvbox-material")
-- use("EdenEast/nightfox.nvim")
-- use("eddyekofo94/gruvbox-flat.nvim")
-- use 'folke/tokyonight.nvim'
-- use 'marko-cerovac/material.nvim'
-- use 'catppuccin/nvim'

-- use 'tami5/lspsaga.nvim'
-- use 'kosayoda/nvim-lightbulb'
-- use("ray-x/lsp_signature.nvim")
-- use "b0o/schemastore.nvim"

-- use {'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu',}

-- This is just for JAVA
-- use("RishabhRD/nvim-lsputils")
-- use("RishabhRD/popfix")

-- use({ "tpope/vim-rhubarb", disable = false }) -- Fugitive-companion to interact with github
-- use({ "tpope/vim-fugitive", disable = false }) -- Git commands in nvim
-- use({
--   "folke/trouble.nvim",
--   config = function()
--     require("dk.config.trouble")
--   end,
--   disable = true,
-- })
