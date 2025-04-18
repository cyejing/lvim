lvim.line_wrap_cursor_movement = true

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"

lvim.builtin.indentlines.active = true

-- lvim.builtin.notify.active = false
lvim.builtin.lir.active = false
lvim.builtin.nvimtree.active = false
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


lvim.builtin.project.patterns = { ".git", ".svn", "Makefile" }
lvim.builtin.project.exclude_dirs = { "*/node_modules/*" }

-- lvim.builtin.comment.toggler.block = "gcb"
-- lvim.builtin.comment.mappings.basic = false

-- dap
lvim.builtin.dap.active = true

-- which_key
lvim.builtin.which_key.setup.plugins.registers = true
lvim.builtin.which_key.setup.plugins.marks = true

-- cmp
lvim.builtin.cmp.cmdline.enable = true
lvim.builtin.cmp.completion.keyword_length = 2
lvim.builtin.cmp.formatting.fields = { "abbr", "kind", "menu" }

local cmp = require("cmp")
-- Use buffer source for `/`.
cmp.setup.cmdline("/", {
    sources = {
        { name = "buffer" },
    },
})
-- Use cmdline & path source for ':'.
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        { name = "cmdline" },
    }),
})

-- bufferline
lvim.builtin.bufferline.options.close_command = "Bdelete! %d"
lvim.builtin.bufferline.options.right_mouse_command = "Bdelete! %d"

-- lualine
local components = require "lvim.core.lualine.components"
lvim.builtin.lualine.style = "lvim"
lvim.builtin.lualine.options.theme = "auto"
lvim.builtin.lualine.options.globalstatus = true
lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_b = { components.branch, components.diff }
lvim.builtin.lualine.sections.lualine_c = { components.python_env, { "filename", path = 3 } }
lvim.builtin.lualine.sections.lualine_y = { "hostname" }
lvim.builtin.lualine.sections.lualine_z = { components.location, components.progress }


-- terminal
lvim.builtin.terminal = {
    active = true,
    on_config_done = nil,
    hide_numbers = true,
    open_mapping = [[<C-n>]],
    persist_size = false,
    persist_mode = true,
    direction = "float",
    size = 22,
    direction = 'float',
    execs = {
        { vim.o.shell, "<leader>nf", "Tab Terminal", "tab", 120 },
    },
}

-- nvimtree
lvim.builtin.nvimtree.setup.git.enable = true
lvim.builtin.nvimtree.setup.view.width = 40
lvim.builtin.nvimtree.setup.view.hide_root_folder = false
lvim.builtin.nvimtree.setup.filters.dotfiles = false
lvim.builtin.nvimtree.setup.filters.custom = { "node_modules", "\\.cache", "^.git$" }
lvim.builtin.nvimtree.setup.actions.open_file.resize_window = false
lvim.builtin.nvimtree.setup.actions.open_file.quit_on_open = false
lvim.builtin.nvimtree.setup.renderer.group_empty = true -- great setting,
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
lvim.builtin.telescope.defaults.path_display = {
    shorten = { len = 4, exclude = { 1, 2, -1, -2, -3 } },
}
lvim.builtin.telescope.defaults.layout_config = { width = 0.80 }
lvim.builtin.telescope.on_config_done = function(telescope)
    pcall(telescope.load_extension, "env")
    pcall(telescope.load_extension, "ui-select")
    pcall(telescope.load_extension, "frecency")
    pcall(telescope.load_extension, "neoclip")
    -- any other extensions loading
end


-- Autocommands (https://neovim.io/doc/user/autocmd.html)
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.json", "*.jsonc" },
    -- enable wrap mode for json files only
    command = "setlocal wrap",
})
