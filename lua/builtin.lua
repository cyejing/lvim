-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"

lvim.builtin.notify.active = true

lvim.builtin.terminal.active = true

lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

--lvim.builtin.lualine.style = "tokyonight"

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
    "bash",
    "c",
    "javascript",
    "json",
    "lua",
    "python",
    "typescript",
    "tsx",
    "css",
    "rust",
    "java",
    "yaml",
}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

local components = require("lvim.core.lualine.components")

lvim.builtin.lualine.sections.lualine_a = {
    "mode",
    "branch",
    "diff",
    "filename",
    {
        "lsp_progress",
        spinner_symbols = { " ", " ", " ", " ", " ", " " },
    },
}
lvim.builtin.lualine.sections.lualine_z = {
    "filesize",
    {
        "fileformat",
        -- symbols = {
        --   unix = '', -- e712
        --   dos = '', -- e70f
        --   mac = '', -- e711
        -- },
        symbols = {
            unix = "LF",
            dos = "CRLF",
            mac = "CR",
        },
    },
    "encoding",
    "filetype",
}