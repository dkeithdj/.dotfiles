local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end
local DS = require("dk.utils").icons.diagnostic_signs

local function lsp_progress(_, is_active)
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
    -- if msg.message then
    --   title = title .. " " .. msg.message
    -- end
    table.insert(status, (msg.percentage or 0) .. "%% " .. title)
  end
  local spinners = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
  local ms = vim.loop.hrtime() / 1000000
  local frame = math.floor(ms / 120) % #spinners
  return table.concat(status, "") .. " " .. spinners[frame + 1]
end

vim.cmd("au User LspProgressUpdate let &ro = &ro")

local filename = {
  "filename",
  file_status = true, -- displays file status (readonly status, modified status)
  path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
}

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = { error = DS.error .. " ", warn = DS.warn .. " ", info = DS.info .. " ", hint = DS.hint .. " " },
  colored = true,
}

local fileformat = {
  "fileformat",
  symbols = {
    unix = "", -- e712
    dos = "", -- e70f
    mac = "", -- e711
  },
}

-- 258c, 2590, 2502
lualine.setup({
  options = {
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "NvimTree" },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", filename },
    lualine_c = { diagnostics },
    lualine_x = { lsp_progress, fileformat, "encoding", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  -- extensions = { "nvim-tree" },
})
