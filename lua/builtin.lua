require("builtin.dashboard")
require("builtin.cmp")
require("plugin-config.less")


lvim.line_wrap_cursor_movement = true

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"

lvim.builtin.indentlines.active = true

-- lvim.builtin.notify.active = false
lvim.builtin.lir.active = false

lvim.builtin.project.patterns = { ".git", ".svn", "Makefile", "package.json" }
lvim.builtin.project.exclude_dirs = { ".local" }

lvim.builtin.comment.toggler.block = "gcb"
lvim.builtin.comment.mappings.basic = false

lvim.builtin.dap.active = true

lvim.builtin.cmp.completion.keyword_length = 2

-- treesitter
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = { "bash", "c", "javascript", "json", "lua", "python", "typescript", "tsx",
    "css", "rust", "java", "yaml", }
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- bufferline
lvim.builtin.bufferline.options.close_command = "Bdelete! %d"
lvim.builtin.bufferline.options.right_mouse_command = "Bdelete! %d"

-- lualine
local components = require "lvim.core.lualine.components"
lvim.builtin.lualine.style = "lvim"
lvim.builtin.lualine.options.theme = "auto"
lvim.builtin.lualine.options.globalstatus = true
lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_y = { components.location, components.progress }
lvim.builtin.lualine.sections.lualine_z = { "hostname" }


-- terminal
lvim.builtin.terminal = {
    active = true,
    on_config_done = nil,
    hide_numbers = true,
    open_mapping = [[<c-n>]],
    persist_size = false,
    persist_mode = false,
    size = 22,
    execs = {},
}

-- nvimtree
lvim.builtin.nvimtree.setup.disable_netrw = true
lvim.builtin.nvimtree.setup.git.enable = true
lvim.builtin.nvimtree.setup.renderer.icons.glyphs.git = {
    unstaged = "",
    staged = "✓",
    unmerged = "",
    renamed = "➜",
    untracked = "",
    deleted = "",
    ignored = "◌",
}
lvim.builtin.nvimtree.setup.view.width = 40
lvim.builtin.nvimtree.setup.view.hide_root_folder = false
lvim.builtin.nvimtree.setup.filters.dotfiles = false
lvim.builtin.nvimtree.setup.filters.custom = { "node_modules", "\\.cache", "^.git$" }
lvim.builtin.nvimtree.setup.actions.open_file.resize_window = false
lvim.builtin.nvimtree.setup.actions.open_file.quit_on_open = false
-- Compact folders that only contain a single folder into one node in the file tree.
lvim.builtin.nvimtree.setup.renderer.group_empty=true -- great setting, 
lvim.builtin.nvimtree.setup.live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = false,
}

lvim.builtin.nvimtree.on_config_done = function()
    lvim.builtin.which_key.mappings["e"] = { "<cmd>NvimTreeFocus<CR>", "Explorer" }
end

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
lvim.builtin.telescope.active = true
lvim.builtin.telescope.defaults.layout_config = { width = 0.80 }

pcall(function()
    require("telescope").load_extension "env"
end)
pcall(function()
    require("telescope").load_extension "ui-select"
end)
