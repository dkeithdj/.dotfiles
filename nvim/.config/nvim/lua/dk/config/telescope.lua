local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local themes = require("telescope.themes")
local action_layout = require("telescope.actions.layout")

local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

-- https://github.com/nvim-telescope/telescope.nvim/issues/1048
local telescope_custom_actions = {}

function telescope_custom_actions._multiopen(prompt_bufnr, open_cmd)
  local picker = action_state.get_current_picker(prompt_bufnr)
  local num_selections = #picker:get_multi_selection()
  if not num_selections or num_selections <= 1 then
    actions.add_selection(prompt_bufnr)
  end
  actions.send_selected_to_qflist(prompt_bufnr)
  vim.cmd("silent cfdo " .. open_cmd)
end

function telescope_custom_actions.multi_selection_open(prompt_bufnr)
  telescope_custom_actions._multiopen(prompt_bufnr, "edit")
end

local blank_borders = { " ", " ", " ", " ", " ", " ", " ", " " }

local tel_setup = {
  defaults = {
    prompt_prefix = "🔍 ",
    selection_caret = "❯ ",
    -- sorting_strategy = "ascending",
    path_display = { shorten = 3 },
    -- color_devicons = true,
    preview = { msg_bg_fillchar = "░" },
    dynamic_preview_title = true,
    -- border = false,
    borderchars = blank_borders,
    cache_picker = {
      num_pickers = 20,
    },
    layout_strategy = "horizontal",
    layout_config = {
      -- width = 0.95,
      -- height = 0.85,
      -- prompt_position = "bottom",
      horizontal = {
        width = 0.95,
        height = 0.85,
        preview_width = function(_, cols, _)
          if cols > 200 then
            return math.floor(cols * 0.4)
          else
            return math.floor(cols * 0.6)
          end
        end,
      },

      vertical = {
        width = 0.7,
        height = 0.95,
        preview_height = 0.3,
      },
    },
    -- borderchars = { "═", "║", "═", "║", "╔", "╗", "╝", "╚" },
    file_ignore_patterns = {
      "target",
      "node_modules",
    },
    mappings = {
      i = {
        ["<M-p>"] = action_layout.toggle_preview,
        ["<M-m>"] = action_layout.toggle_mirror,
        ["<M-y>"] = telescope_custom_actions.multi_selection_open,
      },
      n = {
        ["<M-y>"] = telescope_custom_actions.multi_selection_open,
      },
    },
  },
  -- pickers = {},
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    },
  },
}

local M = {}

function M.setup()
  telescope.setup(tel_setup)
end

M.setup()

-- load_extension, somewhere after setup function:
telescope.load_extension("fzf")
telescope.load_extension("notify")

vim.cmd([[highlight link TelescopeTitle Todo ]])
vim.cmd([[highlight link TelescopePromptNormal DiffAdd ]])
vim.cmd([[highlight link TelescopePromptBorder DiffAdd ]])
vim.cmd([[highlight link TelescopePreviewNormal DiffChange ]])
vim.cmd([[highlight link TelescopePreviewBorder DiffChange ]])
vim.cmd([[highlight link TelescopeResultsBorder DiffAdd ]])

function M.lsp_code_actions()
  local opts = themes.get_dropdown({
    winblend = 10,
    -- border = false,
    borderchars = blank_borders,
    previewer = false,
    -- shorten_path = false,
  })
  require("telescope.builtin").lsp_code_actions(opts)
end

function M.lsp_definitions()
  local opts = {
    winblend = 10,
    -- layout_config = {
    --   preview_width = 0.5,
    --   width = 0.92,
    -- },
    path_display = { "shorten" },
  }
  -- local opts = themes.get_dropdown({
  --   borderchars = blank_borders,
  --   height = 0.5,
  -- })
  require("telescope.builtin").lsp_definitions(opts)
end

return M
