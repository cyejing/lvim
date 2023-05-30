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
        -- hl = "Label",
        hl = "Identifier",
    },
}

lvim.builtin.alpha.dashboard.section.buttons = {
    entries = {
        { "SPC p",  lvim.icons.ui.Project .. " Projects",       "<CMD>Telescope projects layout_config={width=0.6}<CR>" },
        { "SPC ss", lvim.icons.ui.History .. " Recently files", "<CMD>Telescope oldfiles<CR>" },
        { "SPC f",  lvim.icons.ui.FindFile .. " Find File",     "<CMD>Telescope find_files<CR>" },
        { "n",      lvim.icons.ui.NewFile .. " New File",       "<CMD>ene!<CR>" },
        { "SPC h",  lvim.icons.ui.Gear .. " Edit Projects",     "<CMD>edit ~/.cache/lvim/project_nvim/project_history<CR>" },

    },
    opts = {
        hl_shortcut = "Include",
        spacing = 1,
    }
}

local function now()
    local datetime = os.date("  %Y-%m-%d   %H:%M:%S")
    return datetime
end

local function nvim_version()
    local version = vim.version()
    local nvim_version_info = ""
    if version ~= nil then
        nvim_version_info = "nvim  v" .. version.major .. "." .. version.minor .. "." .. version.patch
    end
    return nvim_version_info
end

local function lvim_version()
    local lvim_version_info = require("lvim.utils.git").get_lvim_version()
    return "lvim 󰘬 " .. lvim_version_info
end

lvim.builtin.alpha.dashboard.section.footer = {
    type = "text",
    val = text.align_center({ width = 0 }, {
        "",
        "",
        "",
        now(),
        lvim_version(),
        nvim_version(),
        "",
        "",
        "",
    }, 0.5),
    opts = {
        position = "center",
        hl = "Number",
    },
}
