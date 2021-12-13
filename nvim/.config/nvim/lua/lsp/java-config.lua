local M = {}
function M.setup()
  local map = vim.api.nvim_buf_set_keymap
  -- local jdtls_ui = require'jdtls.ui'

  -- function jdtls_ui.pick_one_async(items, _, _, cb)
  --   require'lsputil.codeAction'.code_action_handler(nil, items, nil, nil, cb)
  -- end

  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local on_attach = function(_, bufnr)
    require("jdtls.setup").add_commands()
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

    -- if _.resolved_capabilities.document_formatting then
    map(bufnr, "n", "<space>sf", ":lua vim.lsp.buf.formatting_seq_sync()<CR>", opts)
    -- end
    -- Java-specific
    map(bufnr, "n", "<leader>jc", ':lua require("jdtls").code_action()<CR>', opts)
    map(bufnr, "n", "<leader>jo", ':lua require"jdtls".organize_imports()<CR>', opts)
    map(bufnr, "n", "<leader>je", ':lua require("jdtls").extract_variable()<CR>', opts)
    map(bufnr, "v", "<leader>je", '<Esc>:lua require("jdtls").extract_variable(true)<CR>', opts)
    map(bufnr, "v", "<leader>jm", '<Esc>:lua require("jdtls").extract_method(true)<CR>', opts)
    map(bufnr, "n", "<leader>jcr", ':lua require("jdtls").code_action(false, "refactor")<CR>', opts)
  end

  local extendedClientCapabilities = require("jdtls").extendedClientCapabilities
  extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

  local config = {
    cmd = {
      "launch_jdtls",
    },
    flags = {
      allow_incremental_sync = true,
    },
    capabilities = capabilities,
    init_options = {
      extendedClientCapabilities = extendedClientCapabilities,
    },
    settings = {
      java = {
        signatureHelp = { enabled = true },
        contentProvider = { preferred = "fernflower" },
        completion = {
          favoriteStaticMembers = {
            "org.hamcrest.MatcherAssert.assertThat",
            "org.hamcrest.Matchers.*",
            "org.hamcrest.CoreMatchers.*",
            "org.junit.jupiter.api.Assertions.*",
            "java.util.Objects.requireNonNull",
            "java.util.Objects.requireNonNullElse",
            "org.mockito.Mockito.*",
          },
        },
      },
    },
    on_init = function(client)
      if client.config.settings then
        client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
      end
    end,
    autostart = true,
    root_dir = require("jdtls.setup").find_root({ ".git", "mvn", "gradlew" }),
  }
  config.on_attach = on_attach()

  require("jdtls").start_or_attach(config)
end

return M
