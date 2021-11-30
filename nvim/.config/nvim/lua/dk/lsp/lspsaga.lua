local lspsaga = require('lspsaga')

lspsaga.init_lsp_saga {
  use_saga_diagnostic_sign = true,
  -- diagnostic sign
  error_sign = "",
  warn_sign = "",
  hint_sign = "",
  infor_sign = "",
  border_style = "round"
}
-- vim.cmd[[
--   highlight LspSagaDiagnosticBorder guifg=#ebdbb2 guibg=NONE
--   highlight LspSagaRenameBorder guifg=#ebdbb2 guibg=NONE
--   highlight LspSagaHoverBorder guifg=#ebdbb2 guibg=NONE
--   highlight LspSagaSignatureHelpBorder guifg=#ebdbb2 guibg=NONE
--   highlight LspSagaLspFinderBorder guifg=#ebdbb2 guibg=NONE
--   highlight LspSagaCodeActionBorder guifg=#ebdbb2 guibg=NONE
--   highlight LspSagaAutoPreview guifg=#ebdbb2 guibg=NONE
--   highlight LspSagaDefPreviewBorder guifg=#ebdbb2 guibg=NONE
--
--   highlight ProviderTruncateLine guifg=#a89984 guibg=NONE
--   highlight DiagnosticTruncateLine guifg=#a89984 guibg=NONE
--   highlight LspSagaDiagnosticTruncateLine guifg=#a89984 guibg=NONE
--   highlight LspSagaShTruncateLine guifg=#a89984 guibg=NONE
--   highlight LspSagaDocTruncateLine guifg=#a89984 guibg=NONE
--   highlight LspSagaCodeActionTruncateLine guifg=#a89984 guibg=NONE
-- ]]
