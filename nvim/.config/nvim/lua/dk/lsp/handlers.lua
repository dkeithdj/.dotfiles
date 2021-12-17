local lsp_conf = {}

lsp_conf.setup = function()
  local lsp = vim.lsp
  local handlers = lsp.handlers

  -- Hover doc popup
  local max_width = math.max(math.floor(vim.o.columns * 0.7), 100)
  local max_height = math.max(math.floor(vim.o.lines * 0.3), 30)

  local popupOpts = {
    border = "rounded",
    max_width = max_width,
    max_height = max_height,
  }

  handlers["textDocument/hover"] = lsp.with(handlers.hover, popupOpts)
  handlers["textDocument/signatureHelp"] = lsp.with(handlers.signature_help, popupOpts)

  -- diagnostics settings
  vim.diagnostic.config({
    virtual_text = {
      prefix = "●",
      source = "always",
    },
    float = {
      border = popupOpts.border,
      focusable = false,
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
end

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
end

local function lsp_mappings()
  local map = require("dk.utils").buf_mappings
  map("n", "<leader>sd", ":lua vim.lsp.buf.definition()<CR>")
  map("n", "K", ":lua vim.lsp.buf.hover()<CR>")
  map("n", "<leader>sg", ":lua vim.lsp.buf.signature_help()<CR>")
  map("n", "<leader>se", ":lua vim.diagnostic.open_float()<CR>")
  map("n", "<leader>sn", ":lua vim.diagnostic.goto_next()<CR>")
  map("n", "<leader>sp", ":lua vim.diagnostic.goto_prev()<CR>")
  map("n", "<space>sf", ":lua vim.lsp.buf.formatting_seq_sync()<CR>")
  -- vim.cmd([[ command! FormatIt execute 'lua vim.lsp.buf.formatting()' ]])
end

lsp_conf.on_attach = function(client)
  lsp_mappings()
  lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

lsp_conf.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return lsp_conf
