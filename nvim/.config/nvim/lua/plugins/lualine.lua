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
      -- cond = function()
      --   if vim.g.copilot_enabled == nil then
      --     return false
      --   end
      --   return true
      -- end,
      -- cond = function()
      --   if vim.g.copilot_enabled ~= nil then
      --     return false
      --   end
      --   return true
      -- end,
      color = function()
        local status = (vim.g.copilot_enabled or 1) == 1
        if status then
          return colors["Warning"]
        end
        return colors[""]
      end,
    })
  end,
}
