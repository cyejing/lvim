vim.g.dashboard_default_executive = "telescope"

lvim.builtin.alpha.dashboard.section.buttons = {
    entries = {
        { "SPC p", "  Projects", "<CMD>Telescope projects<CR>" },
        { "SPC r", "  Recently files", "<CMD>Telescope oldfiles<CR>" },
        { "SPC f", "  Find File", "<CMD>Telescope find_files<CR>" },
        { "SPC h", "  Edit Projects", "<CMD>edit ~/.cache/lvim/project_nvim/project_history<CR>" },
    }
}

lvim.builtin.alpha.dashboard.section.header = {
    type = "text",
    val = {
        "
 ██████╗██╗   ██╗███████╗     ██╗██╗███╗   ██╗ ██████╗
██╔════╝╚██╗ ██╔╝██╔════╝     ██║██║████╗  ██║██╔════╝
██║      ╚████╔╝ █████╗       ██║██║██╔██╗ ██║██║  ███╗
██║       ╚██╔╝  ██╔══╝  ██   ██║██║██║╚██╗██║██║   ██║
╚██████╗   ██║   ███████╗╚█████╔╝██║██║ ╚████║╚██████╔╝
 ╚═════╝   ╚═╝   ╚══════╝ ╚════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝
"
    },
    opts = {
        position = "center",
        hl = "Label",
    },
}

lvim.builtin.alpha.dashboard.section.footer = {
    type = "text",
    val = {
        "",
    },
    opts = {
        position = "center",
        hl = "Number",
    },
}

