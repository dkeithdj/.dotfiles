local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local c = require("dk.config.statusline.utils")

-- 258c, 2590, 2502
lualine.setup({
  options = {
    theme = "auto",
    -- component_separators = "|",
    -- section_separators = { left = "", right = "" },
    component_separators = "",
    section_separators = "",
    disabled_filetypes = { "NvimTree" },
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      c.start_block,
      c.mode,
      c.filename,
      c.diagnostics,
    },
    lualine_x = {
      c.lsp_progress,
      c.show_lsp,
      c.branch,
      c.fileformat,
      c.location,
      c.progress,
      c.end_block,
    },
    lualine_y = {},
    lualine_z = {},
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
