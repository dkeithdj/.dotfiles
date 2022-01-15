local colorscheme = "tokyonight"

vim.g.tokyonight_style = "storm"
vim.g.tokyonight_transparent = false
vim.g.tokyonight_dark_sidebar = true
vim.g.tokyonight_dark_float = true
vim.g.tokyonight_hide_inactive_statusline = true
vim.g.tokyonight_sidebars = {
  "qf",
  "vista_kind",
  "terminal",
  "packer",
  "help",
  "Trouble",
  -- "Telescope",
  -- "LspInfo",
}
-- Set colorscheme after options
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("Colorscheme " .. colorscheme .. " not found\n going to defaults")
  return vim.cmd([[colorscheme default]])
end

-- UNUSED

-- vim.g.rose_pine_variant = "main"
-- vim.g.rose_pine_bold_vertical_split_line = false
-- vim.g.rose_pine_inactive_background = false
-- vim.g.rose_pine_disable_background = true
-- vim.g.rose_pine_disable_float_background = true
-- vim.g.rose_pine_disable_italics = true

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
