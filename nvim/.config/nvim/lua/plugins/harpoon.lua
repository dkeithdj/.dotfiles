return {
  "theprimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  vscode = false,
  opt = true,
  config = function()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "Add file to Harpoon" })
    vim.keymap.set("n", "<leader>ht", ui.toggle_quick_menu, { desc = "Toggle Harpoon" })
  end,
}
