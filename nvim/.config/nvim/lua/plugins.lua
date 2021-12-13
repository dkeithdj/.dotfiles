-- Install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

vim.cmd(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost plugins.lua PackerCompile
  augroup end
]],
  false
)

return require("packer").startup({
  function(use)
    use("wbthomason/packer.nvim") -- Package manager

    use("nvim-lua/plenary.nvim")

    use({
      "kyazdani42/nvim-web-devicons",
      config = function()
        require("nvim-web-devicons").setup()
      end,
    })
    -- Colorsheme
    use("rose-pine/neovim")

    use({
      "nvim-lualine/lualine.nvim",
      config = function()
        require("config.lualine")
      end,
    })

    use({
      "akinsho/bufferline.nvim",
      config = function()
        require("config.bufferline")
      end,
    })

    use({
      "numToStr/Comment.nvim",
      config = function()
        require("config.comment")
      end,
    })
    use("mhartington/formatter.nvim")
    -- UI to select things (files, grep results, open buffers...)
    use({
      "nvim-telescope/telescope.nvim",
      config = function()
        require("config.telescope")
      end,
    })
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    -- surround
    use("tpope/vim-surround")

    -- Add indentation guides even on blank lines
    use({
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require("config.blankline")
      end,
    })
    -- Add git related info in the signs columns and popups
    use({
      "lewis6991/gitsigns.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      config = function()
        require("config.gitsigns")
      end,
    })

    -- Highlight, edit, and navigate code using a fast incremental parsing library
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require("config.treesitter")
      end,
    })
    -- Additional textobjects for treesitter

    use("nvim-treesitter/nvim-treesitter-refactor")
    use("nvim-treesitter/nvim-treesitter-textobjects")
    use("p00f/nvim-ts-rainbow")
    use("nvim-treesitter/playground")
    use("windwp/nvim-ts-autotag")
    use("JoosepAlviste/nvim-ts-context-commentstring")

    -- Lsp
    use({ "neovim/nvim-lspconfig", config = "require('lsp')" })

    use({
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-nvim-lsp",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "ray-x/cmp-treesitter",
      },
      config = function()
        require("lsp.completion")
      end,
    }) -- Autocompletion plugin
    use("L3MON4D3/LuaSnip") -- Snippets plugin
    use("onsails/lspkind-nvim")
    use("ray-x/lsp_signature.nvim")

    use({
      "folke/trouble.nvim",
      config = function()
        require("config.trouble")
      end,
    })

    use("jose-elias-alvarez/null-ls.nvim")
    -- use "b0o/schemastore.nvim"

    -- use {'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu',}

    -- This is just for JAVA
    -- use("RishabhRD/nvim-lsputils")
    -- use("RishabhRD/popfix")

    use("windwp/nvim-autopairs") -- auto close
    use("dstein64/vim-startuptime")

    -- use("williamboman/nvim-lsp-installer")
    use("mfussenegger/nvim-jdtls")

    use({
      "kyazdani42/nvim-tree.lua",
      config = function()
        require("config.nvim-tree")
      end,
    })

    use({
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup()
      end,
      event = "BufRead",
    })

    use({
      "filipdutescu/renamer.nvim",
      branch = "master",
      requires = { { "nvim-lua/plenary.nvim" } },
      config = function()
        require("config.renamer")
      end,
    })
    use({ "tpope/vim-rhubarb", opt = false }) -- Fugitive-companion to interact with github
    use({ "tpope/vim-fugitive", opt = false }) -- Git commands in nvim
  end,
  -- config = { compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua" },
})
-- unused -----------------------

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
