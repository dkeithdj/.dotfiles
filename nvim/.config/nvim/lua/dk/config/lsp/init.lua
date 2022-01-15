local lspH = require("dk.config.lsp.handlers")

lspH.setup()

local servers = {
  clangd = { cmd = { "clangd", "--background-index", "--clang-tidy" } },
  pyright = {},
  vimls = {},
  jsonls = {},
  bashls = {},
  sumneko_lua = {
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
          path = lspH.get_luajit_path(),
        },
        diagnostics = {
          enable = false,
          globals = { "vim" },
        },
        workspace = {
          library = {
            lspH.get_luajit_path(),
          },
        },
      },
    },
  },
  -- eslint = {
  --   settings = {
  --     format = { enable = true },
  --   },
  -- },
  tsserver = {
    init_options = require("nvim-lsp-ts-utils").init_options,
  },
  cssls = {},
  html = {},
}

local function on_attach(client, bufnr)
  require("dk.config.lsp.formatting").setup(client, bufnr)
  lspH.lsp_mappings()

  if client.name == "typescript" or client.name == "tsserver" then
    require("dk.config.lsp.ts-utils").setup(client)
  end
end

local capabilities = lspH.capabilities

local options = {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 200,
  },
}

require("dk.config.lsp.null-ls").setup(options)
require("dk.config.lsp.install").setup(servers, options)
