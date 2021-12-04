-- Display settings
--Set colorscheme (order is important here)
vim.o.termguicolors = true

vim.o.background = 'dark'

-- vim.g.gruvbox_flat_style = "hard"
-- vim.g.gruvbox_transparent = true


-- vim.cmd[[
--   colorscheme gruvbox-flat
-- ]]
local nightfox = require('nightfox')


nightfox.setup({
  fox = 'duskfox',
  transparent = true,
  alt_nc = true,
  terminal_colors = false,
  inverse = {
    match_paren = true,
    visual = true,
    search = true,
  },
  hlgroups = {
    NvimTreeNormal = {bg = "NONE"},
    NormalFloat = {bg = "NONE"},
    -- Visual = {bg = "#38313D"}
    -- PMenu = {bg = "NONE"},
  }
})

nightfox.load()

-- print("color")
-- print(NFcolors.red)
-- vim.cmd[[autocmd ColorScheme * highlight NormalFloat guibg=NONE]]
-- vim.cmd[[autocmd ColorScheme * highlight PMenu guibg=NONE]]
