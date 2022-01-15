local cmp_status_ok, cmp = pcall(require, "cmp")

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not (cmp_status_ok or snip_status_ok) then
  vim.notify(cmp)
end

require("luasnip/loaders/from_vscode").load()

local cmp_kinds = require("dk.utils").icons.cmp_kinds

cmp.setup({
  completion = {
    completeopt = "menuone,noinsert,menu",
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    -- with_text = false,
    maxwidth = 50,
    format = function(entry, vim_item)
      vim_item.kind = string.format(
        "%s ",
        cmp_kinds[vim_item.kind]
        -- vim_item.kind
      )
      -- Source
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        buffer = "[Buffer]",
        path = "[Path]",
        treesitter = "[TSitter]",
        emoji = "[Emoji]",
      })[entry.source.name]
      return vim_item
    end,
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = {
    -- ['<C-p>'] = cmp.mapping.select_prev_item(),
    -- ['<C-n>'] = cmp.mapping.select_next_item(),
    ["<C-k>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-j>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-e>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),

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
    border = "rounded",
    maxwidth = 60,
    maxheight = 10,
  },
  experimental = {
    native_menu = false,
    ghost_text = true,
  },
  sources = {
    { name = "nvim_lsp", priority = 5 },
    { name = "luasnip" },
    { name = "buffer", keyword_length = 5 },
    { name = "path" },
    { name = "treesitter", keyword_length = 3 },
    { name = "emoji" },
    { name = "nvim_lsp_signature_help" },
  },
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

vim.cmd([[highlight! CmpDocumentationBorder guibg=NONE]])
