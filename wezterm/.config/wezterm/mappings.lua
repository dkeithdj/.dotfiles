local map = {}

local wezterm = require("wezterm")
local action = wezterm.action

map.key = {

  -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
  { key = "a", mods = "LEADER|ALT", action = action({ SendString = "\x02" }) },
  { key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
  { key = "q", mods = "LEADER", action = action({ CloseCurrentTab = { confirm = true } }) },
  { key = "x", mods = "LEADER", action = action({ CloseCurrentPane = { confirm = true } }) },

  { key = "t", mods = "LEADER", action = "ShowLauncher" },
  { key = "h", mods = "LEADER", action = action({ ActivatePaneDirection = "Left" }) },
  { key = "j", mods = "LEADER", action = action({ ActivatePaneDirection = "Down" }) },
  { key = "k", mods = "LEADER", action = action({ ActivatePaneDirection = "Up" }) },
  { key = "l", mods = "LEADER", action = action({ ActivatePaneDirection = "Right" }) },

  { key = "H", mods = "LEADER|SHIFT", action = action({ AdjustPaneSize = { "Left", 5 } }) },
  { key = "J", mods = "LEADER|SHIFT", action = action({ AdjustPaneSize = { "Down", 5 } }) },
  { key = "K", mods = "LEADER|SHIFT", action = action({ AdjustPaneSize = { "Up", 5 } }) },
  { key = "L", mods = "LEADER|SHIFT", action = action({ AdjustPaneSize = { "Right", 5 } }) },
}

local tab_no = 0
for i = 1, 9 do
  table.insert(map.key, { key = ("%s"):format(i), mods = "LEADER", action = action({ ActivateTab = tab_no }) })
  table.insert(map.key, { key = ("%s"):format(i), mods = "ALT", action = "DisableDefaultAssignment" })
  tab_no = tab_no + 1
end

map.mouse = {
  { event = { Up = { streak = 1, button = "Left" } }, mods = "CTRL", action = "OpenLinkAtMouseCursor" },
}

return map
