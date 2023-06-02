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
            require("neo-tree").setup({
                default_component_configs = {
                    git_status = {
                        symbols = {
                            added = lvim.icons.git.LineAdded,
                            modified = lvim.icons.git.LineModified,
                            unstaged = lvim.icons.git.FileUnstaged,
                            staged = lvim.icons.git.FileStaged,
                            unmerged = lvim.icons.git.FileUnmerged,
                            renamed = lvim.icons.git.FileRenamed,
                            untracked = lvim.icons.git.FileUntracked,
                            deleted = lvim.icons.git.FileDeleted,
                            ignored = lvim.icons.git.FileIgnored,
                        }
                    }
                },
                filesystem = {
                    follow_current_file = true,
                    group_empty_dirs = true,
                    filtered_items = {
                        hide_dotfiles = false,
                        hide_gitignored = true,
                        hide_by_name = {
                            "node_modules", ".git", ".cache"
                        },
                        hide_by_pattern = { -- uses glob style patterns
                            --"*.meta",
                            --"*/src/*/tsconfig.json",
                        },
                    },
                    window = {
                        fuzzy_finder_mappings = {
                            ["<C-J>"] = "move_cursor_down",
                            ["<C-k>"] = "move_cursor_up",
                        }
                    }
                },
                window = {
                    mappings = {
                        ["<cr>"] = "open",
                        ["l"] = "open",
                        ["o"] = "open",
                        ["s"] = "open_split",
                        ["v"] = "open_vsplit",
                        ["h"] = "close_node",
                        ["a"] = {
                            "add",
                            config = {
                                show_path = "none" -- "none", "relative", "absolute"
                            }
                        },
                        ["A"] = "add_directory",
                        ["d"] = "delete",
                        ["r"] = "rename",
                        ["y"] = "copy_to_clipboard",
                        ["x"] = "cut_to_clipboard",
                        ["p"] = "paste_from_clipboard",
                        ["c"] = "copy",
                        ["m"] = "move",
                        ["q"] = "close_window",
                        ["R"] = "refresh",
                        ["?"] = "show_help",
                        ["<"] = "prev_source",
                        [">"] = "next_source",
                    }
                }
            })
        end
    },

    -- bufferline
    { "moll/vim-bbye" },

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
