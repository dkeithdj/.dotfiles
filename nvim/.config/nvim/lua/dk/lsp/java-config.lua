local M = {}
function M.setup()

  vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
  vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler

  local map = vim.api.nvim_buf_set_keymap
  local jdtls_ui = require'jdtls.ui'

  function jdtls_ui.pick_one_async(items, _, _, cb)
    require'lsputil.codeAction'.code_action_handler(nil, items, nil, nil, cb)
  end

  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local on_attach = function(_, bufnr)
    require('jdtls.setup').add_commands()
  local opts = { noremap = true, silent = true }
    map(bufnr, 'n', '<leader>sd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    map(bufnr, 'n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)
    map(bufnr, 'n', '<leader>sg', '<cmd>Lspsaga signature_help<CR>', opts)
    map(bufnr, 'n', '<leader>srn', '<cmd>Lspsaga rename<CR>', opts)
    map(bufnr, 'n', '<leader>sre', '<cmd>Lspsaga lsp_finder<CR>', opts)
    map(bufnr, 'n', '<leader>sld', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)
    map(bufnr, 'n', '<leader>sp', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
    map(bufnr, 'n', '<leader>sn', '<cmd>Lspsaga diagnostic_jump_next()<CR>', opts)
    map(bufnr, 'n', '<leader>sl', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    -- Java-specific
    map(bufnr, 'n', '<leader>jca', '<Cmd>lua require("jdtls").code_action()<CR>', opts)
    map(bufnr, 'n', '<leader>joi', '<Cmd>lua require"jdtls".organize_imports()<CR>', opts)
    map(bufnr, 'n', '<leader>jev', '<Cmd>lua require("jdtls").extract_variable()<CR>', opts)
    map(bufnr, 'v', '<leader>jev', '<Esc><Cmd>lua require("jdtls").extract_variable(true)<CR>', opts)
    map(bufnr, 'v', '<leader>jem', '<Esc><Cmd>lua require("jdtls").extract_method(true)<CR>', opts)
    map(bufnr, 'n', '<leader>jcr', '<Cmd>lua require("jdtls").code_action(false, "refactor")<CR>', opts)
  end

  local extendedClientCapabilities = require'jdtls'.extendedClientCapabilities
  extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

  local config = {
    cmd = {
      'launch_jdtls'
    },
    flags = {
      allow_incremental_sync = true,
    },
    capabilities = capabilities,
    init_options = {
      extendedClientCapabilities = extendedClientCapabilities,
    },
    settings = {
      java = {signatureHelp = {enabled = true},
        contentProvider = {preferred = 'fernflower'},
        completion = {
          favoriteStaticMembers = {
            'org.hamcrest.MatcherAssert.assertThat',
            'org.hamcrest.Matchers.*',
            'org.hamcrest.CoreMatchers.*',
            'org.junit.jupiter.api.Assertions.*',
            'java.util.Objects.requireNonNull',
            'java.util.Objects.requireNonNullElse',
            'org.mockito.Mockito.*',
          }
        },
      },
    },
    on_init = function(client)
      if client.config.settings then
        client.notify('workspace/didChangeConfiguration', {settings = client.config.settings})
      end
    end,
    autostart = true,
    root_dir = require('jdtls.setup').find_root({'.git', 'mvn', 'gradlew'})
  }
  config.on_attach = on_attach()

  require('jdtls').start_or_attach(config)


  local border_chars = {
    TOP_LEFT = '╭',
    TOP_RIGHT = '╮',
    MID_HORIZONTAL = '─',
    MID_VERTICAL = '│',
    BOTTOM_LEFT = '╰',
    BOTTOM_RIGHT = '╯',
   }

  vim.g.lsp_utils_codeaction_opts = {
    list = {
      border = true,
      border_chars = border_chars
    },
    preview = {
      title = 'Code Action',
      border = true,
      border_chars = border_chars
    },
  }

  vim.g.lsp_utils_location_opts = {
    height = 24,
    mode = 'split',
    list = {
      border = true,
      numbering = true,
    },
    preview = {
      title = 'Location Preview',
      border = true,
      border_chars = border_chars
    },
  }

  vim.g.lsp_utils_symbols_opts = {
    height = 24,
    mode = 'editor',
    list = {
      border = true,
      numbering = false,
    },
    preview = {
      title = 'Symbols Preview',
      border = true,
      border_chars = border_chars
    },
    prompt = {}
  }

end

return M
