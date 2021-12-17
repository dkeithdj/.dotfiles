local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_indent_markers = 1

nvim_tree.setup{
  auto_close = true,
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
}

vim.cmd[[autocmd ColorScheme * highlight NvimTreeNormal guibg=none]]

