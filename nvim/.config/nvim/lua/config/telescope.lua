local telescope = require("telescope")

telescope.setup({
  defaults = {
    prompt_prefix = "❯ ",
    selection_caret = "❯ ",
    sorting_strategy = "ascending",
    color_devicons = true,
    borderchars = { "═", "║", "═", "║", "╔", "╗", "╝", "╚" },
    layout_config = {
      prompt_position = "bottom",
      horizontal = {
        width_padding = 0.04,
        height_padding = 0.1,
        preview_width = 0.6,
      },
      vertical = {
        width_padding = 0.05,
        height_padding = 1,
        preview_height = 0.5,
      },
    },
    file_ignore_patterns = {
      "target",
      "node_modules",
    },
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
      },
    },
  },
  pickers = {
    lsp_code_actions = { theme = "cursor" },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    },
  },
})
-- load_extension, somewhere after setup function:
telescope.load_extension("fzf")

-- Telescope Mappings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- telescope
map("n", "<leader>tb", [[:lua require('telescope.builtin').buffers()<CR>]], opts)
map("n", "<leader>tf", [[:lua require('telescope.builtin').find_files()<CR>]], opts)
map("n", "<leader>t.", [[:lua require('telescope.builtin').find_files({hidden = true})<CR>]], opts)
map("n", "<leader>ta", [[:lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], opts)
map("n", "<leader>th", [[:lua require('telescope.builtin').help_tags()<CR>]], opts)
map("n", "<leader>ts", [[:lua require('telescope.builtin').grep_string()<CR>]], opts)
map("n", "<leader>tr", [[:lua require('telescope.builtin').live_grep()<CR>]], opts)
map("n", "<leader>tp", [[:lua require('telescope.builtin').file_browser()<CR>]], opts)

map("n", "<leader>tc", [[:lua require('telescope.builtin').lsp_code_actions()<CR>]], opts)
map("n", "<leader>tC", [[:lua require('telescope.builtin').lsp_range_code_actions()<CR>]], opts)
map("n", "<leader>tE", [[:lua require('telescope.builtin').lsp_workspace_diagnostics()<CR>]], opts)
map("n", "<leader>te", [[:lua require('telescope.builtin').lsp_document_diagnostics()<CR>]], opts)
-- map('n', '<leader>so', [[:lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], opts)
-- map('n', '<leader>?', [[:lua require('telescope.builtin').oldfiles()<CR>]], opts)
