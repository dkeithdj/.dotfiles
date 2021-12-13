-- local lsp_installer = require("nvim-lsp-installer")
local nvim_lsp = require("lspconfig")
local map = vim.api.nvim_buf_set_keymap

-- Hover doc popup
local max_width = math.max(math.floor(vim.o.columns * 0.7), 100)
local max_height = math.max(math.floor(vim.o.lines * 0.3), 30)

local handler = {
  border = "double",
  max_width = max_width,
  max_height = max_height,
}

local null_ls = require("null-ls")

-- register any number of sources simultaneously
local sources = {
  -- null_ls.builtins.formatting.prettier,
  null_ls.builtins.formatting.stylua.with({
    extra_args = { "--config-path", vim.fn.expand("~/.config/nvim/stylua.toml") },
  }),
  null_ls.builtins.formatting.prettierd.with({
    extra_args = { "--config", vim.fn.expand("~/.config/nvim/.prettierrc.json") },
  }),
  -- null_ls.builtins.diagnostics.eslint_d.with {
  --   extra_args = { "--config", vim.fn.expand "~/.config/nvim/.eslintrc.json" },
  -- },

  -- null_ls.builtins.diagnostics.luacheck
  -- null_ls.builtins.code_actions.gitsigns,
}

local on_attach = function(_, bufnr)
  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap = true, silent = true }
  map(bufnr, "n", "<leader>sd", ":lua vim.lsp.buf.definition()<CR>", opts)
  map(bufnr, "n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)
  map(bufnr, "n", "<leader>sg", ":lua vim.lsp.buf.signature_help()<CR>", opts)
  map(
    bufnr,
    "n",
    "<leader>se",
    ':lua vim.lsp.diagnostic.show_line_diagnostics({border="double",focusable=false})<CR>',
    opts
  )
  map(bufnr, "n", "<leader>sn", ":lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  map(bufnr, "n", "<leader>sp", ":lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  -- vim.cmd [[ command! FormatIt execute 'lua vim.lsp.buf.formatting()' ]]
  --       vim.cmd [[ command! FormatRange execute 'lua vim.lsp.buf.range_formatting()' ]]
  -- formatting
  if _.resolved_capabilities.document_formatting then
    map(bufnr, "n", "<space>sf", ":lua vim.lsp.buf.formatting_seq_sync()<CR>", opts)
  end
end

local servers = { "clangd", "pyright", "denols", "vimls", "cssls", "html", "jsonls", "bashls" }

-- User configurations for individual servers.
local configs = {
  cmd = { "clangd-12", "--background-index" },
  denols = {
    init_options = {
      lint = true,
      config = "./deno.json",
    },
  },
}

-- User configurations for all servers.
local config_defaults = {
  capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
}

-- Setup configurations.
for _, lsp in ipairs(servers) do
  local config = configs[lsp] or {}
  config.on_attach = on_attach
  config.autostart = true
  config.handlers = handler
  config = vim.tbl_extend("keep", config, config_defaults)
  nvim_lsp[lsp].setup(config)
end

null_ls.setup({
  sources = sources,
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
local sumneko_root_path = vim.fn.stdpath("cache") .. "/lspconfig/sumneko_lua/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/Linux/lua-language-server"

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

nvim_lsp.sumneko_lua.setup({
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
})
