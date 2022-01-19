local M = {}

local colors = require("tokyonight.colors").setup()

local DS = require("dk.utils").icons.diagnostic_signs

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand("%:p:h")
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

M.start_block = {
  function()
    return "▊"
  end,
  color = { fg = colors.blue, bg = colors.bg_dark }, -- Sets highlighting of component
  padding = { left = 0, right = 1 }, -- We don't need space before this
}
M.end_block = {
  function()
    return "▊"
  end,
  color = { fg = colors.blue, bg = colors.bg_dark }, -- Sets highlighting of component
  padding = { left = 1 },
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
M.align = {
  function()
    return "%="
  end,
}

M.mode = {
  "mode",
  -- mode component
  fmt = function(str)
    local mode_color = {
      n = colors.red,
      i = colors.green,
      v = colors.blue,
      [""] = colors.blue,
      V = colors.blue,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [""] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ["r?"] = colors.cyan,
      ["!"] = colors.red,
      t = colors.red,
    }
    -- auto change color according to neovims mode
    vim.api.nvim_command("hi! LualineMode guifg=" .. mode_color[vim.fn.mode()] .. " guibg=" .. colors.bg_dark)
    return "  " .. str:sub(1, 1)
  end,
  color = "LualineMode",
  padding = { right = 0, left = 1 },
}

M.branch = {
  "branch",
  color = { fg = colors.yellow, gui = "bold" },
}

-- cool function for progress
function M.progress()
  local current_line = vim.fn.line(".")
  local total_lines = vim.fn.line("$")
  local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index]
end

M.location = {
  "location",
  padding = 1,
}
-- FILES
M.filename = {
  "filename",
  cond = conditions.buffer_not_empty,
  symbols = {
    modified = " ✏️",
    readonly = "🔒",
  },
  color = { fg = colors.magenta },
}

M.fileformat = {
  "fileformat",
  symbols = {
    unix = "", -- e712
    dos = "", -- e70f
    mac = "", -- e711
  },
  color = { fg = colors.magenta },
}

-- LSP
function M.lsp_progress(_, is_active)
  if not is_active then
    return
  end
  local messages = vim.lsp.util.get_progress_messages()
  if #messages == 0 then
    return ""
  end
  -- dump(messages)
  local status = {}
  for _, msg in pairs(messages) do
    local title = ""
    if msg.title then
      title = msg.title
    end
    table.insert(status, (msg.percentage or 0) .. "%% " .. title)
  end
  local spinners = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
  local ms = vim.loop.hrtime() / 1000000
  local frame = math.floor(ms / 120) % #spinners
  return table.concat(status, "") .. " " .. spinners[frame + 1]
end

vim.cmd("au User LspProgressUpdate let &ro = &ro")

M.diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = { error = DS.error .. " ", warn = DS.warn .. " ", info = DS.info .. " ", hint = DS.hint .. " " },
  colored = true,
}

M.show_lsp = {
  function()
    local msg = "LSP"
    local clients = vim.lsp.get_active_clients()
    if next(clients) ~= nil then
      return msg
    end
    return ""

    -- local names = {}
    -- for _, server in ipairs(vim.lsp.buf_get_clients(0)) do
    --   table.insert(names, server.name)
    -- end

    -- return table.concat(names, " ")
    -- return msg
  end,
  icon = " ",
  color = { fg = colors.green, gui = "bold" },
}

return M
