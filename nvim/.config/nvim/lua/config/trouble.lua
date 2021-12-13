local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

require('trouble').setup {
  use_diagnostic_signs = true -- enabling this will use the signs defined in your lsp client
}

map("n", "<leader>xx", ":Trouble<cr>", opts)
map("n", "<leader>xw", ":Trouble lsp_workspace_diagnostics<cr>", opts)
map("n", "<leader>xd", ":Trouble lsp_document_diagnostics<cr>", opts)
