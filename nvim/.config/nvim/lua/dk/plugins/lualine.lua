local lualine = require('lualine')

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox-material',
    component_separators = '|',
    section_separators = { left = '', right = '' },
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {{
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
    },
      {'diagnostics',
        sources = {"nvim_lsp"},
        diagnostics_color = {
          error = { fg = '#F2594B' },
          warn = { fg = '#e9b143' },
          info = { fg = '#80aa9e' },
          hint = { fg = '#b0b846' },
        },
        symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '},
        colored = true,
      },
    },
    lualine_x = {
      {
        'fileformat',
        symbols = {
          unix = '', -- e712
          dos = '', -- e70f
          mac = '', -- e711
        }
      },
      'encoding',
      'filetype'
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {{
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
    }},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  extensions = {'fugitive'}
}
