vim.g.local_history_width = 35
vim.g.local_history_new_change_delay = 10


-- ui
require('onedark').setup {
    style = 'light',
    toggle_style_key = '<leader>t', -- Default keybinding to toggle
    toggle_style_list = { 'light', 'darker' }, -- List of styles to toggle between
}

-- require("dap-install").config("codelldb", {})


require('lspconfig').sqls.setup {
    on_attach = function(client, bufnr)
        require('sqls').on_attach(client, bufnr)
    end
}

-- require('lspconfig').jdtls.setup {
--     use_lombok_agent = true,
-- }

