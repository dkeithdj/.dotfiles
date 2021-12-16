local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {
  formatting.stylua.with({
    extra_args = { "--config-path", vim.fn.expand("~/.config/nvim/stylua.toml") },
  }),

  formatting.prettierd,
  diagnostics.eslint_d,
}

null_ls.setup({
  sources = sources,
})
