-- Additional Plugins
lvim.plugins = {
    --  UI
    { "folke/tokyonight.nvim" },
    -- telescope
    { "nvim-telescope/telescope-project.nvim" },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "LinArcX/telescope-env.nvim" },
    -- bufferline
    { "moll/vim-bbye" },
    -- cmp
    { "hrsh7th/vim-vsnip" },
    { "hrsh7th/cmp-vsnip" },
    { "hrsh7th/cmp-cmdline" }, -- { name = 'cmdline' }
    { "hrsh7th/cmp-nvim-lsp-signature-help" }, -- { name = 'nvim_lsp_signature_help' }

    --lsp
    {
        "simrat39/rust-tools.nvim",
        config = function()
            require("plugin-config.rust-tools").setup()
        end,
        ft = { "rust", "rs" },
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
            vim.g.symbols_outline = {
                auto_preview = false,
                auto_close = true
            }
        end
    },

    -- Navigation
    {
        "phaazon/hop.nvim", -- jump char
        event = "BufRead",
        config = function()
            require("hop").setup()
            vim.api.nvim_set_keymap("n", "f", ":HopChar1<cr>", { silent = true })
            vim.api.nvim_set_keymap("n", "F", ":HopWord<cr>", { silent = true })
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
        "Pocco81/AutoSave.nvim",
        config = function()
            require("plugin-config.autosave").setup()
        end,
    },
    -- {
    -- "folke/trouble.nvim",
    -- cmd = "TroubleToggle",
    -- },
    { -- quickfix plus
        "kevinhwang91/nvim-bqf",
        event = { "BufRead", "BufNew" },
        config = function()
            require("bqf").setup({
                auto_enable = true,
                auto_resize_height = true,
                preview = {
                    win_height = 50,
                    win_vheight = 50,
                    delay_syntax = 50,
                    border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
                },
                func_map = {
                    vsplit = "",
                    ptogglemode = "z,",
                    stoggleup = "",
                },
                filter = {
                    fzf = {
                        action_for = { ["ctrl-s"] = "split" },
                        extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
                    },
                },
            })
        end,
    },
    { 'dinhhuy258/vim-local-history' },
    -- git
    -- {
    -- "sindrets/diffview.nvim",
    -- event = "BufRead",
    -- },
    -- search
    --{
    --    "windwp/nvim-spectre", -- search replace
    --    event = "BufRead",
    --    config = function()
    --        require("spectre").setup()
    --    end,
    --},
}
