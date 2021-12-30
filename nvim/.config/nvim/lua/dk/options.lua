local options = {
  -- wildmode = "longest:full,full", -- commandline completion
  wildignore = { "node_modules", ".git" },
  -- inccommand = "nosplit",
  mouse = "a",
  signcolumn = "yes",

  formatoptions = "l",
  linebreak = true,
  -- clipboard = "unnamedplus",

  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  scrolloff = 6,
  sidescrolloff = 6,
  pumheight = 10,
  updatetime = 100,

  termguicolors = true,

  background = "dark",

  -- vim.opt.characters for after foldtext, eof, foldcolumn
  fillchars = "fold: ,foldclose:,foldopen:,foldsep: ,diff: ,eob: ",

  diffopt = "internal,filler,closeoff,algorithm:patience", -- Use patience algorithm for diffs

  whichwrap = "<,>,[,],h,l",
  -- iskeyword = "-",

  ttyfast = true,
  lazyredraw = true,

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

for k, v in pairs(options) do
  vim.opt[k] = v
end
-- Do not source the default filetype.vim
vim.g.did_load_filetypes = 1

vim.opt.shortmess:append("c")

-- DISABLED
local disabled_built_ins = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  "matchit",
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end

--providers DISABLED
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
