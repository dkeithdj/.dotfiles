vim.cmd(
  [[
  augroup YankHighlight
    " autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank({timeout=150})
  augroup end
]],
  false
)

vim.cmd([[autocmd User TelescopePreviewerLoaded setlocal wrap]])

-- Set terminal wrap
vim.cmd([[ autocmd TermOpen * set wrap ]])
