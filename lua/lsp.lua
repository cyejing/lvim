-- treesitter
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
    "bash", "c", "javascript",
    "json", "lua", "python",
    "typescript", "tsx", "css",
    "rust", "java", "yaml",
    "html", "http", "vue", "sql",
}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings
lvim.lsp.installer.setup.ensure_installed = {
    "sumneko_lua",
    "cssls",
    "html",
    "jsonls",
    "yamlls",
    "sqls",
    "volar",
    "tailwindcss",
    "gopls",
    "lemminx",
    "zk",
}

---@usage disable automatic installation of servers
lvim.lsp.automatic_servers_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "rust_analyzer", "jdtls", "tsserver" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)



--- lspconfig setup
require 'lspconfig'.volar.setup {
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
}


-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    { command = "black", filetypes = { "python" } },
    { command = "isort", filetypes = { "python" } },
    {
        -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
        command = "prettier",
        ---@usage arguments to pass to the formatter
        -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
        extra_args = {
            "--print-width", "120",
            "--no-semi",
            "--single-quote",
            "--tab-width", "2",
            "--trailing-comma", "none",
            "--prose-wrap", "always",
        },
        ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
        filetypes = { "typescript", "typescriptreact", "javascript", "vue", "json", "jsonc", "html", "css" },
    }
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
    { command = "flake8", filetypes = { "python" } },
    -- {
    --     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    --     command = "shellcheck",
    --     ---@usage arguments to pass to the formatter
    --     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    --     extra_args = { "--severity", "warning" },
    -- },
    -- {
    --     command = "eslint",
    --     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    --     filetypes = { "javascript", "python" },
    -- },
}
