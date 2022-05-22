-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
--lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

lvim.keys.normal_mode = {
  ["s"] = "",
  ["f"] = "",
  ["g"] = "",

  ["<C-s>"] = ":w<cr>",
  -- Better window movement
  ["<C-h>"] = "<C-w>h",
  ["<C-j>"] = "<C-w>j",
  ["<C-k>"] = "<C-w>k",
  ["<C-l>"] = "<C-w>l",

  -- Resize with arrows
  ["<C-Up>"] = ":resize -2<CR>",
  ["<C-Down>"] = ":resize +2<CR>",
  ["<C-Left>"] = ":vertical resize -2<CR>",
  ["<C-Right>"] = ":vertical resize +2<CR>",

  -- Tab switch buffer
  ["<S-L>"] = ":BufferLineCycleNext<CR>",
  ["<S-H>"] = ":BufferLineCyclePrev<CR>",

  -- Move current line / block with Alt-j/k a la vscode.
  ["<S-j>"] = ":m .+1<CR>==",
  ["<S-k>"] = ":m .-2<CR>==",

  -- QuickFix
  ["]q"] = ":cnext<CR>",
  ["[q"] = ":cprev<CR>",
  ["<C-q>"] = ":call QuickFixToggle()<CR>",

  -- ["s"] = "",
  -- ["a"] = "",
}

lvim.keys.insert_mode = {
  -- Move current line / block with Alt-j/k ala vscode.
  ["<A-j>"] = "<Esc>:m .+1<CR>==gi",
  -- Move current line / block with Alt-j/k ala vscode.
  ["<A-k>"] = "<Esc>:m .-2<CR>==gi",
  -- navigation
  ["<C-Up>"] = "<C-\\><C-N><C-w>k",
  ["<C-Down>"] = "<C-\\><C-N><C-w>j",
  ["<C-Left>"] = "<C-\\><C-N><C-w>h",
  ["<C-Right>"] = "<C-\\><C-N><C-w>l",
}

lvim.keys.term_mode = {
  -- Terminal window navigation
  ["<C-h>"] = "<C-\\><C-N><C-w>h",
  ["<C-j>"] = "<C-\\><C-N><C-w>j",
  ["<C-k>"] = "<C-\\><C-N><C-w>k",
  ["<C-l>"] = "<C-\\><C-N><C-w>l",
}

lvim.keys.visual_mode = {
  -- Better indenting
  ["<"] = "<gv",
  [">"] = ">gv",

  -- ["p"] = '"0p',
  -- ["P"] = '"0P',
}

lvim.keys.visual_block_mode = {
  -- Move selected line / block of text in visual mode
  ["K"] = ":move '<-2<CR>gv-gv",
  ["J"] = ":move '>+1<CR>gv-gv",

  -- Move current line / block with Alt-j/k ala vscode.
  ["<A-j>"] = ":m '>+1<CR>gv-gv",
  ["<A-k>"] = ":m '<-2<CR>gv-gv",
}

lvim.keys.command_mode = {
  -- navigate tab completion with <c-j> and <c-k>
  -- runs conditionally
  ["<C-j>"] = { 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true } },
  ["<C-k>"] = { 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true } },
}



-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
-- }
