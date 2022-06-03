local mappings = lvim.builtin.which_key.mappings
mappings["e"] = { "<cmd>NvimTreeFocus<CR>", "Explorer" }
mappings["p"] = { "<CMD>Telescope projects layout_config={width=0.6}<CR>", "Projects" }
mappings["r"] = { "<CMD>Telescope oldfiles<CR>", "Recently files" }
-- mappings["o"] = { "<CMD>:NvimTreeFindFile<CR>", "Location Exporter" }
mappings["h"] = { "<CMD>edit ~/.cache/lvim/project_nvim/project_history<CR>", "Edit Projects" }
mappings["h"] = { "<CMD>SymbolsOutline<CR>", "SymbolsOutline" }
mappings["c"] = { "<CMD>only<CR>", "Close All Windows" }
-- mappings["q"] = { vim.diagnostic.setloclist, "Quickfix" }

mappings["b"] = {
    name = "Buffers",
    j = { "<cmd>BufferLinePick<cr>", "Jump" },
    f = { "<cmd>Telescope buffers<cr>", "Find" },
    c = { "<CMD>:BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>", "Close All Buffer" },
    b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
    -- w = { "<cmd>BufferWipeout<cr>", "Wipeout" }, -- TODO: implement this for bufferline
    e = {
        "<cmd>BufferLinePickClose<cr>",
        "Pick which buffer to close",
    },
    h = { "<CMD>LocalHistoryToggle<CR>", "Toggle Local History" },
    l = { "<CMD>lua require('memento').toggle()<CR>", "Toggle Buffers History" },
    D = {
        "<cmd>BufferLineSortByDirectory<cr>",
        "Sort by directory",
    },
    L = {
        "<cmd>BufferLineSortByExtension<cr>",
        "Sort by language",
    },
}


mappings["P"] = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    r = { "<cmd>lua require('lvim.plugin-loader').recompile()<cr>", "Re-compile" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
}

mappings["l"] = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_dropdown layout_config={width=0.95}<cr>", "Buffer Diagnostics" },
    w = { "<cmd>Telescope diagnostics theme=get_dropdown layout_config={width=0.95}<cr>", "Diagnostics" },
    f = { require("lvim.lsp.utils").format, "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
    j = {
        vim.diagnostic.goto_next,
        "Next Diagnostic",
    },
    k = {
        vim.diagnostic.goto_prev,
        "Prev Diagnostic",
    },
    l = { vim.lsp.codelens.run, "CodeLens Action" },
    p = {
        name = "Peek",
        d = { "<cmd>lua require('lvim.lsp.peek').Peek('definition')<cr>", "Definition" },
        t = { "<cmd>lua require('lvim.lsp.peek').Peek('typeDefinition')<cr>", "Type Definition" },
        i = { "<cmd>lua require('lvim.lsp.peek').Peek('implementation')<cr>", "Implementation" },
    },
    q = { "<CMD>Telescope diagnostics<CR>", "Diagnostics" },
    r = { vim.lsp.buf.rename, "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
        "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
        "Workspace Symbols",
    },
    e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
}



local bmn = lvim.lsp.buffer_mappings.normal_mode
-- windows
-- bmn["]w"] = {"<C-w>w","Next Window"}
-- bmn["[w"] = {"<C-w>W","Prev Window"}
-- bmn["]b"] = {"<CMD>BufferLineCycleNext<CR>","Next Buffer"}
-- bmn["[b"] = {"<CMD>BufferLineCyclePrev<CR>","Prev Buffer"}

