local cmp = require("cmp")

lvim.builtin.cmp.formatting.fields = { "abbr", "kind", "menu" }

lvim.builtin.cmp.formatting.kind_icons = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = ""
}

-- lvim.builtin.cmp.mapping['<CR>'] = cmp.mapping.confirm({ select = true })
-- lvim.builtin.cmp.mapping["<C-k>"] = cmp.mapping.select_prev_item()
-- lvim.builtin.cmp.mapping["<C-j>"] = cmp.mapping.select_next_item()
-- lvim.builtin.cmp.mapping["<C-d>"] = cmp.mapping.scroll_docs(4)
-- lvim.builtin.cmp.mapping["<C-f>"] = cmp.mapping.scroll_docs(-4)

-- Use buffer source for `/`.
-- cmp.setup.cmdline("/", {
    -- sources = {
        -- { name = "buffer" },
    -- },
-- })

-- Use cmdline & path source for ':'.
-- cmp.setup.cmdline(":", {
    -- mapping = cmp.mapping.preset.cmdline(),
    -- sources = cmp.config.sources({
        -- { name = "path" },
    -- }, {
        -- { name = "cmdline" },
    -- }),
-- })

