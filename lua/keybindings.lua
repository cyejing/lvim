-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

lvim.keys.normal_mode = {
    -- basic
    ["s"] = "",
    ["g"] = "",
    ["<C-E>"] = "$",
    ["<C-A>"] = "^",
    ["\\"] = "$",
    ["d\\"] = "d$",
    ["r"] = "<C-r>",

    -- move
    ["<C-J>"] = "8j",
    ["<C-K>"] = "8k",
    -- ["<C-d>"] = "15j",
    -- ["<C-u>"] = "15k",

    -- Better window movement
    ["<C-Left>"] = "<C-w>h",
    ["<C-Down>"] = "<C-w>j",
    ["<C-Up>"] = "<C-w>k",
    ["<C-Right>"] = "<C-w>l",
    ["<C-H>"] = "<C-w>W",
    ["<C-L>"] = "<C-w>w",
    ["<C-X>"] = "<C-w>c",
    ["<S-X>"] = ":Bdelete!<CR>",

    -- Resize with arrows
    ["<S-Up>"] = ":resize -2<CR>",
    ["<S-Down>"] = ":resize +2<CR>",
    ["<S-Left>"] = ":vertical resize -2<CR>",
    ["<S-Right>"] = ":vertical resize +2<CR>",
    ["<C-P>"] = ":vertical resize 120<CR>",

    -- vim-surround : -yss insert, cs replace, ds delete, ysiw insert word
    ["gn"] = "<CMD>lua require('Comment.api').toggle_current_linewise()<CR>j",

    -- Tab switch buffer
    ["<S-L>"] = ":BufferLineCycleNext<CR>",
    ["<S-H>"] = ":BufferLineCyclePrev<CR>",

    -- Move current line / block with Alt-j/k a la vscode.
    ["<A-j>"] = ":m .+1<CR>==",
    ["<A-k>"] = ":m .-2<CR>==",

    -- QuickFix
    ["]q"] = ":cnext<CR>",
    ["[q"] = ":cprev<CR>",

    ["<C-Q>"] = "<CMD>lua vim.lsp.buf.formatting()<CR>",
    ["<C-=>"] = "<CMD>lua vim.lsp.buf.formatting()<CR>",
    ["<C-Y>"] = ":call QuickFixToggle()<CR>",

}

lvim.keys.insert_mode = {
    ["kk"] = "<ESC>",
    -- 'jk' for quitting insert mode
    ["jk"] = "jk",
    -- 'kj' for quitting insert mode
    ["kj"] = "kj",
    -- 'jj' for quitting insert mode
    ["jj"] = "<ESC>",
    ["<C-Q>"] = "<ESC>",

    ["<C-A>"] = "<ESC>I",
    ["<C-E>"] = "<ESC>A",
    ["<C-J>"] = "<Down>",
    ["<C-K>"] = "<Up>",
    ["<C-L>"] = "<Right>",
    ["<C-B>"] = "<ESC>ea<C-W>",
    ["<C-P>"] = "<ESC>pa",

    -- code
    ["<C-=>"] = "<ESC>v<CMD>:lua vim.lsp.buf.range_formatting()<CR><ESC>A",

    ["C-T"] = "W",

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

lvim.keys.term_mode = {
    -- Terminal window navigation
    -- ["<ESC>"] = "<C-\\><C-N>",
    -- ["<C-[>"] = "<C-\\><C-N>",
    ["<C-Q>"] = "<C-\\><C-N>",
    ["<C-h>"] = "<C-\\><C-N><C-w>h",
    ["<C-j>"] = "<C-\\><C-N><C-w>j",
    ["<C-k>"] = "<C-\\><C-N><C-w>k",
    ["<C-l>"] = "<C-\\><C-N><C-w>l",
}

lvim.keys.visual_mode = {
    -- Better indenting
    ["<"] = "<gv",
    [">"] = ">gv",
    ["\\"] = "$",
    ["<C-E>"] = "$",
    ["<C-A>"] = "^",

    ["<C-Q>"] = "<ESC>",

    ["<C-j>"] = "8j",
    ["<C-k>"] = "8k",

    ["gn"] = "<ESC><CMD>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>",
    ["<C-=>"] = "<CMD>:lua vim.lsp.buf.range_formatting()<CR>",

    ["<A-j>"] = ":m '>+1<CR>gv-gv",
    ["<A-k>"] = ":m '<-2<CR>gv-gv",

}

lvim.keys.visual_block_mode = {
    -- Move selected line / block of text in visual mode
    ["K"] = ":move '<-2<CR>gv-gv",
    ["J"] = ":move '>+1<CR>gv-gv",

    ["<C-Q>"] = "<ESC>",
    -- Move current line / block with Alt-j/k ala vscode.
    ["<A-j>"] = ":m '>+1<CR>gv-gv",
    ["<A-k>"] = ":m '<-2<CR>gv-gv",
}

-- lvim.keys.command_mode = {
-- navigate tab completion with <c-j> and <c-k>
-- runs conditionally
-- ["<C-j>"] = { 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true } },
-- ["<C-k>"] = { 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true } },
-- }

--fix who bind?
vim.keymap.set('i', "C", "C")
