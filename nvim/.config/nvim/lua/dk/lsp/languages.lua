-- local lsp_installer = require("nvim-lsp-installer")

local status_ok, nvim_lsp = pcall(require, "lspconfig")
if not status_ok then
  return
end

local lsp_handler = require("dk.lsp.handlers")

local servers = { "clangd", "pyright", "tsserver", "vimls", "cssls", "html", "jsonls", "bashls" }

-- User configurations for individual servers.
local configs = {
  clangd = {
    cmd = { "clangd-12", "--background-index" },
  },
  -- denols = {
  --   init_options = {
  --     lint = true,
  --     config = "./deno.json",
  --   },
  -- },
  tsserver = {
    on_attach = function(client)
      -- disable tsserver formatting, use diagnosticls
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
    end,
  },
}

-- User configurations for all servers.
local config_defaults = {
  capabilities = lsp_handler.capabilities,
}

-- Setup configurations.
for _, lsp in ipairs(servers) do
  local config = configs[lsp] or {}
  config.on_attach = lsp_handler.on_attach
  config.autostart = true
  -- config.handlers = handler
  config = vim.tbl_extend("keep", config, config_defaults)
  nvim_lsp[lsp].setup(config)
end

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
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
  on_attach = lsp_handler.on_attach,
  capabilities = lsp_handler.capabilities,
})
