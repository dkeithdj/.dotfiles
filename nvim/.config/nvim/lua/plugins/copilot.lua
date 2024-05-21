return {
  "github/copilot.vim",
  config = function()
    vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false,
    })

    vim.keymap.set("n", "<leader>ug", function()
      local notify = require("notify")
      vim.g.copilot_enabled = not vim.g.copilot_enabled

      if vim.g.copilot_enabled then
        notify("Copilot: Enabled", "info")
      else
        notify("Copilot: Disabled", "info")
      end
    end, { desc = "Toggle Copilot" })
    vim.g.copilot_no_tab_map = true
  end,
}
