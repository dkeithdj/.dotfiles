return {
  "nvim-lualine/lualine.nvim",
  optional = true,
  event = "VeryLazy",
  opts = function(_, opts)
    local colors = {
      [""] = LazyVim.ui.fg("Special"),
      ["Warning"] = LazyVim.ui.fg("DiagnosticError"),
    }

    table.insert(opts.sections.lualine_x, 2, {
      function()
        local icon = require("lazyvim.config").icons.kinds.Copilot
        return icon
      end,
      cond = function()
        return #vim.lsp.get_clients({ bufnr = 0, name = "GitHub Copilot" }) > 0 or false
      end,
      color = function()
        local status = vim.g.copilot_enabled
        if not status then
          return colors["Warning"]
        end
        return colors[""]
      end,
    })
  end,
}
