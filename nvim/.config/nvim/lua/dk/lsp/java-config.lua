local M = {}
function M.setup()
    -- require('jdtls').start_or_attach({
    --     cmd = {'java-lsp.sh', os.getenv('HOME') .. '/workspace/' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')},
    --     root_dir = require('jdtls.setup').find_root({'gradle.build', 'pom.xml', '.git'})
    -- })

    -- Utility servers
    local map = function(type, key, value)
        vim.api.nvim_buf_set_keymap(0, type, key, value, {noremap = true, silent = true});
    end
    map('n', 'ga', '<Cmd>lua require("jdtls").code_action()<CR>')
end

return M
