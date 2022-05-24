-- Additional Plugins

require("plugin-config.builtin")

lvim.plugins = {
    --  UI --
    { "folke/tokyonight.nvim" },

    -- lualine --
    { "arkav/lualine-lsp-progress" },

    { "nvim-telescope/telescope-project.nvim" },
    -- utils --
    {
        "Pocco81/AutoSave.nvim",
        config = function()
            require("plugin-config.autosave").setup()
        end,
    },
    { "simrat39/rust-tools.nvim" },
}
