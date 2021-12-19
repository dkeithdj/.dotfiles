local wezterm = require("wezterm")

local mappings = require("mappings")

local main = require("colors").main
local normal = require("colors").normal
local bright = require("colors").bright

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  return " " .. tab.active_pane.title .. " "
end)

return {
  enable_tab_bar = true,
  default_prog = { "pwsh.exe", "-NoLogo" },
  launch_menu = {
    { label = "WSL", args = { "wsl.exe", "~" } },
    { label = "PWSH", args = { "pwsh.exe", "-NoLogo" } },
  },

  font = wezterm.font("FantasqueSansMono Nerd Font"),
  font_size = 12.5,
  colors = {
    foreground = main.fg,
    background = main.bg,
    ansi = normal,
    brights = bright,
    cursor_bg = main.cursor,
  },
  -- window_background_image = "NewHorizonsResized.jpg",
  -- window_background_image_hsb = {
  --   brightness = 0.0,
  -- },
  mouse_bindings = mappings.mouse,
  leader = { key = "q", mods = "CTRL" },
  keys = mappings.key,

  window_padding = {left = 2, right = 1, top = 0, bottom = 1},
}
