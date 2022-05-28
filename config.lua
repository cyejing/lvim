require("basic")
require("plugins")
require("autocmd")
require("lsp")

require("keybindings")
require("which-keys")

-- general
lvim.log.level = "warn"
lvim.use_icons = true
lvim.format_on_save = false
lvim.colorscheme = "onedarker"
vim.o.background = "dark"
vim.g.tokyonight_style = "storm"
-- to disable icons and use a minimalist setup, uncomment the following
