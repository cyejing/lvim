-- Additional Plugins
lvim.plugins = {
    --  UI
    {
        "navarasu/onedark.nvim",
        config = function()
            require("plugin-config").onedark_setup()
        end
    },

    -- telescope
    { "nvim-telescope/telescope-project.nvim" },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "LinArcX/telescope-env.nvim" },
    --tabline
    -- {'romgrk/barbar.nvim', requires = 'nvim-web-devicons'},
    -- bufferline
    { "moll/vim-bbye" },

    -- cmp
    -- { "hrsh7th/cmp-cmdline" },

    --lsp
    {
        -- require: rust-analyzer graphviz
        "simrat39/rust-tools.nvim", -- rust
        config = function()
            require("plugin-config").rust_tools_setup()
        end,
    },
    {
        'saecki/crates.nvim', -- rust crate info
        version = 'v0.2.1',
        config = function()
            require('crates').setup()
        end,
    },
    {
        "mfussenegger/nvim-jdtls", -- java
    },
    {
        'weilbith/nvim-code-action-menu', -- code action menu beautiful view
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
            require("hop").setup({ keys = "asdqwezxclkjoiumnyfh" })
            vim.api.nvim_set_keymap("n", "f", ":HopChar1<cr>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "F", ":HopChar1CurrentLine<cr>", { noremap = true, silent = true })
        end,
    },
    {
        "nacro90/numb.nvim", -- peek numline
        event = "BufRead",
        config = function()
            require("numb").setup {
                show_numbers = true,    -- Enable 'number' for the window while peeking
                show_cursorline = true, -- Enable 'cursorline' for the window while peeking
            }
        end,
    },
    {
        -- yss insert, cs replace, ds delete, ysiw insert word
        "tpope/vim-surround", -- plus
    },
    {
        "j-hui/fidget.nvim", -- progress bar
        config = function()
            require("plugin-config").fidget_setup()
        end
    },
    {
        "ethanholz/nvim-lastplace", -- last place
        event = "BufRead",
        config = function()
            require("plugin-config").lastplace_setup()
        end,
    },
    {
        "Pocco81/auto-save.nvim", -- autosave
        config = function()
            require("plugin-config").autosave_setup()
        end,
    },
    {
        "kevinhwang91/nvim-bqf", -- quickfix plus
        event = { "BufRead", "BufNew" },
        config = function()
            require("plugin-config").bqf_setup()
        end,
    },
    -- { 'dinhhuy258/vim-local-history' },
    {
        "romgrk/nvim-treesitter-context", -- show top function name
        config = function()
            require("plugin-config").treesitter_context_setup()
        end
    },
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
    {
        "iamcco/markdown-preview.nvim", -- markdown
        build = "cd app && npm install",
        ft = { "markdown" },
        config = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
    },
    {
        "ellisonleao/glow.nvim",
        ft = { "markdown" },
        config = function()
            require("glow").setup()
        end
    },
    {
        -- command :DiffviewFileHistory :DiffviewOpen
        "sindrets/diffview.nvim", -- git diff
        event = "BufRead",
    },
    -- rest http
    {
        -- keymapping: <leader>rr
        "NTBBloodbath/rest.nvim",
        config = function()
            require("plugin-config").rest_setup()
        end
    },
    -- {
        -- keymapping: v <leader>rr
        -- command: :SqlsExecuteQuery
        -- "nanotee/sqls.nvim", -- sql
        -- config = function()
            -- require("plugin-config").sqls_setup()
        -- end
    -- },
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
