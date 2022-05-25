local M = {}

M.setup = function()
    local lsp_installer_servers = require "nvim-lsp-installer.servers"
    local _, requested_server = lsp_installer_servers.get_server "rust_analyzer"
    require("rust-tools").setup({
        tools = {
            autoSetHints = true,
            hover_with_actions = true,
            runnables = {
                use_telescope = true,
            },
        },
        server = {
            cmd_env = requested_server._default_options.cmd_env,
            on_attach = require("lvim.lsp").common_on_attach,
            on_init = require("lvim.lsp").common_on_init,
        },
    })
end

return M

