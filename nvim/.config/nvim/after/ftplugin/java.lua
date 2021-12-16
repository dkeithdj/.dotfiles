local map = vim.api.nvim_buf_set_keymap
local opts = { noremap = true, silent = true }
local bufnr = 0

require("jdtls.setup").add_commands()
require("dk.lsp.java-config").setup()
-- Java-specific
map(bufnr, "n", "<leader>jo", ':lua require"jdtls".organize_imports()<CR>', opts)
map(bufnr, "n", "<leader>je", ':lua require("jdtls").extract_variable()<CR>', opts)
map(bufnr, "v", "<leader>je", '<Esc>:lua require("jdtls").extract_variable(true)<CR>', opts)
map(bufnr, "v", "<leader>jm", '<Esc>:lua require("jdtls").extract_method(true)<CR>', opts)
