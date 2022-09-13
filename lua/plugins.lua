-- Additional Plugins
lvim.plugins = {
    --  UI
    { "navarasu/onedark.nvim" },
    { "folke/tokyonight.nvim" },
    { "sainnhe/everforest" },
    { "marko-cerovac/material.nvim" },
    -- telescope
    { "nvim-telescope/telescope-project.nvim" },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "LinArcX/telescope-env.nvim" },
    -- bufferline
    { "moll/vim-bbye" },

    -- cmp
    { "hrsh7th/cmp-cmdline" },
    -- { "hrsh7th/vim-vsnip" },
    -- { "hrsh7th/cmp-vsnip" },
    -- { "hrsh7th/cmp-nvim-lsp-signature-help" }, -- { name = 'nvim_lsp_signature_help' }

    --lsp
    {
        "simrat39/rust-tools.nvim",
        config = function()
            require("plugin-config.rust-tools").setup()
        end,
        ft = { "rust", "rs" },
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
        "simrat39/symbols-outline.nvim", -- symbols
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
        "nacro90/numb.nvim", -- peek num
        event = "BufRead",
        config = function()
            require("numb").setup {
                show_numbers = true, -- Enable 'number' for the window while peeking
                show_cursorline = true, -- Enable 'cursorline' for the window while peeking
            }
        end,
    },
    -- plus
    -- {
    -- "tpope/vim-surround",
    --     -- yss insert, cs replace, ds delete, ysiw insert word
    --     -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
    --     -- setup = function()
    --     --  vim.o.timeoutlen = 500
    --     -- end
    -- },
    -- progress bar
    { "j-hui/fidget.nvim",
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
        "ethanholz/nvim-lastplace",
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
        "Pocco81/auto-save.nvim",
        config = function()
            require("plugin-config.autosave").setup()
        end,
    },
    -- quickfix plus
    {
        "kevinhwang91/nvim-bqf",
        event = { "BufRead", "BufNew" },
        config = function()
            require("plugin-config.nvim-bqf").setup()
        end,
    },
    -- { 'dinhhuy258/vim-local-history' },
    -- show top fun
    {
        "romgrk/nvim-treesitter-context",
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
    -- markdown
    {
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        ft = "markdown",
        config = function()
            vim.g.mkdp_auto_start = 1
        end,
    },

    -- git
    {
        "sindrets/diffview.nvim",
        event = "BufRead",
    },

    -- rest http
    {
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
    -- sql
    {
        "nanotee/sqls.nvim",
    },
    -- search
    {
        "windwp/nvim-spectre", -- search replace
        event = "BufRead",
        config = function()
            require("spectre").setup()
        end,
    },
    -- {
    -- 'beauwilliams/focus.nvim',
    -- config = function()
    -- require("focus").setup()
    -- end,
    -- }
}
