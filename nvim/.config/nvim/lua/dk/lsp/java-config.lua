local M = {}
function M.setup()
  local jdtls = require("jdtls.setup")
  local lsp_handler = require("dk.lsp.handlers")

  local extendedClientCapabilities = require("jdtls").extendedClientCapabilities
  extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

  local root_markers = { "gradlew", "pom.xml", ".git" }
  local root_dir = jdtls.find_root(root_markers)
  local home = os.getenv("XDG_CACHE_HOME")
  local workspace_folder = home .. "/jdtls-workspace/".. vim.fn.fnamemodify(root_dir, ":p:h:t")

  local config = {
    cmd = {
      "launch_jdtls", workspace_folder
    },
    flags = {
      allow_incremental_sync = true,
    },
    capabilities = lsp_handler.capabilities,
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
    on_attach = lsp_handler.on_attach,
    autostart = true,
    root_dir = root_dir
  }

  require("jdtls").start_or_attach(config)
end

return M
