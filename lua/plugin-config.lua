local M = {}

-- ui
M.onedark_setup = function()
    require('onedark').setup {
        style = 'light',
        toggle_style_key = '<leader>t',            -- Default keybinding to toggle
        toggle_style_list = { 'light', 'darker' }, -- List of styles to toggle between
    }
end

-- autosave
M.autosave_setup = function()
    local status_ok, autosave = pcall(require, "autosave")
    if not status_ok then
        vim.notify("autosave not found!")
        return
    end

    autosave.setup({
        enabled = true,
        execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
        events = { "InsertLeave", "TextChanged" },
        conditions = {
            exists = true,
            filename_is_not = {},
            filetype_is_not = {},
            modifiable = true
        },
        on_off_commands = true,
        write_all_buffers = false,
        clean_command_line_interval = 0,
        debounce_delay = 135
    })
end

M.bqf_setup = function()
    require("bqf").setup({
        auto_enable = true,
        auto_resize_height = true,
        preview = {
            win_height = 20,
            win_vheight = 20,
            delay_syntax = 50,
            border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        },
        func_map = {
            -- vsplit = "",
            ptogglemode = "z,",
            stoggleup = "",
            pscrolldown = "<C-d>",
            pscrollup = "<C-f>",
        },
        filter = {
            fzf = {
                action_for = {
                    ["ctrl-d"] = "pscrolldown",
                    ["ctrl-f"] = "pscrollup",
                },
                extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
            },
        },
    })
end

M.rust_tools_setup = function()
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

M.sqls_setup = function()
    require('lspconfig').sqls.setup({
        cmd = {"sqls", "-config", "~/.config/sqls.yml"};
        on_attach = function(client, bufnr)
            local mappings = require("which-keys").sqls_key_mappings()

            for mode, map in pairs(mappings) do
                for key, remap in pairs(map) do
                    local opts = { buffer = bufnr, desc = remap[2], noremap = true, silent = true }
                    vim.keymap.set(mode, key, remap[1], opts)
                end
            end

            require('sqls').on_attach(client, bufnr)
        end
    })
end


M.fidget_setup = function()
    require("fidget").setup({
        text = {
            spinner = "zip",         -- animation shown when tasks are ongoing
            done = "✔",            -- character shown when all tasks are complete
            commenced = "Started",   -- message shown when task starts
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
        enable = true,   -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
        max_lines = 0,   -- How many lines the window should span. Values <= 0 mean no limit.
        patterns = {
            -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
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
        -- Encode URL before making request
        encode_url = true,
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
            -- executables or functions for formatting response body [optional]
            -- set them to false if you want to disable them
            formatters = {
                json = "jq",
                html = function(body)
                    return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
                end
            },
        },
        -- Jump to request line on run
        jump_to_request = false,
        env_file = '.env',
        custom_dynamic_variables = {},
        yank_dry_run = true,
    })
end


-- require("dap-install").config("codelldb", {})

return M
