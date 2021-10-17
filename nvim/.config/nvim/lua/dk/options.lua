--Incremental live completion (note: this is now a default on master)
vim.o.inccommand = 'nosplit'

--Set highlight on search
vim.o.hlsearch = false

-- Set relative line number
vim.wo.relativenumber = true
--Make line numbers default
vim.wo.number = true

--Do not save when switching buffers (note: this is now a default on master)
vim.o.hidden = true

--Enable mouse mode
vim.o.mouse = 'a'

-- Don't show mode
vim.cmd[[ set noshowmode ]]

--Enable break indent
vim.o.breakindent = true

-- no swap file
vim.bo.swapfile = false
--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- let cmd height be 2 lines
-- vim.o.cmdheight = 2

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.expandtab = true
vim.bo.expandtab = true

-- Set where new splits will go
vim.o.splitright = true
vim.o.splitbelow = true

-- offset when scrolling
vim.o.scrolloff = 10

-- show minimum choices in a popup
vim.o.pumheight = 10

--providers DISABLED
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
--Decrease update time
vim.o.updatetime = 100
vim.wo.signcolumn = 'yes'

-- Display settings
--Set colorscheme (order is important here)
vim.o.termguicolors = true

vim.g.gruvbox_invert_selection = 1
vim.g.gruvbox_termcolors = 256

-- Set background transparent
vim.api.nvim_exec(
  [[
  augroup TransparentBG
    autocmd!
    autocmd ColorScheme * hi Normal guibg=none
  augroup end
  ]],
  false
)

vim.cmd [[colorscheme gruvbox]]

--Set statusbar
vim.g.lightline = {
  colorscheme = 'gruvbox',
  active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } },
  component_function = { gitbranch = 'fugitive#head' },
}
