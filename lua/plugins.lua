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
    { "onsails/lspkind-nvim" },
    { "tami5/lspsaga.nvim" },
    { "simrat39/rust-tools.nvim" },
    { "ur4ltz/surround.nvim" },
    { "j-hui/fidget.nvim" },
    -- utils
    {
        "Pocco81/AutoSave.nvim",
        config = function()
            require("plugin-config.autosave").setup()
        end,
    },
}
