local map = require("dk.utils").buf_mappings

require("jdtls.setup").add_commands()
require("dk.config.lsp.java-config").setup()
-- Java-specific
map("n", "<leader>jo", ':lua require"jdtls".organize_imports()<CR>')
map("n", "<leader>je", ':lua require("jdtls").extract_variable()<CR>')
map("v", "<leader>je", '<Esc>:lua require("jdtls").extract_variable(true)<CR>')
map("v", "<leader>jm", '<Esc>:lua require("jdtls").extract_method(true)<CR>')
