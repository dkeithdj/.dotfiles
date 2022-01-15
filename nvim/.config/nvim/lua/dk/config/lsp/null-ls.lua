local M = {}

local nls = require("null-ls")

local fmt = nls.builtins.formatting
local dcs = nls.builtins.diagnostics
local ca = nls.builtins.code_actions
local cp = nls.builtins.completion

local nls_sources = {
  -- fmt.clang_format.with({
  --   extra_args = {"-style=",[["{BasedOnStyle: llvm, IndentWidth: 2}"]]}
  -- }),
  fmt.trim_whitespace.with({
    filetypes = { "text", "sh", "zsh", "toml", "make", "conf", "tmux" },
  }),
  fmt.stylua,
  fmt.prettierd,
  -- fmt.eslint_d,

  dcs.luacheck.with({
    extra_args = { "--globals", "vim", "--std", "luajit" },
  }),
  dcs.eslint_d,
  dcs.shellcheck,

  -- ca.eslint_d,
}

function M.setup(options)
  nls.setup({
    debounce = 200,
    sources = nls_sources,
    on_attach = options.on_attach,
  })
end

function M.has_formatter(ft)
  local sources = require("null-ls.sources")
  local available = sources.get_available(ft, "NULL_LS_FORMATTING")
  return #available > 0
end

return M
