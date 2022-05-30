-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

lvim.keys.normal_mode = {
    -- basic
    ["s"] = "",
    ["f"] = "",
    ["g"] = "",
    ["\\"] = "$",
    ["r"] = "<C-r>",

    -- move
    ["<C-J>"] = "10j",
    ["<C-K>"] = "10k",
    -- ["<C-d>"] = "15j",
    -- ["<C-u>"] = "15k",

    -- Better window movement
    ["<C-Left>"] = "<C-w>h",
    ["<C-Down>"] = "<C-w>j",
    ["<C-Up>"] = "<C-w>k",
    ["<C-Right>"] = "<C-w>l",
    ["<C-H>"] = "<C-w>W",
    ["<C-L>"] = "<C-w>w",
    ["<C-C>"] = "<C-w>c",
    ["<C-C>b"] = ":Bdelete!<CR>",
    ["<S-X>"] = ":Bdelete!<CR>",

    -- Resize with arrows
    ["<S-Up>"] = ":resize -2<CR>",
    ["<S-Down>"] = ":resize +2<CR>",
    ["<S-Left>"] = ":vertical resize -2<CR>",
    ["<S-Right>"] = ":vertical resize +2<CR>",


    -- vim-surround : -yss insert, cs replace, ds delete, ysiw insert word
    -- lsp
    ["<C-n>"] = "<CMD>lua require('Comment.api').toggle_current_linewise()<CR>j",


    -- Tab switch buffer
    ["<S-L>"] = ":BufferLineCycleNext<CR>",
    ["<S-H>"] = ":BufferLineCyclePrev<CR>",
    -- Navigate buffers
    --["<Tab>"] = ":bnext<CR>",
    --["<S-Tab>"] = ":bprevious<CR>",

    -- Move current line / block with Alt-j/k a la vscode.
    ["<A-j>"] = ":m .+1<CR>==",
    ["<A-k>"] = ":m .-2<CR>==",

    -- QuickFix
    ["]q"] = ":cnext<CR>",
    ["[q"] = ":cprev<CR>",
    ["<C-Q>"] = ":call QuickFixToggle()<CR>",
    -- ["<C-q>"] = "<CMD>TroubleToggle<CR>",

}

lvim.keys.insert_mode = {
    ["kk"] = "<ESC>",
    -- 'jk' for quitting insert mode
    ["jk"] = "jk",
    -- 'kj' for quitting insert mode
    ["kj"] = "kj",
    -- 'jj' for quitting insert mode
    ["jj"] = "<ESC>",

    ["<C-a>"] = "<HOME>",
    ["<C-e>"] = "<END>",
    ["<C-b>"] = "<ESC>ea<C-W>",

    -- code
    ["<C-\\>"] = "<ESC>v<CMD>:lua vim.lsp.buf.range_formatting()<CR><ESC>A",

    ["C-T"] = "W",

    -- Move current line / block with Alt-j/k ala vscode.
    ["<A-j>"] = "<Esc>:m .+1<CR>==gi",
    -- Move current line / block with Alt-j/k ala vscode.
    ["<A-k>"] = "<Esc>:m .-2<CR>==gi",
    -- navigation
    ["<A-Up>"] = "<C-\\><C-N><C-w>k",
    ["<A-Down>"] = "<C-\\><C-N><C-w>j",
    ["<A-Left>"] = "<C-\\><C-N><C-w>h",
    ["<A-Right>"] = "<C-\\><C-N><C-w>l",
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
    ["\\"] = "$",

    ["<C-j>"] = "10j",
    ["<C-k>"] = "10k",

    ["<C-N>"] = "<ESC><CMD>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>"
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

--fix who bind?
vim.keymap.set('i', "C", "C")
