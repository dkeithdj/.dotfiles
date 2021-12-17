local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup({
  options = {
    numbers = function(opts)
      return string.format("%s|", opts.ordinal)
    end,
    buffer_close_icon = "",
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
    enforce_regular_tabs = true,
    show_buffer_close_icon = false,
    separator_style = "thin",
  },
})
