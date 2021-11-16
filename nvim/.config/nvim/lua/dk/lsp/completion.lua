-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'

-- local has_words_before = function()
--   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- end
vim.cmd [[autocmd ColorScheme * highlight CmpItemKind guifg=#8ec07c]]
vim.cmd [[autocmd ColorScheme * highlight CmpItemMenu guifg=#83a598]]

cmp.setup {
  completion = {
    completeopt = 'menuone,noinsert'
  },
  formatting = {
    format = require("lspkind").cmp_format({with_text = false, maxwidth = 50, menu = ({
      buffer = "[Buffer]",
      nvim_lsp = "[LSP]",
      treesitter = "[TSitter]",
      luasnip = "[LuaSnip]",
      path = "[Path]",
    })}),
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    -- ['<C-p>'] = cmp.mapping.select_prev_item(),
    -- ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<C-y>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },

    ["<Tab>"] = cmp.mapping(function(fallback)
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  documentation = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    maxwidth = 60,
    maxheight = 10,
  },
  experimental = {
    native_menu = false,
    ghost_text = true,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer', keyword_length = 5 },
    { name = 'treesitter'},
    { name = 'path' },
  },
}

require('nvim-autopairs').setup{}

require("nvim-autopairs.completion.cmp").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
  auto_select = true, -- automatically select the first item
})
