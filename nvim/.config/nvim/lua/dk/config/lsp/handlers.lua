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

function L.lsp_mappings(bufnr)
  local map = require("dk.utils").buf_mappings
  map(bufnr, "n", "<leader>sd", ":lua vim.lsp.buf.definition()<CR>")
  map(bufnr, "n", "K", ":lua vim.lsp.buf.hover()<CR>")
  map(bufnr, "n", "<leader>sg", ":lua vim.lsp.buf.signature_help()<CR>")
  map(bufnr, "n", "<leader>se", ":lua vim.diagnostic.open_float()<CR>")
  map(bufnr, "n", "<leader>sn", ":lua vim.diagnostic.goto_next()<CR>")
  map(bufnr, "n", "<leader>sp", ":lua vim.diagnostic.goto_prev()<CR>")
  -- map(bufnr, "n", "<space>sf", ":lua vim.lsp.buf.formatting_seq_sync()<CR>")
  -- vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
end

function L.fmt_on_save(client)
  if client.resolved_capabilities.document_formatting then
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  end
end

function L.on_attach(client, bufnr)
  L.lsp_mappings(bufnr)
  L.fmt_on_save(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

L.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

---Make luajit runtime files discoverable to the server
function L.get_luajit_path()
  local luajit_path = vim.split(package.path, ";")
  table.insert(luajit_path, "lua/?.lua")
  table.insert(luajit_path, "lua/?/init.lua")
  return luajit_path
end

-- local null_ls_found
-- local use_null_ls = "null-ls"
-- local null_ls = require("null-ls")
-- local nls_info = require("null-ls.info")
-- function L.check_formatter()
--   for _, client in ipairs(vim.lsp.get_active_clients()) do
--     if client.name == use_null_ls then
--       null_ls_found = true
--       print("it here")
--     end
--   end

--   local nls_sources = {}
--   for _, name in ipairs(null_ls.get_sources()) do
--     table.insert(nls_sources, name.name)
--   end

--   if null_ls_found then
--     print("checking")
--     for _, value in pairs(nls_info.get_active_sources()) do
--       if vim.tbl_contains(nls_sources, value.name) then
--         print("yep")
--       end
--     end
--   end
-- end

return L
