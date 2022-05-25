require("basic")
require("keybindings")
require("which-keys")
require("plugins")
require("autocmd")
require("lsp")


require("builtin.less")
require("builtin.bufferline")
require("builtin.nvim-tree")
require("builtin.dashboard")
require("builtin.telescope")
require("builtin.cmp")
require("builtin.fidget")

-- general
lvim.log.level = "warn"
lvim.use_icons = true
lvim.format_on_save = false
lvim.colorscheme = "onedarker"
vim.o.background = "dark"
vim.g.tokyonight_style = "storm"
-- to disable icons and use a minimalist setup, uncomment the following
