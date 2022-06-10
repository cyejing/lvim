vim.g.local_history_width = 35
vim.g.local_history_new_change_delay = 10


-- ui
require('onedark').setup {
    toggle_style_key = '<leader>ts', -- Default keybinding to toggle
    toggle_style_list = { 'darker', 'cool', 'warmer', 'light' }, -- List of styles to toggle between
    style = 'warmer',
}

-- require("dap-install").config("codelldb", {})
