local map = vim.api.nvim_set_keymap

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
  extensions = {
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      }
    },
  -- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
}

-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

--Add leader shortcuts
map('n', '<leader>tb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
map('n', '<leader>tf', [[<cmd>lua require('telescope.builtin').find_files()<CR>]], { noremap = true, silent = true })
map('n', '<leader>t.', [[<cmd>lua require('telescope.builtin').find_files({hidden = true})<CR>]], { noremap = true, silent = true })
map('n', '<leader>ta', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })
map('n', '<leader>th', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true })
-- map('n', '<leader>st', [[<cmd>lua require('telescope.builtin').tags()<CR>]], { noremap = true, silent = true })
map('n', '<leader>ts', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true, silent = true })
map('n', '<leader>tr', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
-- map('n', '<leader>so', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], { noremap = true, silent = true })
-- map('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], { noremap = true, silent = true })
