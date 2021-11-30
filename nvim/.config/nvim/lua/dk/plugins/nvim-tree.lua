vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_indent_markers = 1

vim.cmd([[
  nnoremap <leader>eo :NvimTreeToggle<CR>
  nnoremap <leader>ef :NvimTreeFindFile<CR>
]])

require('nvim-tree').setup{
  auto_close = true,
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
}
