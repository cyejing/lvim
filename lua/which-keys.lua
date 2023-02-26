local M        = {}
local mappings = lvim.builtin.which_key.mappings
mappings["e"]  = { "<cmd>NvimTreeFocus<CR>", "Explorer" }
mappings["m"]  = { "<cmd>NvimTreeToggle<CR>", "Explorer Toggle" }
mappings["p"]  = { "<CMD>Telescope projects layout_config={width=0.6}<CR>", "Projects" }
mappings["o"]  = { "<CMD>Telescope oldfiles<CR>", "Recently files" }
mappings["h"]  = { "<CMD>edit ~/.cache/lvim/project_nvim/project_history<CR>", "Edit Projects" }
mappings["h"]  = { "<CMD>SymbolsOutline<CR>", "SymbolsOutline" }
mappings["x"]  = { "<CMD>only<CR>", "Close All Windows" }
mappings["S"]  = { "<CMD>lua require('spectre').open()<CR>", "Open Spectre" }

--  <leader>+b
mappings["bx"] = { "<CMD>:BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>", "Close All Buffer" }

-- <leader>+g
mappings["gg"] = {}
mappings["gg"] = { "<CMD>lua require 'plugin-config.func'.gitui_toggle()<CR>", "Gitui" }
mappings["gh"] = { "<CMD>DiffviewFileHistory<CR>", "Diffview History" }
mappings["gf"] = { "<CMD>DiffviewFileHistory %<CR>", "Diffview File" }
mappings["gi"] = { "<CMD>DiffviewOpen<CR>", "Diffview Open" }
mappings["gx"] = { "<CMD>DiffviewClose<CR>", "Diffview Close" }

--  <leader>+r
mappings["rh"] = { "<Plug>RestNvim", "Rest Run" }
mappings["rc"] = { "<Plug>RestNvimPreview", "Rest Perview" }
mappings["rl"] = { "<Plug>RestNvimLast", "Rest Run Last" }
function M.rust_key_mappings()
    return {
        ["<leader>rr"] = { "<CMD>lua require('rust-tools').runnables.runnables()<CR>", "RustRunnables" },
        ["<leader>rd"] = { "<CMD>RustDebuggables<CR>", "RustDebuggables" },
        ["<leader>rm"] = { "<CMD>lua require'rust-tools'.expand_macro.expand_macro()<CR>", "RustExpandMacro" },
        ["<leader>rj"] = { "<CMD>lua require'rust-tools'.move_item.move_item(false)<CR>", "RustMoveItemDown" },
        ["<leader>rk"] = { "<CMD>lua require'rust-tools'.move_item.move_item(true)<CR>", "RustMoveItemUp" },
        ["<leader>rp"] = { "<CMD>lua require'rust-tools'.parent_module.parent_module()<CR>", "RustParentModule" },
        ["<leader>rw"] = { "<CMD>RustReloadWorkspace<CR>", "RustReloadWorkspace" },
    }
end

lvim.lsp.buffer_mappings.normal_mode = {}

-- which-key register
local normal_key_mappings = {
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
    K = { vim.lsp.buf.hover, "Show hover" },
    g = {
        name = "Goto",
        a = { "<CMD>CodeActionMenu<CR>", "Code Action" },
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
}
local visual_key_mapping = {
    r = {
        q = { "<CMD>'<,'>SqlsExecuteQuery<CR>", "Sqls Run" },
    },
    g = {
        f = { "<cmd>:lua vim.lsp.buf.range_formatting()<CR>", "Format range" }
    }
}
lvim.builtin.which_key.on_config_done = function(wk)
    wk.register(normal_key_mappings)

    wk.register(visual_key_mapping, {
        mode = "v",
        prefix = "<leader>"
    })
end


-- lvim builtin mappings
lvim.builtin.nvimtree.setup.view.mappings.list = {
    { key = { "<ESC>", "q", "<C-x>" }, action = "close",           mode = "n" },
    { key = { "l", "<CR>", "o" },      action = "edit",            mode = "n" },
    { key = "h",                       action = "close_node" },
    { key = "v",                       action = "vsplit" },
    { key = "C",                       action = "cd" },
    --
    { key = "x",                       action = "split" },
    { key = "<C-k>",                   action = "" },
    { key = "<C-p>",                   action = "toggle_file_info" },
    { key = "<C-h>",                   action = "toggle_dotfiles" },
    { key = "H",                       action = "first_sibling" },
    { key = "J",                       action = "next_sibling" },
    { key = "K",                       action = "prev_sibling" },
    { key = "L",                       action = "last_sibling" },
    --
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
        ["<C-D>"] = actions.preview_scrolling_up,
        ["<C-F>"] = actions.preview_scrolling_down,
        ["<CR>"] = actions.select_default,
    },
    -- for normal mode
    n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-D>"] = actions.preview_scrolling_up,
        ["<C-F>"] = actions.preview_scrolling_down,
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


return M
