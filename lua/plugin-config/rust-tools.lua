local M = {}

M.setup = function()
    local rt = require("rust-tools")
    rt.setup({
        server = {
            on_attach = function(client, bufnr)
                local mappings = require("which-keys").rust_key_mappings()

                for key, remap in pairs(mappings) do
                    local opts = { buffer = bufnr, desc = remap[2], noremap = true, silent = true }
                    vim.keymap.set("n", key, remap[1], opts)
                end

                require("lvim.lsp").common_on_attach(client, bufnr)
            end,
            on_init = require("lvim.lsp").common_on_init,
            standalone = true,
        },
    })
end

return M
