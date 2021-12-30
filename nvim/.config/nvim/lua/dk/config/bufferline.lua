local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end
local DS = require("dk.utils").icons.diagnostic_signs

local function diag_hl(type, gui)
  return {
    gui = gui or "italic,bold",
    guifg = {
      attribute = "fg",
      highlight = "Diagnostic" .. type,
    },
  }
end

local function diagnostics_indicator(count, level, diagnostics_dict, context)
  local icon = level:match("error") and DS.error
    or level:match("warning") and DS.warn
  return icon
end

local highlights = {
  error_diagnostic = diag_hl("Error"),
  error_diagnostic_selected = diag_hl("Error"),
  warning_diagnostic = diag_hl("Warn", "bold"),
  warning_diagnostic_selected = diag_hl("Warn", "bold"),
}

bufferline.setup({
  options = {
    numbers = function(opts)
      return string.format("%s:", opts.ordinal)
    end,
    modified_icon = "💾",
    max_name_length = 30,
    max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
    tab_size = 21,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = diagnostics_indicator,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
      },
    },
    -- enforce_regular_tabs = true,
    show_buffer_close_icons = false,
    separator_style = "thin",
    -- always_show_bufferline = false,
  },
  highlights = highlights,
})
