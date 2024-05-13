return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  lazy = false,
  config = function()
    require("harpoon").setup({})

    local function toggle_telescope_with_harpoon(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = require("telescope.config").values.file_previewer({}),
          sorter = require("telescope.config").values.generic_sorter({}),
        })
        :find()
    end
    vim.keymap.set("n", "<M-h>", function()
      local harpoon = require("harpoon")
      toggle_telescope_with_harpoon(harpoon:list())
    end, { desc = "Open harpoon window" })
  end,
  keys = {
    {
      "<leader>a",
      function()
        require("harpoon"):list():add()
      end,
      desc = "Mark file with harpoon",
    },
    {
      "<M-a>",
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "Show harpoon marks",
    },

    {
      "<C-1>",
      function()
        require("harpoon"):list():select(1)
      end,
      desc = "Harpoon buffer 1",
    },
    {
      "<C-2>",
      function()
        require("harpoon"):list():select(2)
      end,
      desc = "Harpoon buffer 2",
    },
    {
      "<C-3>",
      function()
        require("harpoon"):list():select(3)
      end,
      desc = "Harpoon buffer 3",
    },
    {
      "<C-4>",
      function()
        require("harpoon"):list():select(4)
      end,
      desc = "Harpoon buffer 4",
    },
  },
}
