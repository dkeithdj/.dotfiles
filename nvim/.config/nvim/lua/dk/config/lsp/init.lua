local lspH = require("dk.config.lsp.handlers")

local servers = {
  pyright = {},
  vimls = {},
  cssls = {},
  html = {},
  jsonls = {},
  bashls = {},
  sumneko_lua = {
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
          path = lspH.get_luajit_path(),
        },
        completion = {
          autoRequire = false,
        },
        diagnostics = {
          enable = true,
          globals = { "vim" },
        },
        workspace = {
          library = {
            lspH.get_luajit_path(),
          },
        },
        telemetry = {
          enable = false,
        },
      },
    },
  },
  tsserver = {},
  clangd = {},
}

local function on_attach(client, bufnr)
  require("dk.config.lsp.formatting").setup(client, bufnr)
  lspH.lsp_mappings(bufnr)
end

local capabilities = lspH.capabilities

lspH.setup()

local options = {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
}

require("dk.config.lsp.null-ls").setup(options)
require("dk.config.lsp.install").setup(servers, options)
