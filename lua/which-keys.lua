lvim.builtin.which_key.mappings["p"] = { "<CMD>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["r"] = { "<CMD>Telescope oldfiles<CR>", "Recently files" }
lvim.builtin.which_key.mappings["o"] = { "<cmd>:NvimTreeFindFile<CR>", "Location Exporter" }
lvim.builtin.which_key.mappings["h"] = { "<CMD>edit ~/.cache/lvim/project_nvim/project_history<CR>", "Edit Projects" }
lvim.builtin.which_key.mappings["P"] = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    r = { "<cmd>lua require('lvim.plugin-loader').recompile()<cr>", "Re-compile" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
}
