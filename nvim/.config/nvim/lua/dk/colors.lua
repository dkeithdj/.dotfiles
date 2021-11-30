-- Display settings
--Set colorscheme (order is important here)
vim.o.termguicolors = true

vim.g.gruvbox_material_diagnostic_text_highlight = 1
vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'
vim.g.gruvbox_material_transparent_background = 1
vim.g.gruvbox_material_enable_bold = 1

vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_ui_contrast = 'high'
vim.g.gruvbox_material_statusline_style = 'mix'
vim.g.gruvbox_material_visual = 'reverse'
vim.g.gruvbox_material_background = 'soft'
vim.g.gruvbox_material_palette = 'mix'
vim.o.background = 'dark'


vim.cmd[[colorscheme gruvbox-material]]

vim.cmd[[highlight! IndentBlanklineContextStart guisp=#00FF00 gui=NONE]]

vim.cmd[[highlight LineNrAbove guifg=#7c6f64 ]]
vim.cmd[[highlight LineNrBelow guifg=#7c6f64 ]]
vim.cmd[[highlight! link LineNr Orange ]]

vim.cmd[[highlight NormalFloat guibg=NONE]]
vim.cmd[[highlight PMenu guibg=NONE]]
