-- Blankline settings
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_char_highlight = 'LineNr'
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_char = '¦'


require("indent_blankline").setup {
  show_end_of_line = true,
  show_current_context_start = true,
  show_current_context = true,
}
