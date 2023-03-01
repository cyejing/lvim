local jdtls = require('jdtls')
local home = os.getenv('HOME')
local root_markers = { 'gradlew', '.git', 'mvnw' }
local root_dir = require('jdtls.setup').find_root(root_markers)
local workspace_dir = home .. '/.jdtls/workspace/' .. vim.fn.fnamemodify(root_dir, ':p:h:t')

-- This bundles definition is the same as in the previous section (java-debug installation)
local bundles = {
    vim.fn.glob(home .. "/.config/java-debug/target/com.microsoft.java.debug.plugin-*.jar", 1),
};

-- This is the new part
vim.list_extend(bundles, vim.split(vim.fn.glob(home .. "/.config/vscode-java-test/server/*.jar", 1), "\n"))

local config = {
    -- cmd = { '~/.jdtls/jdtls-1.9.0/bin/jdtls' },
    cmd = {

        'java', -- or '/path/to/java17_or_newer/bin/java'
        -- depends on if `java` is in your $PATH env variable and if it points to the right version.

        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xmx4g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

        '-javaagent:' .. home .. '/.jdtls/lombok.jar',

        '-jar', vim.fn.glob(home .. '/.jdtls/jdtls-1.9.0/plugins/org.eclipse.equinox.launcher_*.jar'),
        -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
        -- Must point to the                                                     Change this to
        -- eclipse.jdt.ls installation                                           the actual version

        '-configuration', home .. '/.jdtls/jdtls-1.9.0/config_mac',
        -- '-configuration', '/Users/chenyejing/rp/jdtls/config_mac',
        -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
        -- Must point to the                      Change to one of `linux`, `win` or `mac`
        -- eclipse.jdt.ls installation            Depending on your system.


        -- See `data directory configuration` section in the README
        '-data', workspace_dir,
    },
    settings = {
        java = {
            signatureHelp = { enabled = true },
            contentProvider = { preferred = 'fernflower' },
        },
        configuration = {
            runtimes = {
                {
                    name = "Java8",
                    path = home .. "/.config/jvm/java-8/",
                },
                {
                    name = "Java17",
                    path = home .. "/.config/jvm/java-17/",
                },
            }
        },
    },
    on_attach = function(client, bufnr)
        -- require('me.lsp.conf').on_attach(client, bufnr, {
            -- server_side_fuzzy_completion = true,
        -- })

        print("setup_dap")
        jdtls.setup_dap({ hotcodereplace = 'auto' })
        -- jdtls.setup.add_commands()
        -- local opts = { silent = true, buffer = bufnr }
        -- vim.keymap.set('n', "<A-o>", jdtls.organize_imports, opts)
        -- vim.keymap.set('n', "<leader>df", jdtls.test_class, opts)
        -- vim.keymap.set('n', "<leader>dn", jdtls.test_nearest_method, opts)
        -- vim.keymap.set('n', "crv", jdtls.extract_variable, opts)
        -- vim.keymap.set('v', 'crm', [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]], opts)
        -- vim.keymap.set('n', "crc", jdtls.extract_constant, opts)
        -- local create_command = vim.api.nvim_buf_create_user_command
        -- create_command(bufnr, 'W', require('me.lsp.ext').remove_unused_imports, {
        -- nargs = 0,
        -- })
    end,
    init_options = {
        bundles = bundles,
    },
    root_dir = root_dir,
}
require('jdtls').start_or_attach(config)
