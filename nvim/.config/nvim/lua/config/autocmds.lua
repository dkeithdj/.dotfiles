-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local autocmd = vim.api.nvim_create_autocmd

-- prevent comment from being inserted when entering new line in existing comment
autocmd("BufEnter", {
  callback = function()
    -- allow <CR> to continue block comments only
    -- https://stackoverflow.com/questions/10726373/auto-comment-new-line-in-vim-only-for-block-comments
    vim.opt.comments:remove("://")
    vim.opt.comments:remove(":--")
    vim.opt.comments:remove(":#")
    vim.opt.comments:remove(":%")
  end,
})
