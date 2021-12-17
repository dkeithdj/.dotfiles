local M = {}
M.mappings = function(mode, lhs, rhs, opts)
  local options = opts or { noremap = true, silent = true }
  return vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

M.buf_mappings = function(mode, lhs, rhs, opts)
  local options = opts or { noremap = true, silent = true }
  return vim.api.nvim_buf_set_keymap(0, mode, lhs, rhs, options)
end

return M
