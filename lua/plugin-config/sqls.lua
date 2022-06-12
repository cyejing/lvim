require('lspconfig').sqls.setup{
    on_attach = function(client, bufnr)
        require('sqls').on_attach(client, bufnr)
    end
}

-- require 'lspconfig'.sqls.setup {
    -- settings = {
        -- sqls = {
            -- connections = {
                -- {
                    -- driver = 'mysql',
                    -- dataSourceName = 'root:root@tcp(127.0.0.1:13306)/world',
                -- },
            -- },
        -- },
    -- },
-- }


