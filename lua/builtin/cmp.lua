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

lvim.builtin.cmp.mapping['<CR>'] = cmp.mapping.confirm({ select = true })
-- lvim.builtin.cmp.mapping['<CR>'] = cmp.mapping(function(fallback)
    -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
    -- if cmp.visible() then
        -- local entry = cmp.get_selected_entry()
        -- if not entry then
            -- cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        -- else
            -- cmp.confirm()
        -- end
    -- else
        -- fallback()
    -- end
-- end, { "i", "s", "c", })

-- Use buffer source for `/`.
cmp.setup.cmdline("/", {
    sources = {
        { name = "buffer" },
    },
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        { name = "cmdline" },
    }),
})
