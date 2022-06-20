local M = {}

M.setup = function()
    require("bqf").setup({
        auto_enable = true,
        auto_resize_height = true,
        preview = {
            win_height = 20,
            win_vheight = 20,
            delay_syntax = 50,
            border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        },
        func_map = {
            -- vsplit = "",
            ptogglemode = "z,",
            stoggleup = "",
            pscrolldown = "<C-d>",
            pscrollup = "<C-f>",
        },
        filter = {
            fzf = {
                action_for = {
                    ["ctrl-d"] = "pscrolldown",
                    ["ctrl-f"] = "pscrollup",
                },
                extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
            },
        },
    })

end

return M
