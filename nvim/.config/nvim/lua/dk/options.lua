local options = {
  wildignore = "**/node_modules/*",
  inccommand = "nosplit",
  mouse = "nv",
  signcolumn = "yes",
  -- clipboard = "unnamedplus",

  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  scrolloff = 10,
  pumheight = 10,
  updatetime = 100,

  relativenumber = true,
  number = true,
  cursorline = true,
  hlsearch = false,
  hidden = true,
  breakindent = true,
  swapfile = false,
  undofile = true,
  ignorecase = true,
  smartcase = true,
  autoindent = true,
  expandtab = true,
  splitright = true,
  splitbelow = true,
  showmode = false,
}

--providers DISABLED
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
--Decrease update time

for k, v in pairs(options) do
  vim.opt[k] = v
end
-- Set terminal wrap
vim.cmd([[ au TermOpen * set wrap ]])
