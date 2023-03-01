-- vim.g.local_history_width = 35
-- vim.g.local_history_new_change_delay = 10
--
--
local M = {}

-- ui
M.onedark_setup = function()
    require('onedark').setup {
        style = 'light',
        toggle_style_key = '<leader>t', -- Default keybinding to toggle
        toggle_style_list = { 'light', 'darker' }, -- List of styles to toggle between
    }
end

M.fidget_setup = function()
    require("fidget").setup({
        text = {
            spinner = "zip", -- animation shown when tasks are ongoing
            done = "✔", -- character shown when all tasks are complete
            commenced = "Started", -- message shown when task starts
            completed = "Completed", -- message shown when task completes
        },
        sources = {

        },
    })
end

M.lastplace_setup = function()
    require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
            "gitcommit", "gitrebase", "svn", "hgcommit",
        },
        lastplace_open_folds = true,
    })
end


M.treesitter_context_setup = function()
    require("treesitter-context").setup {
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
            -- For all filetypes
            -- Note that setting an entry here replaces all other patterns for this entry.
            -- By setting the 'default' entry below, you can control which nodes you want to
            -- appear in the context window.
            default = {
                'class',
                'function',
                'method',
            },
        },
    }
end

M.rest_setup = function()
    require("rest-nvim").setup({
        -- Open request results in a horizontal split
        result_split_horizontal = false,
        -- Keep the http file buffer above|left when split horizontal|vertical
        result_split_in_place = false,
        -- Skip SSL verification, useful for unknown certificates
        skip_ssl_verification = false,
        -- Highlight request on run
        highlight = {
            enabled = true,
            timeout = 150,
        },
        result = {
            -- toggle showing URL, HTTP info, headers at top the of result window
            show_url = true,
            show_http_info = true,
            show_headers = true,
        },
        -- Jump to request line on run
        jump_to_request = false,
        env_file = '.env',
        custom_dynamic_variables = {},
        yank_dry_run = true,
    })
end

M.sqls_setup = function()
    require('lspconfig').sqls.setup({
        on_attach = function(client, bufnr)
            local mappings = require("which-keys").sqls_key_mappings()

            for key, remap in pairs(mappings) do
                local opts = { buffer = bufnr, desc = remap[3], noremap = true, silent = true }
                vim.keymap.set(remap[1], key, remap[2], opts)
            end

            require('sqls').on_attach(client, bufnr)
        end
    })
end

-- require("dap-install").config("codelldb", {})

return M
