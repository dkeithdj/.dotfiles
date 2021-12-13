-- require("lsp.completion")
require("lsp.languages")

local lsp = vim.lsp
local handlers = lsp.handlers

-- Hover doc popup
local max_width = math.max(math.floor(vim.o.columns * 0.7), 100)
local max_height = math.max(math.floor(vim.o.lines * 0.3), 30)

local popupOpts = {
  border = "double",
  max_width = max_width,
  max_height = max_height,
}

handlers["textDocument/hover"] = lsp.with(handlers.hover, popupOpts)
handlers["textDocument/signatureHelp"] = lsp.with(handlers.signature_help, popupOpts)

-- diagnostics settings
vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    source = "if_many",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
