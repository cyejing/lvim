local home = os.getenv('HOME')
local root_markers = { 'gradlew', '.git', 'mvnw' }
local root_dir = require('jdtls.setup').find_root(root_markers)
local workspace_dir = home .. '/.jdtls/workspace/' .. vim.fn.fnamemodify(root_dir, ':p:h:t')

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
        }
    },
    root_dir = root_dir,
}
require('jdtls').start_or_attach(config)
