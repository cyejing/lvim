local options = lvim.builtin.bufferline.options
options.close_command = "Bdelete! %d"
options.right_mouse_command = "Bdelete! %d"
options.offsets = {
    {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left",
    },
}
options.diagnostics = "nvim_lsp"
