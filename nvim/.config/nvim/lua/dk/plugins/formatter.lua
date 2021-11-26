local formatter = require('formatter')
local home = os.getenv("HOME")

formatter.setup{
  filetype = {
    java = {
      function ()
        return {
          exe = "java",
          -- Formatter uses '-' as stdin
					args = { "-jar", home .. "/.local/jars/google-java-format.jar", "-" },
          stdin = true
        }
      end
    },
    -- lua = {
			-- function()
				-- return {
					-- exe = "clang-format",
					-- args = { "-" },
					-- stdin = true,
				-- }
			-- end,
		-- },
  }
}

vim.api.nvim_exec(
	[[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.lua,*.java FormatWrite
augroup END
]],
	true
)
