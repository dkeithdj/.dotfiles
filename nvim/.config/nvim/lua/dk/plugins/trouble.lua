local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

require('trouble').setup {
  use_lsp_diagnostic_signs = true -- enabling this will use the signs defined in your lsp client
}

map("n", "<leader>xx", "<cmd>Trouble<cr>", opts)
map("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>", opts)
map("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>", opts)
