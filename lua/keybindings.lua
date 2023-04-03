-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

lvim.keys.normal_mode = {
    -- basic
    ["s"] = "",
    ["g"] = "",
    ["<C-e>"] = "$",
    ["<C-a>"] = "^",
    ["<CR>"] = "<CMD>noh<CR>",
    -- ["\\"] = "$",
    -- ["d\\"] = "d$",
    ["r"] = "<C-r>",
    -- move
    ["<C-j>"] = "8j",
    ["<C-k>"] = "8k",
    -- Better window movement
    ["<C-Left>"] = "<C-w>h",
    ["<C-Down>"] = "<C-w>j",
    ["<C-Up>"] = "<C-w>k",
    ["<C-Right>"] = "<C-w>l",
    ["<C-h>"] = "<C-w>W",
    ["<C-l>"] = "<C-w>w",
    ["<C-x>"] = "<C-w>c",
    ["<S-x>"] = ":Bdelete!<CR>",
    -- Resize with arrows
    ["<S-Up>"] = ":resize -2<CR>",
    ["<S-Down>"] = ":resize +2<CR>",
    ["<S-Left>"] = ":vertical resize -2<CR>",
    ["<S-Right>"] = ":vertical resize +2<CR>",
    -- vim-surround : -yss insert, cs replace, ds delete, ysiw insert word
    ["<C-/>"] = "<CMD>lua require('Comment.api').toggle.linewise.current()<CR>j",
    -- Tab switch buffer
    ["<S-l>"] = ":BufferLineCycleNext<CR>",
    ["<S-h>"] = ":BufferLineCyclePrev<CR>",
    -- QuickFix
    -- ["]q"] = ":cnext<CR>",
    -- ["[q"] = ":cprev<CR>",

    ["<C-q>"] = "<CMD>lua vim.lsp.buf.format {async=true}<CR>",
    ["<C-s>"] = "==",
    ["<C-y>"] = ":call QuickFixToggle()<CR>",
    --
    ["<C-n>"] = "<CMD>ToggleTermToggleAll<CR>",
    ["<C-m>"] = "<CMD>NvimTreeToggle<CR>",
    -- Move current line / block with Alt-j/k a la vscode.
    ["<A-j>"] = ":m .+1<CR>==",
    ["<A-k>"] = ":m .-2<CR>==",
}

lvim.keys.insert_mode = {
    ["kk"] = "<ESC>",
    -- 'jk' for quitting insert mode
    ["jk"] = "jk",
    -- 'kj' for quitting insert mode
    ["kj"] = "kj",
    -- 'jj' for quitting insert mode
    ["jj"] = "<ESC>",
    ["<C-q>"] = "<ESC>",
    -- like bash
    ["<C-s>"] = "<C-f>", -- noremap
    ["<C-a>"] = "<ESC>I",
    ["<C-e>"] = "<ESC>A",
    ["<C-f>"] = "<Right>",
    ["<C-l>"] = "<Right>",
    ["<C-b>"] = "<Left>",
    ["<A-f>"] = "<C-o>w",
    ["<A-b>"] = "<C-o>b",
    ["<C-d>"] = "<del>",
    ["<C-k>"] = "<C-o>C",
    ["<C-y>"] = "<C-o>h<c-o>p",
    ["<C-x><C-u>"] = "<C-o>u",
    -- Move current line / block with Alt-j/k ala vscode.
    ["<A-j>"] = "<Esc>:m .+1<CR>==gi",
    -- Move current line / block with Alt-j/k ala vscode.
    ["<A-k>"] = "<Esc>:m .-2<CR>==gi",
    -- navigation
    -- ["<A-Up>"] = "<C-\\><C-N><C-w>k",
    -- ["<A-Down>"] = "<C-\\><C-N><C-w>j",
    -- ["<A-Left>"] = "<C-\\><C-N><C-w>h",
    -- ["<A-Right>"] = "<C-\\><C-N><C-w>l",
}

lvim.keys.visual_mode = {
    -- Better indenting
    ["<"] = "<gv",
    [">"] = ">gv",
    -- ["\\"] = "$",
    ["<C-e>"] = "$",
    ["<C-a>"] = "^",
    ["<C-q>"] = "<ESC>",
    ["<C-j>"] = "8j",
    ["<C-k>"] = "8k",
    ["<C-/>"] = "<ESC><CMD>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
    ["<C-s>"] = "=",
    ["<A-j>"] = ":m '>+1<CR>gv-gv",
    ["<A-k>"] = ":m '<-2<CR>gv-gv",
}

lvim.keys.term_mode = {
    -- ["<ESC>"] = "<C-\\><C-N>",
    -- ["<C-[>"] = "<C-\\><C-N>",
    ["<C-q>"] = "<C-\\><C-N>",
    -- ["<C-j>"] = "<C-\\><C-N>8j",
    ["<C-k>"] = "<C-\\><C-N>8k",
    -- ["<C-u>"] = "<C-\\><C-N>u",
    ["<C-n>"] = "<CMD>ToggleTermToggleAll<CR>",
    -- window max
    ["<C-t>"] = "<C-\\><C-N><C-w>_a",
    -- Terminal window navigation
    ["<C-h>"] = "<C-\\><C-N><C-w>h",
    -- ["<C-j>"] = "<C-\\><C-N><C-w>j",
    -- ["<C-k>"] = "<C-\\><C-N><C-w>k",
    ["<C-l>"] = "<C-\\><C-N><C-w>l",
}

lvim.keys.visual_block_mode = {
    -- Move selected line / block of text in visual mode
    -- ["K"] = ":move '<-2<CR>gv-gv",
    -- ["J"] = ":move '>+1<CR>gv-gv",

    ["<C-e>"] = "$",
    ["<C-a>"] = "^",
    ["<C-q>"] = "<ESC>",
    -- Move current line / block with Alt-j/k ala vscode.
    ["<A-j>"] = ":m '>+1<CR>gv-gv",
    ["<A-k>"] = ":m '<-2<CR>gv-gv",
}

lvim.keys.command_mode = {
    -- navigate tab completion with <c-j> and <c-k>
    -- runs conditionally
    ["<C-q>"] = "<ESC>",
    ["<C-j>"] = { 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true } },
    ["<C-k>"] = { 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true } },
}

--fix who bind?
vim.keymap.set('i', "C", "C")
