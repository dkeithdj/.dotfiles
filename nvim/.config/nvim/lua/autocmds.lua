-- Highlight on yank
vim.cmd(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank({timeout=150})
  augroup end
]],
  false
)


