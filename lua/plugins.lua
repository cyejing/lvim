-- Additional Plugins

require("plugin-config.builtin")

lvim.plugins = {
    --  UI --
    { "folke/tokyonight.nvim" },

    -- lualine --
    { "arkav/lualine-lsp-progress" },

    -- utils --
    {
        "Pocco81/AutoSave.nvim",
        config = function()
            require("plugin-config.autosave").setup()
        end,
    },
    { "simrat39/rust-tools.nvim" },
}