-- lsp
bmn["ga"] = { "<CMD>CodeActionMenu<CR>", "Code Action" }
-- bmn["K"] = { "<CMD>Lspsaga hover_doc<CR>", "Lsp Hover Doc" }
-- bmn["gR"] = { "<CMD>Lspsaga rename<CR>", "Lsp Rename" }
-- bmn["gf"] = { "<CMD>Lspsaga lsp_finder<CR>", "Lsp Finder" }
-- bmn["gx"] = { "<CMD>Lspsaga code_action<CR>", "Lsp Code Action" }
-- bmn["gl"] = { "<CMD>Lspsaga show_line_diagnostics<CR>", "Lsp Show Line diagnostics" }
-- bmn["gj"] = { "<CMD>Lspsaga diagnostic_jump_next<CR>", "Lsp Diagnostic jump next" }
-- bmn["gk"] = { "<CMD>Lspsaga diagnostic_jump_prev<CR>", "Lsp Diagnostic jump prev" }
-- bmn["gs"] = { "<CMD>Lspsaga signature_help<CR>", "Lsp Signature Help" }
bmn["K"] = { vim.lsp.buf.hover, "Show hover" }
bmn["gD"] = { vim.lsp.buf.declaration, "Goto declaration" }
bmn["gs"] = { vim.lsp.buf.signature_help, "Show signature help" }
bmn["gf"] = { vim.lsp.buf.formatting, "Format" }
bmn["gb"] = { "<cmd>Telescope diagnostics bufnr=0 theme=get_dropdown layout_config={width=0.95}<cr>", "Telescope Buffer Diagnostics" }
bmn["gq"] = { "<CMD>Telescope diagnostics<CR> theme=get_dropdown layout_config={width=0.95}", "Telescope Diagnostics" }
bmn["gd"] = { "<cmd>Telescope lsp_definitions<CR>", "Telescope Definition" }
bmn["gv"] = { "<cmd>:vertical resize +80<cr>:vsp<cr>:Telescope lsp_definitions<cr>:vertical resize 120<cr>", "Telescope Definition" }
bmn["gr"] = { "<cmd>Telescope lsp_references<CR>", "Telescope references" }
bmn["gi"] = { "<cmd>Telescope lsp_implementations<CR>", "Telescope Implementation" }
bmn["gh"] = { "<cmd>Telescope lsp_document_symbols<CR>", "Telescope Document Symbols" }
bmn["gw"] = { "<cmd>Telescope lsp_workspace_symbols<CR>", "Telescope Workspace Symbols" }
-- search

local bmv = lvim.lsp.buffer_mappings.visual_mode
bmv["gf"] = { "<cmd>:lua vim.lsp.buf.range_formatting()<CR>", "Format range" }


local wk = require("which-key")
wk.register({
    s = {
        name = "file", -- optional group name
        p = { "<cmd>Telescope projects layout_config={width=0.6}<cr>", "Open Projects" },
        f = { "<cmd>Telescope git_files<cr>", "Find File" }, -- create a binding with label
        t = { "<cmd>Telescope live_grep<cr>", "Find All Text" },
        s = { "<cmd>Telescope grep_string<cr>", "Find Cursor Text" },
        b = { "<cmd>Telescope buffers<cr>", "Find Buffers" },
        c = { "<cmd>Telescope git_status<cr>", "Find Git Change" },
        j = { "<cmd>Telescope jumplist<cr>", "Find jumplist" },
    },
})


lvim.builtin.nvimtree.setup.view.mappings.list = {
    { key = { "<ESC>", "q" }, action = "close", mode = "n" },
    { key = { "l", "<CR>", "o" }, action = "edit", mode = "n" },
    { key = "h", action = "close_node" },
    { key = "v", action = "vsplit" },
    { key = "C", action = "cd" },
    { key = "sf", action = "telescope_find_files", action_cb = function()
        require("lvim.core.nvimtree").start_telescope "find_files"
    end },
    { key = "st", action = "telescope_live_grep", action_cb = function()
        require("lvim.core.nvimtree").start_telescope "live_grep"
    end },
}

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
    -- for input mode
    i = {
        ["<C-c>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<CR>"] = actions.select_default,
    },
    -- for normal mode
    n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-c>"] = actions.close,
    },
}

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
-- name = "+Trouble",
-- r = { "<cmd>Trouble lsp_references<cr>", "References" },
-- f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
-- d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
-- q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
-- l = { "<cmd>Trouble loclist<cr>", "LocationList" },
-- w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
-- }
