local M = {}

M.gitui_toggle = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local gitui = Terminal:new {
        cmd = "gitui",
        hidden = true,
        direction = "float",
        float_opts = {
            border = "none",
            width = 100000,
            height = 100000,
        },
        on_open = function(_)
            vim.cmd "startinsert!"
        end,
        on_close = function(_)
        end,
        count = 99,
    }
    gitui:toggle()
end

local lib = require("nvim-tree.lib")
local view = require("nvim-tree.view")

M.edit_or_open = function()
    -- open as vsplit on current node
    local action = "edit"
    local node = lib.get_node_at_cursor()

    -- Just copy what's done normally with vsplit
    if node.link_to and not node.nodes then
        require('nvim-tree.actions.node.open-file').fn(action, node.link_to)
        view.close() -- Close the tree if file was opened
    elseif node.nodes ~= nil then
        lib.expand_or_collapse(node)
    else
        require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)
        view.close() -- Close the tree if file was opened
    end
end

return M
