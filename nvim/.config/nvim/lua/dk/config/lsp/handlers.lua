local L = {}

function L.setup()
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

  local DS = require("dk.utils").icons.diagnostic_signs
  local signs = {
    Error = DS.error,
    Warn = DS.warn,
    Hint = DS.hint,
    Info = DS.info,
  }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  -- diagnostics settings
  vim.diagnostic.config({
    virtual_text = {
      prefix = "●",
      -- source = "if_many",
    },
    float = {
      border = popupOpts.border,
      focusable = false,
      source = "always",
    },
    signs = { active = signs },
    underline = true,
    update_in_insert = false,
    severity_sort = true,
  })
end

local tel = require("dk.config.telescope")

function L.lsp_mappings(bufnr)
  local map = require("dk.utils").buf_mappings
  map(bufnr, "n", "K", vim.lsp.buf.hover)
  map(bufnr, "n", "<leader>sg", vim.lsp.buf.signature_help)
  map(bufnr, "n", "<A-e>", vim.diagnostic.open_float)
  map(bufnr, "n", "<A-n>", vim.diagnostic.goto_next)
  map(bufnr, "n", "<A-p>", vim.diagnostic.goto_prev)

  map(bufnr, "n", "<A-d>", tel.lsp_definitions)
  map(bufnr, "n", "<leader>te", [[<cmd>Telescope diagnostics bufnr=0<CR>]])
  map(bufnr, "n", "<leader>tE", [[<cmd>Telescope diagnostics<CR>]])
  map(bufnr, "n", "<leader>tc", tel.lsp_code_actions)
  -- map("n", "<space>sf", vim.lsp.buf.formatting_seq_sync)
  -- vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
end

function L.fmt_on_save(client)
  if client.resolved_capabilities.document_formatting then
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  end
end

function L.on_attach(client)
  L.lsp_mappings()
  L.fmt_on_save(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local cmp_nvim_lsp = require("cmp_nvim_lsp")
L.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

---Make luajit runtime files discoverable to the server
function L.get_luajit_path()
  local luajit_path = vim.split(package.path, ";")
  table.insert(luajit_path, "lua/?.lua")
  table.insert(luajit_path, "lua/?/init.lua")
  return luajit_path
end

return L
