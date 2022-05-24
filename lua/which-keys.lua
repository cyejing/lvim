local mappings = lvim.builtin.which_key.mappings
mappings["p"] = { "<CMD>Telescope projects<CR>", "Projects" }
mappings["r"] = { "<CMD>Telescope oldfiles<CR>", "Recently files" }
mappings["o"] = { "<CMD>:NvimTreeFindFile<CR>", "Location Exporter" }
mappings["h"] = { "<CMD>edit ~/.cache/lvim/project_nvim/project_history<CR>", "Edit Projects" }
mappings["c"] = { "<CMD>Bdelete!<CR>", "Close Buffer" }

mappings["/"] = { "<CMD>lua require('Comment.api').toggle_current_linewise()<CR>", "Comment" }

mappings["P"] = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    r = { "<cmd>lua require('lvim.plugin-loader').recompile()<cr>", "Re-compile" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
}
