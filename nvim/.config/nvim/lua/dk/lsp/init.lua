require('dk.lsp.completion')
require('dk.lsp.lspsaga')

-- local lsp_installer = require("nvim-lsp-installer")
local nvim_lsp = require('lspconfig')
local map = vim.api.nvim_buf_set_keymap

local on_attach = function(_, bufnr)

  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap = true, silent = true }
  map(bufnr, 'n', '<leader>sd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  map(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  map(bufnr, 'n', '<leader>sg', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  map(bufnr, 'n', '<leader>sr', '<cmd>Lspsaga rename<CR>', opts)
  map(bufnr, 'n', '<leader>sf', '<cmd>Lspsaga lsp_finder<CR>', opts)
  map(bufnr, 'n', '<leader>sc', '<cmd>Lspsaga code_action<CR>', opts)
  map(bufnr, 'v', '<leader>sc', '<C-U>Lspsaga range_code_action<CR>', opts)
  map(bufnr, 'n', '<leader>se', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)
  map(bufnr, 'n', '<leader>sp', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
  map(bufnr, 'n', '<leader>sn', '<cmd>Lspsaga diagnostic_jump_next()<CR>', opts)
  map(bufnr, 'n', '<leader>sl', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  map(bufnr, 'n', '<c-f>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', opts)
  map(bufnr, 'n', '<c-b>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', opts)

end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- lsp_installer.on_server_ready(function(server)
--     local opts = {
-- 		capabilities = capabilities,
--     on_attach = on_attach
-- 	}
--     server:setup(opts)
-- 	if server.name == "jdtls" then
-- 		vim.api.nvim_exec([[
-- 		  augroup lsp
-- 			au!
-- 			autocmd FileType java lua require'dk.lsp.java-config'.setup()
-- 		  augroup end
-- 		]], false)
-- 	end
--     vim.cmd [[ do User LspAttachBuffers ]]
-- end)

-- Enable the following language servers
local servers = {'pyright', 'tsserver', 'vimls', 'cssls', 'html', 'bashls'}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

vim.cmd([[
augroup lsp
au!
autocmd FileType java lua require'dk.lsp.java-config'.setup()
augroup end
  ]], false)

nvim_lsp.clangd.setup{
  cmd = {"clangd-12", "--background-index"},
  on_attach = on_attach,
  capabilities = capabilities
}
-- custom server
local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/Linux/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

nvim_lsp.sumneko_lua.setup{
  cmd = {sumneko_binary, "-E", sumneko_root_path .. '/main.lua'};
  init_options = {
    formatting = true,
  },
  settings = {
    Lua = {
      diagnostics = {
        enable = true,
        globals = { "vim" },
      },
    }
  },
  on_attach=on_attach,
  capabilities=capabilities
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = {
    prefix = '●', -- Could be '●', '▎', 'x'
  }
})

-- diagnostics settings
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = false,
  update_in_insert = false,
  severity_sort = true,
})
