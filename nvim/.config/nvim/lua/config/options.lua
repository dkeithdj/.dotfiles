-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
local g = vim.g

vim.opt.updatetime = 50
vim.opt.clipboard = "unnamedplus"

-- To disable root detection set to just "cwd"
vim.g.root_spec = { ".git", "lsp", "cwd" }

if g.neovide then
  -- opt.guifont = "Hack Nerd Font:h12"
  opt.guifont = "FantasqueSansM Nerd Font:h12"
  g.neovide_refresh_rate = 120
  g.neovide_remember_window_size = true
  g.neovide_cursor_antialiasing = true
  g.neovide_input_macos_alt_is_meta = true
  g.neovide_input_use_logo = false
  g.neovide_padding_top = 0
  g.neovide_padding_bottom = 0
  g.neovide_padding_right = 0
  g.neovide_padding_left = 0
  g.neovide_floating_blur_amount_x = 3.0
  g.neovide_floating_blur_amount_y = 3.0
  g.neovide_floating_shadow = true
  g.neovide_floating_z_height = 40
  g.neovide_light_angle_degrees = 45
  g.neovide_light_radius = 10
  g.neovide_scroll_animation_length = 0.5
  g.neovide_scroll_animation_far_lines = 1
  vim.g.neovide_hide_mouse_when_typing = true
end
