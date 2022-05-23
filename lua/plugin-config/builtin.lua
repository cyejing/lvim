
require("plugin-config.bufferline")
require("plugin-config.nvim-tree")

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"

lvim.builtin.notify.active = true

lvim.builtin.terminal.active = true


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

lvim.builtin.lualine.sections.lualine_c = {
    {
        "lsp_progress",
        spinner_symbols = { " ", " ", " ", " ", " ", " " },
    },
}
lvim.builtin.lualine.sections.lualine_z = { "progress" }

