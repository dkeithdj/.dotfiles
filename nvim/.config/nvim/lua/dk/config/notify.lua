local status_ok, notify = pcall(require, "notify")
if not status_ok then
  return
end

vim.opt.termguicolors = true

local DS = require("dk.utils").icons.diagnostic_signs

-- local api = vim.api
-- local namespace = api.nvim_create_namespace("nvim-notify")

notify.setup({
  -- Animation style (see below for details)
  stages = "fade",

  -- Function called when a new window is opened, use for changing win settings/config
  -- on_open = nil,

  -- Function called when a window is closed
  -- on_close = nil,

  -- Render function for notifications. See notify-render()
  render = "default",

  -- render = function(bufnr, notif, highlights)
  --   api.nvim_buf_set_lines(bufnr, 0, -1, false, notif.message)

  --   api.nvim_buf_set_extmark(bufnr, namespace, 0, 0, {
  --     hl_group = highlights.icon,
  --     end_line = #notif.message - 1,
  --     end_col = #notif.message[#notif.message],
  --   })
  -- end,

  -- Default timeout for notifications
  timeout = 100,

  -- For stages that change opacity this is treated as the highlight behind the window
  -- Set this to either a highlight group or an RGB hex value e.g. "#000000"
  -- background_colour = "#191724",

  -- Minimum width for notification windows
  minimum_width = 10,

  keep = false,

  -- Icons for the different levels
  icons = {
    ERROR = DS.error .. " ",
    WARN = DS.warn .. " ",
    INFO = DS.info .. " ",
    DEBUG = " ",
    TRACE = " ",
  },
})

vim.notify = notify
