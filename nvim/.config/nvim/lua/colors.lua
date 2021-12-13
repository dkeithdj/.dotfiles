-- Display settings
--Set colorscheme (order is important here)
vim.o.termguicolors = true

vim.o.background = "dark"

-- vim.g.gruvbox_flat_style = "hard"
-- vim.g.gruvbox_transparent = true

-- vim.cmd[[
--   colorscheme gruvbox-flat
-- ]]
-- rose-pine
vim.g.rose_pine_variant = "main"

vim.g.rose_pine_bold_vertical_split_line = false
vim.g.rose_pine_inactive_background = false
vim.g.rose_pine_disable_background = true
vim.g.rose_pine_disable_float_background = true
vim.g.rose_pine_disable_italics = true

local p = require("rose-pine.palette")
vim.g.rose_pine_colors = {
  punctuation = p.subtle,
  comment = p.subtle,
  hint = p.iris,
  info = p.foam,
  warn = p.gold,
  error = p.love,

  -- -- Or set all headings to one colour: `headings = p.text`
  -- headings = {
  -- 	h1 = p.iris,
  -- 	h2 = p.foam,
  -- 	h3 = p.rose,
  -- 	h4 = p.gold,
  -- 	h5 = p.pine,
  -- 	h6 = p.foam,
  -- },
}

-- Set colorscheme after options
vim.cmd("colorscheme rose-pine")

-- nightfox
-- local nightfox = require('nightfox')

-- nightfox.setup({
--   fox = 'duskfox',
--   transparent = true,
--   alt_nc = true,
--   terminal_colors = false,
--   inverse = {
--     match_paren = true,
--     visual = false,
--     search = true,
--   },
--   hlgroups = {
--     NvimTreeNormal = {bg = "NONE"},
--     NormalFloat = {bg = "NONE"},
--     -- Visual = {bg = "#38313D"}
--     -- PMenu = {bg = "NONE"},
--   }
-- })

-- nightfox.load()
-- vim.cmd[[highlight VisualNOS guibg=NONE]]
-- vim.cmd[[highlight Visual gui=reverse]]
vim.cmd([[highlight CursorLine guibg=#403d52]])
vim.cmd([[highlight IncSearch gui=underline,reverse]])
vim.cmd([[highlight PMenu guibg=NONE]])
vim.cmd([[highlight NormalFloat guibg=NONE]])
