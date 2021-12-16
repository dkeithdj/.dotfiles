local bufferline = require("bufferline")

vim.cmd([[
  nnoremap <silent><A-1> <Cmd>BufferLineGoToBuffer 1<CR>
  nnoremap <silent><A-2> <Cmd>BufferLineGoToBuffer 2<CR>
  nnoremap <silent><A-3> <Cmd>BufferLineGoToBuffer 3<CR>
  nnoremap <silent><A-4> <Cmd>BufferLineGoToBuffer 4<CR>
  nnoremap <silent><A-5> <Cmd>BufferLineGoToBuffer 5<CR>
  nnoremap <silent><A-6> <Cmd>BufferLineGoToBuffer 6<CR>
  nnoremap <silent><A-7> <Cmd>BufferLineGoToBuffer 7<CR>
  nnoremap <silent><A-8> <Cmd>BufferLineGoToBuffer 8<CR>
  nnoremap <silent><A-9> <Cmd>BufferLineGoToBuffer 9<CR>
]])

bufferline.setup{
  options = {
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end
  }
}
