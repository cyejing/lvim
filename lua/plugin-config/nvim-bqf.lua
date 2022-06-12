local M = {}

M.setup = function()
    require("bqf").setup({
        auto_enable = true,
        auto_resize_height = true,
        preview = {
            win_height = 999,
            win_vheight = 999,
            delay_syntax = 50,
            border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        },
        func_map = {
            vsplit = "",
            ptogglemode = "z,",
            stoggleup = "",
        },
        filter = {
            fzf = {
                action_for = { ["ctrl-s"] = "split" },
                extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
            },
        },
    })

end

return M
