
require("basic")
require("builtin")
require("keybindings")
require("plugins")
require("autocmd")
require("lsp")

--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT



-- general
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "tokyonight"
vim.o.background = "dark"
vim.g.tokyonight_style = "storm"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false
