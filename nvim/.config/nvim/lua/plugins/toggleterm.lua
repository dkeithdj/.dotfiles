local Util = require("lazyvim.util")
return {
  "akinsho/toggleterm.nvim",
  init = function()
    vim.keymap.set("t", "<ESC>", "<C-\\><C-n>", { noremap = true, silent = true })
  end,
  ---@type ToggleTermConfig
  opts = {
    shading_factor = 0.3, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
    direction = "float",
    persist_mode = false,
  },
  keys = {
    {
      "<leader>1",
      function()
        require("toggleterm").toggle(1, 0, Util.root.get(), "horizontal")
      end,
      desc = "Horizontal Terminal",
    },
    {
      "<leader>2",
      function()
        require("toggleterm").toggle(2, 0, Util.root.get(), "float")
      end,
      desc = "Floating Terminal 2",
    },
    {
      "<leader>3",
      function()
        require("toggleterm").toggle(3, 0, Util.root.get(), "float")
      end,
      desc = "Floating Terminal 3",
    },
    {
      "<leader>4",
      function()
        require("toggleterm").toggle(4, 0, Util.root.get(), "float")
      end,
      desc = "Floating Terminal 4",
    },
    {
      "<leader>5",
      function()
        require("toggleterm").toggle(5, 0, Util.root.get(), "float")
      end,
      desc = "Floating Terminal 5",
    },
    {
      "<leader>Tn",
      "<cmd>ToggleTermSetName<cr>",
      desc = "Set Terminal Name",
    },
    {
      "<leader>Ts",
      "<cmd>TermSelect<cr>",
      desc = "Select Terminal",
    },
  },
}
