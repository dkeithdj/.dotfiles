-- local lsp_installer = require("nvim-lsp-installer")
                          local nvim_lsp = require "lspconfig"
local map = vim.api.nvim_buf_set_keymap

local null_ls = require "null-ls"

-- register any number of sources simultaneously
local sources = {
  -- null_ls.builtins.formatting.prettier,
  null_ls.builtins.formatting.stylua.with {
    extra_args = { "--config-path", vim.fn.expand "~/.config/stylua.toml" },
  },
  -- null_ls.builtins.diagnostics.luacheck
  -- null_ls.builtins.code_actions.gitsigns,
}

null_ls.config {
  sources = sources,
  debug = true,
}

local on_attach = function(_, bufnr)
  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap = true, silent = true }
  map(bufnr, "n", "<leader>sd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  map(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  map(bufnr, "n", "<leader>sg", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  map(
    bufnr,
    "n",
    "<leader>se",
    '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({border="double",focusable=false})<CR>',
    opts
  )
  map(bufnr, "n", "<leader>sn", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  map(bufnr, "n", "<leader>sp", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  vim.cmd [[ command! FormatIt execute 'lua vim.lsp.buf.formatting()' ]]
end

local servers = { "clangd", "pyright", "tsserver", "vimls", "cssls", "html", "bashls" }

-- User configurations for individual servers.
local configs = {}

-- User configurations for all servers.
local config_defaults = {
  capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
}

-- Setup configurations.
for _, lsp in ipairs(servers) do
  local config = configs[lsp] or {}
  config.on_attach = on_attach
  config.autostart = true
  config = vim.tbl_extend("keep", config, config_defaults)
  nvim_lsp[lsp].setup(config)
end

nvim_lsp["null-ls"].setup({
  autostart = true,
  on_attach = on_attach,
})

vim.cmd(
  [[
augroup lsp
au!
autocmd FileType java lua require'dk.lsp.java-config'.setup()
augroup end
  ]],
  false
)

-- custom server
local sumneko_root_path = vim.fn.stdpath "cache" .. "/lspconfig/sumneko_lua/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/Linux/lua-language-server"

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

nvim_lsp.sumneko_lua.setup {
  cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
  init_options = {
    formatting = true,
  },
  settings = {
    Lua = {
      diagnostics = {
        enable = true,
        globals = { "vim" },
      },
    },
  },
  on_attach = on_attach,
  capabilities = config_defaults.capabilities,
}
