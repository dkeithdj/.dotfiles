-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- paste from outside vim

local map = vim.keymap.set

map("v", "<leader>p", '"_dP<CR>', {
  noremap = true,
  silent = true,
  desc = "Paste from outside vim",
})
map("n", "<leader>p", '"+p<CR>', {
  noremap = true,
  silent = true,
})

map("n", "<leader>p", '"0p', {
  noremap = true,
  silent = true,
  desc = "paste below current line",
})
map("n", "<leader>P", '"0P', {
  noremap = true,
  silent = true,
  desc = "paste on top of current line",
})

map("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
map("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
-- Change text without putting it into the vim register,
-- see https://stackoverflow.com/q/54255/6064933
map("n", "c", '"_c')
map("n", "C", '"_C')
map("n", "cc", '"_cc')
map("x", "c", '"_c')

map("n", "^", "g^")
map("n", "0", "g0")
map("x", "$", "g_")

map("n", "/", [[/\v]])

if vim.g.vscode then
  vim.cmd([[
  xmap gc  <Plug>VSCodeCommentary
  nmap gc  <Plug>VSCodeCommentary
  omap gc  <Plug>VSCodeCommentary
  nmap gcc <Plug>VSCodeCommentaryLine
  ]])

  map("n", "<Space>", ':call VSCodeNotify("whichkey.show")<CR>', {
    noremap = true,
    silent = true,
  })
  map("x", "<Space>", ':call VSCodeNotify("whichkey.show")<CR>', {
    noremap = true,
    silent = true,
  })

  map("n", "<leader>e", ':call VSCodeNotify("workbench.action.toggleSidebarVisibility")<CR>')
end
