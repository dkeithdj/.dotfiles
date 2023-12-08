return {
  "andweeb/presence.nvim",
  vscode = false,
  enabled = false,
  config = function()
    require("presence").setup({
      workspace_text = "Working on something",
    })
  end,
}
