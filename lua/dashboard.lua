local text = require "lvim.interface.text"

vim.g.dashboard_default_executive = "telescope"

lvim.builtin.alpha.dashboard.section.header = {
    type = "text",
    val = {
        "                                                        ",
        "                                                        ",
        "                                                        ",
        "                                                        ",
        "                                                        ",
        "                                                        ",
        "                                                        ",
        " ██████╗██╗   ██╗███████╗     ██╗██╗███╗   ██╗ ██████╗  ",
        "██╔════╝╚██╗ ██╔╝██╔════╝     ██║██║████╗  ██║██╔════╝  ",
        "██║      ╚████╔╝ █████╗       ██║██║██╔██╗ ██║██║  ███╗ ",
        "██║       ╚██╔╝  ██╔══╝  ██   ██║██║██║╚██╗██║██║   ██║ ",
        "╚██████╗   ██║   ███████╗╚█████╔╝██║██║ ╚████║╚██████╔╝ ",
        " ╚═════╝   ╚═╝   ╚══════╝ ╚════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝  ",
        "                                                        ",
        "                                                        ",
        "                                                        ",
        "                                                        ",
    },
    opts = {
        position = "center",
        hl = "Identifier",
    },
}

lvim.builtin.alpha.dashboard.section.buttons = {
    entries = {
        { "SPC p",  "  Projects",       "<CMD>Telescope projects layout_config={width=0.6}<CR>" },
        { "SPC ss", "  Recently files", "<CMD>Telescope oldfiles<CR>" },
        { "SPC f",  "  Find File",      "<CMD>Telescope find_files<CR>" },
        { "SPC h",  "  Edit Projects",  "<CMD>edit ~/.cache/lvim/project_nvim/project_history<CR>" },
    },
    opts = {
        hl_shortcut = "Include",
        spacing = 1,
    }
}

local function footer()
    local datetime = os.date("  %Y-%m-%d   %H:%M:%S")
    local version = vim.version()

    local nvim_version_info = ""
    if version ~= nil then
        nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
    end

    return datetime .. nvim_version_info
end

lvim.builtin.alpha.dashboard.section.footer = {
    type = "text",
    val = text.align_center({ width = 0 }, {
        "",
        "",
        "",
        "",
        footer(),
        "",
        "",
        "",
    }, 0.5),
    opts = {
        position = "center",
        hl = "Number",
    },
}
