local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end
local vim = vim

vim.g.nvim_tree_root_folder_modifier = table.concat({ ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" })
vim.g.nvim_tree_window_picker_exclude = {
  filetype = { "notify", "packer", "qf" },
  buftype = { "terminal" },
}
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_indent_markers = 1

local DS = require("dk.utils").icons.diagnostic_signs

nvim_tree.setup({
  -- ignore_ft_on_setup = { "notify" },
  -- open_on_setup = true,

  auto_close = false,
  hijack_cursor = true,
  -- update_to_buf_dir = { enable = true, auto_open = true },
  view = {
    width = 30,
  },
  update_focused_file = { enable = true },
  diagnostics = {
    enable = false,
    icons = {
      hint = DS.hint,
      info = DS.info,
      warning = DS.warn,
      error = DS.error,
    },
  },
  git = {
    enable = false,
  },
})

vim.cmd([[autocmd ColorScheme * highlight NvimTreeNormal guibg=none]])
