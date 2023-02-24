local M = {}

M.setup = function()
    local rt = require("rust-tools")
    rt.setup({
        -- tools = {
        --     executor = require("rust-tools/executors").termopen, -- can be quickfix or termopen
        --     reload_workspace_from_cargo_toml = true,
        --     inlay_hints = {
        --         auto = true,
        --         only_current_line = false,
        --         show_parameter_hints = true,
        --         parameter_hints_prefix = "<-",
        --         other_hints_prefix = "=>",
        --         max_len_align = false,
        --         max_len_align_padding = 1,
        --         right_align = false,
        --         right_align_padding = 7,
        --         highlight = "Comment",
        --     },
        --     hover_actions = {
        --         border = {
        --             { "╭", "FloatBorder" },
        --             { "─", "FloatBorder" },
        --             { "╮", "FloatBorder" },
        --             { "│", "FloatBorder" },
        --             { "╯", "FloatBorder" },
        --             { "─", "FloatBorder" },
        --             { "╰", "FloatBorder" },
        --             { "│", "FloatBorder" },
        --         },
        --         auto_focus = true,
        --     },
        -- },

        server = {
            on_attach = function(client, bufnr)
                vim.keymap.set("n", "<leader>rr", rt.runnables.runnables,
                    { buffer = bufnr, desc = "RustRunables", noremap = true, silent = true })
                vim.keymap.set("n", "<leader>rd", "<CMD>RustDebuggables<CR>",
                    { buffer = bufnr, desc = "RustDebuggables", noremap = true, silent = true })
                vim.keymap.set("n", "<leader>rm", rt.expand_macro.expand_macro,
                    { buffer = bufnr, desc = "RustExpandMacro", noremap = true, silent = true })
                vim.keymap.set("n", "<leader>rj", "<CMD>lua require'rust-tools'.move_item.move_item(false)<CR>",
                    { buffer = bufnr, desc = "RustMoveItemDown", noremap = true, silent = true })
                vim.keymap.set("n", "<leader>rk", "<CMD>lua require'rust-tools'.move_item.move_item(true)<CR>",
                    { buffer = bufnr, desc = "RustMoveItemUp", noremap = true, silent = true })
                vim.keymap.set("n", "<leader>rp", rt.parent_module.parent_module,
                    { buffer = bufnr, desc = "RustParentModule", noremap = true, silent = true })

                require("lvim.lsp").common_on_attach(client, bufnr)
            end,
            on_init = require("lvim.lsp").common_on_init,
            standalone = true,
        },
    })
end

return M
