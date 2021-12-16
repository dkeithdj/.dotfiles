local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local filename = {
  "filename",
  file_status = true, -- displays file status (readonly status, modified status)
  path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
}

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = { error = " ", warn = " ", info = " ", hint = " " },
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

lualine.setup({
  options = {
    theme = "auto",
    component_separators = "|",
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "NvimTree" },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", filename },
    lualine_c = { diagnostics },
    lualine_x = { fileformat, "encoding", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  -- extensions = { "fugitive" },
})
