local M = {}

M.setup = function()
    local status_ok, autosave = pcall(require, "autosave")
    if not status_ok then
        vim.notify("autosave not found!")
        return
    end

    autosave.setup({
        enabled = true,
        execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
        events = { "InsertLeave", "TextChanged" },
        conditions = {
            exists = true,
            filename_is_not = {},
            filetype_is_not = {},
            modifiable = true
        },
        on_off_commands = true,
        write_all_buffers = false,
        clean_command_line_interval = 0,
        debounce_delay = 135
    })
end

return M

