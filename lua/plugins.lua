-- Additional Plugins
lvim.plugins = {
    --  UI
    { "folke/tokyonight.nvim" },
    -- lualine
    { "arkav/lualine-lsp-progress" },
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

    -- plus
    -- { "ur4ltz/surround.nvim" },
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

    --lsp
    {
        "simrat39/rust-tools.nvim",
        config = function()
            require("plugin-config.rust-tools").setup()
        end,
        ft = { "rust", "rs" },
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
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
    },

    -- Navigation
    {
        "phaazon/hop.nvim", -- jump char
        event = "BufRead",
        config = function()
            require("hop").setup()
            vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
            vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
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
    -- git
    {
        "sindrets/diffview.nvim",
        event = "BufRead",
    },
    -- search
    --{
    --    "windwp/nvim-spectre", -- search replace
    --    event = "BufRead",
    --    config = function()
    --        require("spectre").setup()
    --    end,
    --},
}
