-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'
local lspkind = require 'lspkind'

local border = {
  {"╭", "FloatBorder"},
  {"─", "FloatBorder"},
  {"╮", "FloatBorder"},
  {"│", "FloatBorder"},
  {"╯", "FloatBorder"},
  {"─", "FloatBorder"},
  {"╰", "FloatBorder"},
  {"│", "FloatBorder"},
}
-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
-- local has_words_before = function()
--   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- end

vim.cmd ([[
highlight! link CmpItemAbbrMatchFuzzy Aqua
highlight! link CmpItemKindText Fg
highlight! link CmpItemKindMethod Purple
highlight! link CmpItemKindFunction Purple
highlight! link CmpItemKindConstructor Green
highlight! link CmpItemKindField Aqua
highlight! link CmpItemKindVariable Blue
highlight! link CmpItemKindClass Green
highlight! link CmpItemKindInterface Green
highlight! link CmpItemKindValue Orange
highlight! link CmpItemKindKeyword Keyword
highlight! link CmpItemKindSnippet Red
highlight! link CmpItemKindFile Orange
highlight! link CmpItemKindFolder Orange
]])

cmp.setup {
  completion = {
    completeopt = 'menuone,noinsert'
  },
  formatting = {
    format = lspkind.cmp_format({with_text = false, maxwidth = 50, menu = ({
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
    { name = 'treesitter', keyword_length = 3},
    { name = 'path' },
  },
}

require('nvim-autopairs').setup{}

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
