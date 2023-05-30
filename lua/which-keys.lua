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
mappings["bv"] = { "<CMD>vnew<CR>", "Buffer Create vertical" }
-- mappings["bl"] = { "<CMD>BufferLineMoveNext<CR>", "Buffer move next" }
-- mappings["bh"] = { "<CMD>BufferLineMovePrev<CR>", "Buffer move prev" }


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
        ["v"] = {
            ["<leader>rr"] = { ":SqlsExecuteQuery<CR>", "SqlsExecuteQuery" },
            ["<leader>rv"] = { ":SqlsExecuteQueryVertical<CR>", "SqlsExecuteQueryVertical" },

        },
        ["n"] = {
            ["<leader>rr"] = { "v:SqlsExecuteQuery<CR>", "SqlsExecuteQuery" },
            ["<leader>rv"] = { "v:SqlsExecuteQueryVertical<CR>", "SqlsExecuteQueryVertical" },
            ["<leader>rn"] = { ":SqlsSwitchConnection<CR>", "SqlsSwitchConnection" },
            ["<leader>rd"] = { ":SqlsSwitchDatabase<CR>", "SqlsSwitchDatabase" },
        }
    }
end

lvim.lsp.buffer_mappings.normal_mode = {}

-- which-key register
local normal_key_mappings = {
    s = {
        name = "File",                                       -- optional group name
        p = { "<cmd>Telescope projects layout_config={width=0.6}<cr>", "Open Projects" },
        f = { "<cmd>Telescope git_files<cr>", "Find File" }, -- create a binding with label
        t = { function()
            local word = vim.fn.expand "<cword>";
            require('telescope.builtin').live_grep({
                default_text = word,
                theme = "get_dropdown",
                layout_config = { width = 0.8, preview_cutoff = 30 }
            })
        end, "Live Grep Current Word" },
        T = { "<cmd>Telescope live_grep theme=get_dropdown layout_config={width=0.8}<cr>", "Live Grep Word" },
        y = { function()
            local word = vim.fn.expand "<cword>";
            require('telescope.builtin').current_buffer_fuzzy_find({
                default_text = word,
                fuzzy = false,
                theme = "get_dropdown",
                layout_config = { width = 0.8, preview_cutoff = 30 }
            })
        end, "Find Buffer Current Word" },
        Y = { "<cmd>Telescope current_buffer_fuzzy_find fuzzy=false theme=get_dropdown layout_config={width=0.8}<cr>",
            "Find Buffer Word" },
        b = { "<cmd>Telescope buffers initial_mode=insert<cr>", "Buffers List" },
        c = {
            "<cmd>Telescope git_status theme=get_ivy layout_config={height=0.7,preview_width=0.7} initial_mode=normal<cr>",
            "Find Git Change" },
        o = { "<cmd>Telescope jumplist<cr>", "Find jumplist" },
        s = { "<cmd>Telescope oldfiles<CR>", "Recently files" },
        h = { "<cmd>Telescope lsp_document_symbols<CR>", "Document Symbols" },
        w = { "<cmd>Telescope lsp_workspace_symbols<CR>", "Wordspace Symbols" },
        -- m = { "<cmd>NvimTreeToggle<CR>", "Explorer Toggle" }
        m = { "`", "Jump mark" }
    },
    K = { vim.lsp.buf.hover, "Show hover" },
    g = {
        name = "Goto",
        a = { "<CMD>CodeActionMenu<CR>", "Code Action" },
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
        R = { "<cmd>Telescope lsp_incoming_calls theme=get_dropdown layout_config={width=0.8} initial_mode=normal<CR>",
            "Incoming calls" },
        i = { "<cmd>Telescope lsp_implementations<CR>", "Implementation" },
        j = { vim.diagnostic.goto_next, "Next Diagnostic" },
        k = { vim.diagnostic.goto_prev, "Prev Diagnostic" },
        n = { "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>j", "Comment line" },
        l = {
            function()
                local float = vim.diagnostic.config().float

                if float then
                    local config = type(float) == "table" and float or {}
                    config.scope = "line"

                    vim.diagnostic.open_float(config)
                end
            end,
            "Show line diagnostics",
        }
    },
    c = {
        name = "Buffers",
        l = { "<cmd>BufferLineCloseRight<cr>", "Close all to the left" },
        h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
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

-- lvim cmp mappings
local cmp = require("cmp")
lvim.builtin.cmp.mapping["<C-D>"] = cmp.mapping.scroll_docs(4);
lvim.builtin.cmp.mapping["<C-F>"] = cmp.mapping.scroll_docs(-4);



-- lvim builtin mappings
local function on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function telescope_find_files(_)
        require("lvim.core.nvimtree").start_telescope "find_files"
    end

    local function telescope_live_grep(_)
        require("lvim.core.nvimtree").start_telescope "live_grep"
    end

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    api.config.mappings.default_on_attach(bufnr)

    local useful_keys = {
        ["<ESC>"] = { api.tree.close, opts "Close" },
        ["q"] = { api.tree.close, opts "Close" },
        ["<C-x>"] = { api.tree.close, opts "Close" },

        ["l"] = { api.node.open.edit, opts "Open" },
        ["o"] = { api.node.open.edit, opts "Open" },
        ["<CR>"] = { api.node.open.edit, opts "Open" },

        ["h"] = { api.node.navigate.parent_close, opts "Close Directory" },
        ["C"] = { api.tree.change_root_to_node, opts "CD" },

        ["st"] = { telescope_live_grep, opts "Telescope Live Grep" },
        ["sf"] = { telescope_find_files, opts "Telescope Find File" },

        ["v"] = { api.node.open.vertical, opts "Open: Vertical Split" },
        ["s"] = { api.node.open.horizontal, opts "Open: Horizontal Split" },
        ["S"] = { api.node.run.system, opts "Open: Run System" },
        ["<C-p>"] = { api.node.show_info_popup, opts "Info" },
        ["<C-k>"] = { "8k", opts "None" },

        ["G"] = { api.tree.toggle_hidden_filter, opts "Toggle Dotfiles" },

        ["H"] = { api.node.navigate.sibling.first, opts "First Sibling" },
        ["L"] = { api.node.navigate.sibling.last, opts "Last Sibling" },
        ["J"] = { api.node.navigate.sibling.next, opts "Next Sibling" },
        ["K"] = { api.node.navigate.sibling.prev, opts "Prev Sibling" },

        ["<C-o>"] = { require("func").edit_or_open, opts "Edit Or Open" },
        ["O"] = { require("func").edit_or_open, opts "Edit Or Open" },
    }

    require("lvim.keymappings").load_mode("n", useful_keys)
end

lvim.builtin.nvimtree.setup.on_attach = on_attach



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
        ["<C-D>"] = actions.preview_scrolling_down,
        ["<C-F>"] = actions.preview_scrolling_up,
        ["<C-,>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<CR>"] = actions.select_default,
        ["<C-o>"] = actions.select_default,
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
        ["<C-s>"] = actions.select_horizontal,
    },
    -- for normal mode
    n = {
        ["<C-c>"] = actions.close,
        ["<C-Q>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-D>"] = actions.preview_scrolling_down,
        ["<C-F>"] = actions.preview_scrolling_up,
        ["<C-,>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<CR>"] = actions.select_default,
        ["<C-o>"] = actions.select_default,
        ["<C-s>"] = actions.select_horizontal,
    },
}

return M
