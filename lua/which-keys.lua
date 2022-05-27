local mappings = lvim.builtin.which_key.mappings
mappings["p"] = { "<CMD>Telescope projects<CR>", "Projects" }
mappings["r"] = { "<CMD>Telescope oldfiles<CR>", "Recently files" }
-- mappings["o"] = { "<CMD>:NvimTreeFindFile<CR>", "Location Exporter" }
mappings["h"] = { "<CMD>edit ~/.cache/lvim/project_nvim/project_history<CR>", "Edit Projects" }
mappings["h"] = { "<CMD>SymbolsOutline<CR>", "SymbolsOutline" }
mappings["c"] = { "<CMD>only<CR>", "Close All Windows" }
-- mappings["q"] = { vim.diagnostic.setloclist, "Quickfix" }
mappings["bc"] = { "<CMD>:BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>", "Close All Buffer" }

mappings["P"] = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    r = { "<cmd>lua require('lvim.plugin-loader').recompile()<cr>", "Re-compile" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
}

local bmn = lvim.lsp.buffer_mappings.normal_mode
-- windows
-- bmn["]w"] = {"<C-w>w","Next Window"}
-- bmn["[w"] = {"<C-w>W","Prev Window"}
-- bmn["]b"] = {"<CMD>BufferLineCycleNext<CR>","Next Buffer"}
-- bmn["[b"] = {"<CMD>BufferLineCyclePrev<CR>","Prev Buffer"}

-- lsp
bmn["K"] = { vim.lsp.buf.hover, "Show hover" }
bmn["gD"] = { vim.lsp.buf.declaration, "Goto declaration" }
bmn["gs"] = { vim.lsp.buf.signature_help, "show signature help" }
bmn["gd"] = { "<cmd>Telescope lsp_definitions<CR>", "Goto Definition" }
bmn["gv"] = { "<cmd>:vsp<cr>:Telescope lsp_definitions<CR>", "Goto Definition" }
bmn["gr"] = { "<cmd>Telescope lsp_references<CR>", "Goto references" }
bmn["gi"] = { "<cmd>Telescope lsp_implementations<CR>", "Goto Implementation" }
bmn["gh"] = { "<cmd>Telescope lsp_document_symbols<CR>", "Document Symbols" }
bmn["gw"] = { "<cmd>Telescope lsp_workspace_symbols<CR>", "Workspace Symbols" }
--  code

local bmv = lvim.lsp.buffer_mappings.visual_mode
bmv["gf"] = { "<cmd>:lua vim.lsp.buf.range_formatting()<CR>", "Format range" }






