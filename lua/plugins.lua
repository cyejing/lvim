-- Additional Plugins
lvim.plugins = {
    --  UI
    { "navarasu/onedark.nvim" },

    -- telescope
    { "nvim-telescope/telescope-project.nvim" },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "LinArcX/telescope-env.nvim" },
    -- bufferline
    { "moll/vim-bbye" },

    -- cmp
    { "hrsh7th/cmp-cmdline" },

    --lsp
    {
        -- require: rust-analyzer graphviz
        "simrat39/rust-tools.nvim",
        config = function()
            require("plugin-config.rust-tools").setup()
        end,
    },
    {
        'saecki/crates.nvim',
        tag = 'v0.2.1',
        config = function()
            require('crates').setup()
        end,
    },
    {
        'weilbith/nvim-code-action-menu',
        cmd = 'CodeActionMenu',
    },
    {
        "ray-x/lsp_signature.nvim", -- signature tip
        event = "BufRead",
        config = function()
            require "lsp_signature".setup()
        end
    },
    {
        "simrat39/symbols-outline.nvim", -- symbols hierarchy
        config = function()
            require('symbols-outline').setup()
        end
    },
    -- #lsp

    -- Navigation
    {
        "phaazon/hop.nvim", -- jump char
        event = "BufRead",
        config = function()
            require("hop").setup()
            vim.api.nvim_set_keymap("n", "f", ":HopChar1<cr>", { silent = true })
        end,
    },
    {
        "nacro90/numb.nvim", -- peek numline
        event = "BufRead",
        config = function()
            require("numb").setup {
                show_numbers = true, -- Enable 'number' for the window while peeking
                show_cursorline = true, -- Enable 'cursorline' for the window while peeking
            }
        end,
    },
    {
        "tpope/vim-surround", -- plus
        -- yss insert, cs replace, ds delete, ysiw insert word
        -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
        -- setup = function()
        --  vim.o.timeoutlen = 500
        -- end
    },
    {
        "j-hui/fidget.nvim", -- progress bar
        config = function()
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
    },
    {
        "ethanholz/nvim-lastplace", -- last place
        event = "BufRead",
        config = function()
            require("nvim-lastplace").setup({
                lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
                lastplace_ignore_filetype = {
                    "gitcommit", "gitrebase", "svn", "hgcommit",
                },
                lastplace_open_folds = true,
            })
        end,
    },
    {
        "Pocco81/auto-save.nvim", -- autosave
        config = function()
            require("plugin-config.autosave").setup()
        end,
    },
    {
        "kevinhwang91/nvim-bqf", -- quickfix plus
        event = { "BufRead", "BufNew" },
        config = function()
            require("plugin-config.nvim-bqf").setup()
        end,
    },
    -- { 'dinhhuy258/vim-local-history' },
    {
        "romgrk/nvim-treesitter-context", -- show top function name
        config = function()
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
    },
    {
        "iamcco/markdown-preview.nvim", -- markdown
        run = "cd app && npm install",
        ft = "markdown",
        config = function()
            vim.g.mkdp_auto_start = 1
        end,
    },
    {
        -- command :DiffviewFileHistory :DiffviewOpen
        "sindrets/diffview.nvim", -- git diff
        event = "BufRead",
    },
    -- rest http
    {
        -- keymapping: <leader>rh
        "NTBBloodbath/rest.nvim",
        config = function()
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
    },
    {
        -- keymapping: v <leader>rq
        -- command: :SqlsExecuteQuery
        "nanotee/sqls.nvim", -- sql
        config = function()
            require('lspconfig').sqls.setup({
                on_attach = function(client, bufnr)
                    require('sqls').on_attach(client, bufnr)
                end
            })
        end
    },
    -- search
    {
        -- keymapping: <leader>S
        -- command: :Spectre
        "windwp/nvim-spectre", -- search and replace
        event = "BufRead",
        config = function()
            require("spectre").setup()
        end,
    },
}
