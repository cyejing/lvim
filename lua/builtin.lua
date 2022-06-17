require("builtin.bufferline")
require("builtin.dashboard")
require("builtin.cmp")
require("plugin-config.less")

lvim.line_wrap_cursor_movement = true

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"

lvim.builtin.notify.active = true

lvim.builtin.terminal.active = true

lvim.builtin.project.patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" }
lvim.builtin.project.exclude_dirs = { ".local" }

lvim.builtin.comment.toggler.block = "gcb"

lvim.builtin.dap.active = true

lvim.builtin.cmp.completion.keyword_length = 2

-- treesitter
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = { "bash", "c", "javascript", "json", "lua", "python", "typescript", "tsx", "css", "rust", "java", "yaml", }
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- lualine
lvim.builtin.lualine.options.theme = "auto"
lvim.builtin.lualine.options.globalstatus = true
lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_z = { "progress", "location" }

-- nvimtree
local nvim_tree_setup = lvim.builtin.nvimtree.setup
nvim_tree_setup.disable_netrw = true
nvim_tree_setup.git.enable = false
nvim_tree_setup.view.hide_root_folder = false
nvim_tree_setup.view.width = 36
nvim_tree_setup.filters.dotfiles = true
nvim_tree_setup.actions.open_file.resize_window = true
nvim_tree_setup.actions.open_file.quit_on_open = false

-- gitsigns
lvim.builtin.gitsigns.opts.signs = {
    add = { hl = "GitSignsAdd", text = "A|", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    change = { hl = "GitSignsChange", text = "M|", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    delete = { hl = "GitSignsDelete", text = "D_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    topdelete = { hl = "GitSignsDelete", text = "D‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    changedelete = { hl = "GitSignsChange", text = "D~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
}
lvim.builtin.gitsigns.opts.numhl = false
lvim.builtin.gitsigns.opts.linehl = false
lvim.builtin.gitsigns.opts.word_diff = false

-- telescope
lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
lvim.builtin.telescope.defaults.layout_config.width = 0.95

lvim.builtin.terminal.execs = {
    { "gitui", "<leader>gg", "Gitui", "float" },
}

-- lvim.builtin.telescope.defaults.layout_config.preview_cutoff = 75
pcall(function()
    require("telescope").load_extension "env"
end)
pcall(function()
    require("telescope").load_extension "ui-select"
end)
