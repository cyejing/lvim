-- Additional Plugins
lvim.plugins = {
    --  UI
    {
        "navarasu/onedark.nvim",
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require("plugin-config").onedark_setup()
        end
    },

    -- telescope
    { "nvim-telescope/telescope-project.nvim" },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "LinArcX/telescope-env.nvim" },

    -- file explorer
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("plugin-config").neotree_setup()
        end
    },

    -- bufferline
    { "moll/vim-bbye" },

    --lsp
    {
        -- require: rust-analyzer graphviz
        "simrat39/rust-tools.nvim",
        config = function()
            require("plugin-config").rust_tools_setup()
        end,
    },
    -- {
    --     'mrcjkb/rustaceanvim',
    --     version = '^4', -- Recommended
    --     ft = { 'rust' },
    -- },
    {
        'saecki/crates.nvim', -- rust crate info
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
        enabled = false
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
            require('symbols-outline').setup({
                width = 20,
            })
        end
    },
    -- #lsp

    -- Navigation
    {
        "phaazon/hop.nvim", -- jump char
        config = function()
            require("hop").setup({ keys = "asdqwezxclkjoiumnyfh" })
            vim.api.nvim_set_keymap("n", "sc", ":HopChar1<cr>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "sd", ":HopChar2<cr>", { noremap = true, silent = true })
            -- vim.api.nvim_set_keymap("n", "F", ":HopChar1CurrentLine<cr>", { noremap = true, silent = true })
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
        branch = "legacy",
        config = function()
            require("plugin-config").fidget_setup()
        end
    },
    {
        "ethanholz/nvim-lastplace", -- last place
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
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        ft = "markdown",
        config = function()
            vim.g.mkdp_auto_start = 1
        end,
    },
    {
        -- command :DiffviewFileHistory :DiffviewOpen
        "sindrets/diffview.nvim", -- git diff
        event = "BufRead",
        config = function()
            require("plugin-config").diffview_steup()
        end
    },
    {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config = true,
    },
    {
        "rest-nvim/rest.nvim",
        ft = "http",
        dependencies = { "luarocks.nvim" },
        version = "v1.2.1",
        config = function()
            require("plugin-config").rest_setup()
        end
    },
    {
        -- keymapping: v <leader>rr
        -- command: :SqlsExecuteQuery
        "nanotee/sqls.nvim", -- sql
        event = "BufRead",
        ft = { "sql" },
        enabled = false,
        config = function()
            require("plugin-config").sqls_setup()
        end
    },
    {
        -- keymapping: <leader>S
        -- command: :Spectre
        "nvim-pack/nvim-spectre", -- search and replace
        event = "BufRead",
        config = function()
            require("spectre").setup()
        end,
    }
}
