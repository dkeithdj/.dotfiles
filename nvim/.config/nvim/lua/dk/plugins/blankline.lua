-- Blankline settings
require("indent_blankline").setup {
  show_end_of_line = true,
  show_current_context_start = true,
  show_current_context = true,
  buftype_exclude = { 'terminal', 'nofile'},
  filetype_exclude = { 'help', 'packer' },
  show_trailing_blankline_indent = false,
  use_treesitter = true,
  char = '¦',
}
