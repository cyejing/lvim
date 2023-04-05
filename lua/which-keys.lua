local M        = {}

local mappings = lvim.builtin.which_key.mappings
mappings["e"]  = { "<cmd>NvimTreeFocus<CR>", "Explorer" }
mappings["m"]  = { "<cmd>NvimTreeToggle<CR>", "Explorer Toggle" }
mappings["p"]  = { "<CMD>Telescope projects layout_config={width=0.6}<CR>", "Projects" }
-- mappings["o"]  = { "<CMD>Telescope oldfiles<CR>", "Recently files" }
mappings["ss"] = { "<CMD>Telescope oldfiles<CR>", "Recently files" }
mappings["h"]  = { "<CMD>edit ~/.cache/lvim/project_nvim/project_history<CR>", "Edit Projects" }
mappings["h"]  = { "<CMD>SymbolsOutline<CR>", "SymbolsOutline" }
mappings["x"]  = { "<CMD>only<CR>", "Close All Windows" }
mappings["S"]  = { "<CMD>lua require('spectre').open()<CR>", "Open Spectre" }
mappings["c"]  = {}

--  <leader>+b
mappings["bx"] = { "<CMD>:BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>", "Close All Buffer" }
mappings["bs"] = { ":e ~/buffer<cr>", "Open Scribble" }
mappings["bm"] = { ":e ~/buffer.md<cr>", "Open Scribble Markdown" }
mappings["br"] = { ":e ~/reuqest.http<cr>", "Open Reuqest" }
mappings["bc"] = { "<CMD>new<CR>", "Buffer Create" }
mappings["bv"] = { "<CMD>vnew<CR>", "Buffer Create" }


-- <leader>+g
mappings["gg"] = {}
mappings["gg"] = { "<CMD>lua require 'func'.gitui_toggle()<CR>", "Gitui" }
mappings["gh"] = { "<CMD>DiffviewFileHistory<CR>", "Diffview History" }
mappings["gf"] = { "<CMD>DiffviewFileHistory %<CR>", "Diffview File" }
mappings["gi"] = { "<CMD>DiffviewOpen<CR>", "Diffview Open" }
mappings["gx"] = { "<CMD>DiffviewClose<CR>", "Diffview Close" }

-- <leader>+n
mappings["nn"] = { "<CMD>tab term<CR>", "New Tab Term" }


function M.rest_key_mappings()
    return {
        ["<leader>rr"] = { "<Plug>RestNvim", "Rest Run" },
        ["<leader>rc"] = { "<Plug>RestNvimPreview", "Rest Perview" },
        ["<leader>rl"] = { "<Plug>RestNvimLast", "Rest Run Last" }
    }
end

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

function M.sqls_key_mappings()
    return {
        ["<leader>rr"] = { "v", ":SqlsExecuteQuery<CR>", "SqlsExecuteQuery" },
        ["<leader>rv"] = { "v", ":SqlsExecuteQueryVertical<CR>", "SqlsExecuteQueryVertical" },
        ["<leader>rn"] = { "n", ":SqlsSwitchConnection<CR>", "SqlsSwitchConnection" },
        ["<leader>rd"] = { "n", ":SqlsSwitchDatabase<CR>", "SqlsSwitchDatabase" },
    }
end

lvim.lsp.buffer_mappings.normal_mode = {}

