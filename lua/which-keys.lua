local mappings = lvim.builtin.which_key.mappings
mappings["m"]  = { "<cmd>NvimTreeFocus<CR>", "Explorer Toggle" }
mappings["p"]  = { "<CMD>Telescope projects layout_config={width=0.6}<CR>", "Projects" }
mappings["o"]  = { "<CMD>Telescope oldfiles<CR>", "Recently files" }
-- mappings["o"] = { "<CMD>:NvimTreeFindFile<CR>", "Location Exporter" }
mappings["h"]  = { "<CMD>edit ~/.cache/lvim/project_nvim/project_history<CR>", "Edit Projects" }
mappings["h"]  = { "<CMD>SymbolsOutline<CR>", "SymbolsOutline" }
mappings["c"]  = { "<CMD>only<CR>", "Close All Windows" }
-- mappings["q"] = { vim.diagnostic.setloclist, "Quickfix" }
mappings["S"]  = { "<CMD>lua require('spectre').open()<CR>", "Open Spectre" }

mappings["b"]  = {
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

mappings["g"] = {
    name = "Git",
    g = { "<cmd>lua require 'plugin-config.func'.gitui_toggle()<cr>", "Gitui" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
        "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
        "Undo Stage Hunk",
    },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    C = {
        "<cmd>Telescope git_bcommits<cr>",
        "Checkout commit(for current file)",
    },
    d = {
        "<cmd>Gitsigns diffthis HEAD<cr>",
        "Git Diff",
    },
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
    g = {
        name = "Goto",
        d = { "<cmd>Telescope lsp_definitions<CR>", "Goto Definition" }
    }
}

mappings["r"] = {
    name = "Rust",
    r = { "<CMD>lua require('rust-tools').runnables.runnables()<CR>", "RustRunnables" },
    d = { "<CMD>RustDebuggables<CR>", "RustDebuggables" },
    m = { "<CMD>lua require'rust-tools'.expand_macro.expand_macro()<CR>", "RustExpandMacro" },
    -- h = { "<CMD>require'rust-tools'.hover_actions.hover_actions()<CR>", "RustHoverActions" },
    j = { "<CMD>lua require'rust-tools'.move_item.move_item(false)<CR>", "RustMoveItemDown" },
    k = { "<CMD>lua require'rust-tools'.move_item.move_item(true)<CR>", "RustMoveItemUp" },
    p = { "<CMD>lua require'rust-tools'.parent_module.parent_module()<CR>", "RustParentModule" },
    w = { "<CMD>RustReloadWorkspace<CR>", "RustReloadWorkspace" },
    h = { "<Plug>RestNvim", "Rest Run" },
    c = { "<Plug>RestNvimPreview", "Rest Perview" },
    t = { "<Plug>RestNvimLast", "Rest Run Last" },
}

lvim.lsp.buffer_mappings.normal_mode = {}
-- local bmn = lvim.lsp.buffer_mappings.normal_mode
-- bmn["ga"] = { "<CMD>CodeActionMenu<CR>", "Code Action" }
-- bmn["K"] = { vim.lsp.buf.hover, "Show hover" }
-- bmn["gD"] = { vim.lsp.buf.declaration, "Goto declaration" }
-- bmn["gs"] = { vim.lsp.buf.signature_help, "Show signature help" }
-- bmn["gf"] = { vim.lsp.buf.formatting, "Format" }
-- bmn["gb"] = { "<cmd>Telescope diagnostics bufnr=0 theme=get_dropdown layout_config={width=0.80} initial_mode=normal<CR>",
--     "Telescope Buffer Diagnostics" }
-- bmn["ge"] = { "<cmd>Telescope diagnostics theme=get_dropdown layout_config={width=0.80} initial_mode=normal<CR>",
--     "Telescope Diagnostics" }
-- bmn["gd"] = { "<cmd>Telescope lsp_definitions<CR>", "Goto Definition" }
-- bmn["gv"] = { "<cmd>:vertical resize +80<cr>:vsp<cr>:Telescope lsp_definitions<cr>:vertical resize 120<cr>",
--     "Goto Definition Split" }
-- bmn["go"] = { "<C-W>c<cmd>:vertical resize 120<cr>", "Goto Back Window" }
-- bmn["gr"] = { "<cmd>Telescope lsp_references theme=get_dropdown layout_config={width=0.80} initial_mode=normal<CR>",
--     "Telescope references" }
-- bmn["gc"] = { "<cmd>Telescope lsp_incoming_calls theme=get_dropdown layout_config={width=0.8} initial_mode=normal<CR>",
--     "Telescope incoming calls" }
-- bmn["gi"] = { "<cmd>Telescope lsp_implementations<CR>", "Telescope Implementation" }
-- bmn["gh"] = { "<cmd>Telescope lsp_document_symbols<CR>", "Telescope Document Symbols" }
-- bmn["gw"] = { "<cmd>Telescope lsp_workspace_symbols<CR>", "Telescope Workspace Symbols" }
-- bmn["gj"] = { vim.diagnostic.goto_next, "Next Diagnostic" }
-- bmn["gk"] = { vim.diagnostic.goto_prev, "Prev Diagnostic" }
-- bmn["gn"] = { "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>j", "Comment line" }


-- search
-- local bmv = lvim.lsp.buffer_mappings.visual_mode
-- bmv["gf"] = { "<cmd>:lua vim.lsp.buf.range_formatting()<CR>", "Format range" }

lvim.builtin.which_key.on_config_done = function(wk)
    wk.register({
        s = {
            name = "File", -- optional group name
            p = { "<cmd>Telescope projects layout_config={width=0.6}<cr>", "Open Projects" },
            f = { "<cmd>Telescope git_files<cr>", "Find File" }, -- create a binding with label
            t = { "<cmd>Telescope live_grep theme=get_dropdown layout_config={width=0.8}<cr>", "Find All Text" },
            s = { "<cmd>Telescope grep_string<cr>", "Find Cursor Text" },
            b = { "<cmd>Telescope buffers<cr>", "Find Buffers" },
            c = { "<cmd>Telescope git_status<cr>", "Find Git Change" },
            j = { "<cmd>Telescope jumplist<cr>", "Find jumplist" },
            o = { "<CMD>Telescope oldfiles<CR>", "Recently files" },
            h = { "<CMD>Telescope lsp_document_symbols<CR>", "Document Symbols" },
            H = { "<CMD>Telescope lsp_workspace_symbols<CR>", "Wordspace Symbols" },
        },
        g = {
            name = "Goto",
            a = { "<CMD>CodeActionMenu<CR>", "Code Action" },
            p = { vim.lsp.buf.hover, "Show hover" },
            D = { vim.lsp.buf.declaration, "Goto declaration" },
            s = { vim.lsp.buf.signature_help, "Show signature help" },
            f = { "<cmd>lua vim.lsp.buf.format { async = true}<cr>", "Format" },
            b = { "<cmd>Telescope diagnostics bufnr=0 theme=get_dropdown layout_config={width=0.80} initial_mode=normal<CR>",
                "Telescope Buffer Diagnostics" },
            e = { "<cmd>Telescope diagnostics theme=get_dropdown layout_config={width=0.80} initial_mode=normal<CR>",
                "Telescope Diagnostics" },
            d = { "<cmd>Telescope lsp_definitions<CR>", "Goto Definition" },
            v = { "<cmd>:vertical resize +80<cr>:vsp<cr>:Telescope lsp_definitions<cr>:vertical resize 120<cr>",
                "Goto Definition Split" },
            o = { "<C-W>c<cmd>:vertical resize 120<cr>", "Goto Back Window" },
            r = { "<cmd>Telescope lsp_references theme=get_dropdown layout_config={width=0.80} initial_mode=normal<CR>",
                "Telescope references" },
            c = { "<cmd>Telescope lsp_incoming_calls theme=get_dropdown layout_config={width=0.8} initial_mode=normal<CR>",
                "Telescope incoming calls" },
            i = { "<cmd>Telescope lsp_implementations<CR>", "Telescope Implementation" },
            h = { "<cmd>Telescope lsp_document_symbols<CR>", "Telescope Document Symbols" },
            w = { "<cmd>Telescope lsp_workspace_symbols<CR>", "Telescope Workspace Symbols" },
            j = { vim.diagnostic.goto_next, "Next Diagnostic" },
            k = { vim.diagnostic.goto_prev, "Prev Diagnostic" },
            n = { "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>j", "Comment line" },
            l = {
                function()
                    local config = lvim.lsp.diagnostics.float
                    config.scope = "line"
                    vim.diagnostic.open_float(0, config)
                end,
                "Show line diagnostics",
            }
        }
    })

    wk.register({
        r = {
            q = { "<CMD>'<,'>SqlsExecuteQuery<CR>", "Sqls Run" },
            i = { "<CMD>SqlsSwitchConnection<CR>", "Sqls Connection" },
        },
        g = {
            f = { "<cmd>:lua vim.lsp.buf.range_formatting()<CR>", "Format range" }
        }
    }, {
        mode = "v",
        prefix = "<leader>"
    })
end



lvim.builtin.nvimtree.setup.view.mappings.list = {
    { key = { "<ESC>", "q", "<C-x>" }, action = "close",           mode = "n" },
    { key = { "l", "<CR>", "o" },      action = "edit",            mode = "n" },
    { key = "h",                       action = "close_node" },
    { key = "v",                       action = "vsplit" },
    { key = "x",                       action = "split" },
    { key = "C",                       action = "cd" },
    { key = "<C-k>",                   action = "" },
    { key = "f",                       action = "" },
    { key = "<C-p>",                   action = "toggle_file_info" },
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
        ["<C-Q>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
        ["<C-Y>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<C-D>"] = actions.preview_scrolling_down,
        ["<C-F>"] = actions.preview_scrolling_up,
        ["<CR>"] = actions.select_default,
    },
    -- for normal mode
    n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-D>"] = actions.preview_scrolling_down,
        ["<C-F>"] = actions.preview_scrolling_up,
        ["<C-Y>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<C-c>"] = actions.close,
        ["<C-Q>"] = actions.close,
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