-- which-key register
local normal_key_mappings = {
    s = {
        name = "File",                                       -- optional group name
        p = { "<cmd>Telescope projects layout_config={width=0.6}<cr>", "Open Projects" },
        f = { "<cmd>Telescope git_files<cr>", "Find File" }, -- create a binding with label
        -- T = { "<cmd>Telescope live_grep theme=get_dropdown layout_config={width=0.8}<cr>", "Find All Text" },
        t = { function()
            local word = vim.fn.expand "<cword>";
            require('telescope.builtin').live_grep({
                default_text = word,
                theme = "get_dropdown",
                layout_config = { width = 0.8, preview_cutoff = 30 }
            })
        end, "Live Grep Word" },
        T = { "<cmd>Telescope grep_string theme=get_dropdown layout_config={width=0.8}<cr>", "Grep Word" },
        y = { function()
            local word = vim.fn.expand "<cword>";
            require('telescope.builtin').current_buffer_fuzzy_find({
                default_text = word,
                fuzzy = false,
                theme = "get_dropdown",
                layout_config = { width = 0.8, preview_cutoff = 30 }
            })
        end, "Find Buffer Word" },
        b = { "<cmd>Telescope buffers<cr>", "Buffers List" },
        c = {
            "<cmd>Telescope git_status theme=get_ivy layout_config={height=0.7,preview_width=0.7} initial_mode=normal<cr>",
            "Find Git Change" },
        o = { "<cmd>Telescope jumplist<cr>", "Find jumplist" },
        s = { "<cmd>Telescope oldfiles<CR>", "Recently files" },
        h = { "<cmd>Telescope lsp_document_symbols layout_config={preview_width=0.6}<CR>", "Document Symbols" },
        w = { "<cmd>Telescope lsp_workspace_symbols layout_config={preview_width=0.6}<CR>", "Wordspace Symbols" },
        m = { "<cmd>NvimTreeToggle<CR>", "Explorer Toggle" }
    },
    K = { vim.lsp.buf.hover, "Show hover" },
    g = {
        name = "Goto",
        a = { "<CMD>CodeActionMenu<CR>", "Code Action" },
        -- a = { "<CMD>Telescope code<CR>", "Code Action" },
        D = { vim.lsp.buf.declaration, "Goto declaration" },
        s = { vim.lsp.buf.signature_help, "Show signature help" },
        f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
        e = { "<cmd>Telescope diagnostics theme=get_dropdown layout_config={width=0.80} initial_mode=normal<CR>",
            "Diagnostics" },
        b = { "<cmd>Telescope diagnostics bufnr=0 theme=get_dropdown layout_config={width=0.80} initial_mode=normal<CR>",
            "Buffer Diagnostics" },
        d = { "<cmd>Telescope lsp_definitions<CR>", "Goto Definition" },
        v = { "<cmd>:vertical resize +80<cr>:vsp<cr>:Telescope lsp_definitions<cr>:vertical resize 120<cr>",
            "Goto Definition Split" },
        o = { "<C-W>c<cmd>:vertical resize 120<cr>", "Goto Back Window" },
        r = { "<cmd>Telescope lsp_references theme=get_dropdown layout_config={width=0.80} initial_mode=normal<CR>",
            "References" },
        c = { "<cmd>Telescope lsp_incoming_calls theme=get_dropdown layout_config={width=0.8} initial_mode=normal<CR>",
            "Incoming calls" },
        i = { "<cmd>Telescope lsp_implementations<CR>", "Implementation" },
        -- h = { "<cmd>Telescope lsp_document_symbols<CR>", "Document Symbols" },
        -- w = { "<cmd>Telescope lsp_workspace_symbols<CR>", "Workspace Symbols" },
        j = { vim.diagnostic.goto_next, "Next Diagnostic" },
        k = { vim.diagnostic.goto_prev, "Prev Diagnostic" },
        n = { "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>j", "Comment line" },
        l = {
            function()
                local config = lvim.lsp.diagnostics.float
                config.scope = "line"
                vim.diagnostic.open_float(config)
            end,
            "Show line diagnostics",
        }
    }
}
local visual_key_mapping = {
    g = {
        f = { "<cmd>lua vim.lsp.buf.format()<CR><ESC>", "Format range" },
        n = { "<ESC><CMD>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", "Comment range" },
    },
    s = {
        t = { function()
            local text = vim.getVisualSelection()
            require('telescope.builtin').live_grep({
                default_text = text,
                theme = "get_dropdown",
                layout_config = { width = 0.8, preview_cutoff = 30 }
            })
        end, "Find All Text" },
        y = { function()
            local text = vim.getVisualSelection()
            require('telescope.builtin').current_buffer_fuzzy_find({
                default_text = text,
                fuzzy = false,
                theme = "get_dropdown",
                layout_config = { width = 0.8, preview_cutoff = 30 }
            })
        end, "Find Buffer Text" },
    }
}
lvim.builtin.which_key.on_config_done = function(wk)
    wk.register(normal_key_mappings)

    wk.register(visual_key_mapping, {
        mode = "v",
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
    { key = "G",                       action = "toggle_dotfiles" },
    { key = "H",                       action = "first_sibling" },
    { key = "J",                       action = "next_sibling" },
    { key = "K",                       action = "prev_sibling" },
    { key = "L",                       action = "last_sibling" },
    --
    {
        key = "sf",
        action = "telescope_find_files",
        action_cb = function()
            require("lvim.core.nvimtree").start_telescope "find_files"
        end
    },
    {
        key = "st",
        action = "telescope_live_grep",
        action_cb = function()
            require("lvim.core.nvimtree").start_telescope "live_grep"
        end
    },
    { key = { "<C-o>", "O" }, action = "edit_and_quit", action_cb = require("func").edit_or_open },
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
        ["<C-D>"] = actions.preview_scrolling_up,
        ["<C-F>"] = actions.preview_scrolling_down,
        ["<C-Y>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<CR>"] = actions.select_default,
        ["<C-o>"] = actions.select_default,
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
    },
    -- for normal mode
    n = {
        ["<C-c>"] = actions.close,
        ["<C-Q>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-D>"] = actions.preview_scrolling_up,
        ["<C-F>"] = actions.preview_scrolling_down,
        ["<C-Y>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<CR>"] = actions.select_default,
        ["<C-o>"] = actions.select_default,
    },
}

return M
